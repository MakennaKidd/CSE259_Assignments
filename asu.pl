

/*	Project 1 - asu.pl
	Professor Osburn
	Due: 3-10-2021 at 11:59PM
	Team Information included in README.txt */


/* Draw Symbol Function
 -------------------------- */
 
drawSymbol(Symbol, 0). 
drawSymbol(Symbol, N) :- 
	N>0, 
	write(Symbol), 												
	N1 is N-1, 
	drawSymbol(Symbol, N1).  

/* Drawing H - Line Function
 ----------------------------- */
 
drawHLine(0):-
	write('\n').
	
drawHLine(N) :-
	N > 0,
	write('-'),
	N1 is N-1, drawHLine(N1).

	
/* Drawing V Space - Line Function
 ----------------------------------- */
 
drawVSpace(0, LineLen). 
drawVSpace(N, LineLen) :-
	N > 0,
    write('|'),
	drawSymbol(' ', LineLen),
	write('|'),
	write('\n'),
	N1 is N - 1,
	drawVSpace(N1, LineLen).


/* ASU Function 
 ---------------- */

asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
	integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize),
	SpaceBetweenCharacters >= 1, FontSize >= 1, LeftRightMargin >= 1, BottomTopMargin >= 1,
	TextWidth is FontSize * 3, TextHeight is FontSize * 5,
	LineLen is TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2,
	drawHLine(LineLen + 2), drawVSpace(BottomTopMargin, LineLen),
	draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, 0),
	drawVSpace(BottomTopMargin, LineLen),
	drawHLine(TextWidth * 3 + SpaceBetweenCharacters * 2 + LeftRightMargin * 2 + 2).
	

/* Draw Function 
 ----------------- */	
 
draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, TextHeight). /*Base case*/	
draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, Line) :-
	Line < TextHeight, 
	write('|'),  													/*writes vertical line before "A"*/
	drawSymbol(' ', LeftRightMargin),								/*adds spaces between Left Margin and "A"*/
	
	drawA(TextWidth, TextHeight, FontSize, Line, 0), 				/*draw "A"*/
	drawSymbol(' ', SpaceBetweenCharacters),  						/*adds spaces between "A" and "S" */

	
	drawS(TextWidth, TextHeight, FontSize, Line, 0),				/*draw "S"*/ 
	drawSymbol(' ', SpaceBetweenCharacters), 						/*adds spaces between "S" and "U"*/
	
	
	drawU(TextWidth, TextHeight, FontSize, Line, 0), 				/*draw "U"*/
	drawSymbol(' ', LeftRightMargin),  								/*adds spaces between letter "U" and Right Margin*/
	write('|'), write('\n'), 										/*writes vertical line after "U" and adds a new line for each "|" after. */
	NextLine is Line + 1, 											/*This increments the "|" symbold after each new line*/
	draw(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, TextWidth, TextHeight, FontSize, NextLine).	/*recursivley call*/


/* Draw Letter A  
 -----------------*/
 
drawA(TextWidth, TextHeight, FontSize, Line, TextWidth). 			/*Base case*/
drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= 0, Line < FontSize); 								/*These Lines deal with lines 0 - 2 * FontSize within the A Letter in order to print star symbols. */
		(Line >= 2 * FontSize, Line < 3 * FontSize) 				/*These lines establish the full 3 columns - rows that are all filled with star symbols.*/
	),
		Col < 3 * FontSize,											/*This handles all 3 columns to work with the lines to print star symbols.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= FontSize, Line < 2 * FontSize); 					/*These Lines deal with lines Selected FontSize - 5 * FontSize within the A Letter in order to print star symbols. */
		(Line >= 3 * FontSize, Line < 4 * FontSize); 				/*These are the functions where it prints out the sides of the A with star symbols*/
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
	(
		(Col >= 0, Col < FontSize);									/*These handles with columns 0 FontSize - 3 to work with the lines to print star symbols.*/
		(Col >= 2 * FontSize, Col < 3 * FontSize)
	),
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawA(TextWidth, TextHeight, FontSize, Line, Col) :-
	(	
		(Line >= FontSize, Line < 2 * FontSize); 					/*These Lines deal with lines Selected FontSize - 5 * FontSize within the S Letter in order to print empty spaces. */
		(Line >= 3 * FontSize, Line < 4 * FontSize);
		(Line >= 4 * FontSize, Line < 5 * FontSize)
	),
		Col >= 1 * FontSize, Col < 2 * FontSize,					/*These columns deal with columns other than one and less than 2 to work with the lines above and only print empty spaces.*/
		drawSymbol(' ', FontSize),									/*Prints blank spaces for established columns above.*/
		NextCol is Col + FontSize, 
		drawA(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
	
/* Draw Letter S 
 ----------------- */
 
drawS(TextWidth, TextHeight, FontSize, Line, TextWidth). 			/*Base case*/
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
	(
		(Line >= 0, Line < FontSize); 								/*These Lines deal with lines Selected 0 FontSize - 5 * FontSize within the S Letter in order to print star symbols. */
		(Line >= 2 * FontSize, Line < 3 * FontSize); 
		(Line >= 4 * FontSize, Line < 5 * FontSize) 
	),
		Col < 3 * FontSize,											/*This column deals with all * FontSize to work with the lines to print star symbols.*/
		drawSymbol('*', FontSize),									/*These are the functions where it prints out the sides of the A with star symbols*/
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= FontSize, Line < 2 * FontSize),					/*These Lines deal with lines Selected FontSize - 2 * FontSize within the S Letter in order to print star symbols. */
		Col >= 0, Col < FontSize,									/*This column deals with columns 0-FontSize to work with the lines to print star symbols.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
		
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= FontSize, Line < 2 * FontSize),					/*These Lines deal with lines Selected FontSize - 2 * FontSize within the S Letter in order to print empty spaces. */
		Col >= FontSize, Col < 3 * FontSize, 						/*This column deals with columns FontSize - 3 to work with the lines to print empty spaces.*/
		drawSymbol(' ', FontSize),									/*Prints empty spaces for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
	
drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 3 * FontSize, Line < 4 * FontSize),				/*These Lines deal with lines Selected 3-4 * FontSize within the S Letter in order to print star symbols. */
		Col >= 2 * FontSize, Col < 3 * FontSize,					/*This column deals with columns 2-3 * FontSize to work with the lines to print star symbols.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/

drawS(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 3 * FontSize, Line < 4 * FontSize),				/*These Lines deal with lines Selected 3-4 * FontSize within the S Letter in order to print star symbols. */
		Col >= 0, Col < 2 * FontSize,								/*This column deals with columns 0-2 * FontSize to work with the lines to print empty spaces.*/
		drawSymbol(' ', FontSize),									/*Prints empty spaces for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawS(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/

	
/* Draw Letter U 
 ----------------- */
 
drawU(TextWidth, TextHeight, FontSize, Line, TextWidth). 			/*Base case*/
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 0, Line < 4 * FontSize),							/*These Lines deal with lines Selected 0 - 4 * FontSize within the U Letter in order to print star symbols. */
		Col >= 0, Col < FontSize,									/*This column deals with columns 0-FontSize to work with the lines to print empty spaces.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 0, Line < 4 * FontSize),							/*These Lines deal with lines Selected 0 - 4 * FontSize within the U Letter in order to print star symbols. */
		Col >= 2 * FontSize, Col < 3 * FontSize,					/*This column deals with columns 2-3 * FontSize to work with the lines to print stars symbol.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 0, Line < 4 * FontSize),							/*These Lines deal with lines Selected 0 - 4 * FontSize within the U Letter in order to print star symbols. */
		Col >= 1 * FontSize, Col < 2 * FontSize,					/*This column deals with columns 1-2 * FontSize to work with the lines to print empty spaces.*/				
		drawSymbol(' ', FontSize),									/*Prints empty space for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
  
drawU(TextWidth, TextHeight, FontSize, Line, Col) :-
		(Line >= 4 * FontSize, Line < 5 * FontSize),				/*These Lines deal with lines Selected 4-5 * FontSize within the U Letter in order to print star symbols. */
		Col < 3 * FontSize,											/*This column deals with all 3 * FontSize columns to work with the lines to print stars symbol.*/
		drawSymbol('*', FontSize),									/*Prints star symbols for above values within rows-columns*/
		NextCol is Col + FontSize,
		drawU(TextWidth, TextHeight, FontSize, Line, NextCol).		/*recursivley call*/
	
/* End of Program! */