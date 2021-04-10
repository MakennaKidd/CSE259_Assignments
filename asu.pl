
/*
	Project 1 - asu.pl
	Professor Osburn
	Due: 3-03-2021 at 11:59PM
	Team Information included in README.txt
*/


/* Drawing symbol 
 -------------------------- */
drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- 
	N>0, 
	write(Symbol), 
	N1 is N-1, 
	drawSymbol(Symbol, N1). 

/* Drawing H Line 
 -------------------------- */
drawHLine(0):-
	write('\n').
	
drawHLine(N) :-
	N > 0,
	write('-'),
	N1 is N-1, drawHLine(N1).

	
/* Drawing V Space - Line
 -------------------------- */
drawVSpace(0, LineLen).
drawVSpace(N, LineLen) :-
	N > 0,
	write('|'),
	write('\n'),
	N1 is N - 1,
	drawVSpace(N1, LineLen).


/* ASU Function 
 -------------------------- */
 asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
	(\+integer(LeftRightMargin); 
	\+integer(BottomTopMargin); 
	\+integer(SpaceBetweenCharacters); 
	\+integer(FontSize); 
	SpaceBetweenCharacters < 1; 
	FontSize < 1; 
	LeftRightMargin < 1; 
	BottomTopMargin < 1), 
	!,
	write('All arguments must be positive integers.').
  
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
	integer(LeftRightMargin),
	integer(BottomTopMargin),
	integer(SpaceBetweenCharacters),
	integer(FontSize),
	SpaceBetweenCharacters >= 1,
	FontSize >= 1,
	LeftRightMargin >= 1,
	BottomTopMargin >= 1,
	TextWidth is FontSize * 3,
	TextHeight is FontSize * 5,
	LineLen is TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2,
	drawHLine(LineLen + 2),
	drawVSpace(BottomTopMargin, LineLen),
	draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, 0),
	drawVSpace(BottomTopMargin, LineLen),
	drawHLine(TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2 + 2).

/* Draw Function 
 -------------------------- */	
draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, TextHeight).	
draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, Line) :-
	Line < TextHeight, write('|'), drawSymbol(' ', LeftRightMargin),
	drawA(TextWidth, TextHeight, FontSize, Line, 0), drawSymbol(' ', LeftRightMargin),  
	write('|'), write('\n'), 
	NextLine is Line + 1, 
	draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, NextLine).
	

/* Draw Letter A  
 -------------------------- */
drawA(TextWidth, TextHeight, FontSize, Line, TextWidth).

drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= 0, Line < FontSize); 
		(Line >= 2 * FontSize, Line < 3 * FontSize) 
	),
		Col < 3 * FontSize,
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= FontSize, Line < 2 * FontSize); 
		(Line >= 3 * FontSize, Line < 4 * FontSize); 
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
	(
		(Col >= 0, Col < FontSize);
		(Col >= 2 * FontSize, Col < 3 * FontSize)
	),
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(	
		(Line >= FontSize, Line < 2 * FontSize); 
		(Line >= 3 * FontSize, Line < 4 * FontSize);
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
		Col >= 1 * FontSize, Col < 2 * FontSize,
		drawSymbol(' ', FontSize),
		NextCol is Col + FontSize, 
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).

/* Draw Letter S 
 -------------------------- */
drawS(TextWidth, TextHeight, FontSize, Line, TextWidth).

drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= 0, Line < FontSize); 
		(Line >= 2 * FontSize, Line < 3 * FontSize) 
	),
		Col < 3 * FontSize,
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= FontSize, Line < 2 * FontSize); 
		(Line >= 3 * FontSize, Line < 4 * FontSize); 
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
	(
		(Col >= 0, Col < FontSize);
		(Col >= 2 * FontSize, Col < 3 * FontSize)
	),
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
	(	
		(Line >= FontSize, Line < 2 * FontSize); 
		(Line >= 3 * FontSize, Line < 4 * FontSize);
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
		Col >= 1 * FontSize, Col < 2 * FontSize,
		drawSymbol(' ', FontSize),
		NextCol is Col + FontSize, 
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).


/* Draw Letter U 
 -------------------------- */
drawU(TextWidth, TextHeight, FontSize, Line, TextWidth).

drawU(TextWidth, TextHeight, FontSize, Line, Col) :-

		(Line >= 0, Line < 4 * FontSize), 
		Col >= 0,
		Col < FontSize,
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-

		(Line >= 0, Line < 4 * FontSize),
		Col >= 2 * FontSize,
		Col >= 3 * FontSize,
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).
  
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-

		(Line >= 0, Line < 4 * FontSize),
		Col >= 1 * FontSize,
		Col < 2 * FontSize,
		drawSymbol(' ', FontSize),
		NextCol is Col + FontSize, 
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).
		
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-

		(Line >= 4 * FontSize, Line < 5 * FontSize),
		Col < 3 * Fontsize,
		drawSymbol('*', FontSize),
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).