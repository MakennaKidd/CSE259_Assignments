main :-
    init_board(InBoard),
	draw_board(InBoard,8,8).
main.

drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :-
    N > 0,
    write(Symbol),
    N1 is N - 1,
    drawSymbol(Symbol, N1).
	

draw_up_bot_boarder(0):- drawSymbol('+',1),nl.
draw_up_bot_boarder(N):- N>0, write('+'),drawSymbol('-',4), 
						N1 is N-1, draw_up_bot_boarder(N1).

					

draw_cell(Board,Line,Col):- pair(Name,Col), mymember(piece(Name-Line, Color, Piece), Board),drawSymbol(' ',1),
							((Color == black,drawSymbol('*',1));(Color == white,drawSymbol(' ',1))),
							pair(Piece,Cap),
							drawSymbol(Cap,1),
							drawSymbol(' ',1).
										
							
							
draw_cell(Board,Line,Col):- pair(Name,Col), \+ (mymember(piece(Name-Line, Color, Piece), Board)), drawSymbol(' ',4).

					
draw_content_cell(Board,Line,0):-  drawSymbol('|',1).
draw_content_cell(Board,Line,C):- C>0,drawSymbol('|',1),draw_cell(Board, Line,C), 
						C1 is C-1, draw_content_cell(Board,Line,C1) .

draw_content_line(Board,Line,Col) :- drawSymbol(Line,1),draw_content_cell(Board,Line,Col),nl.



draw_board(Board,0,Col):- drawSymbol(' ',1), draw_up_bot_boarder(Col),nl, draw_pair.
draw_board(Board,Line,Col):- Line>0, drawSymbol(' ',1),draw_up_bot_boarder(Col), draw_content_line(Board,Line,Col), 
							Line1 is Line-1, draw_board(Board,Line1,Col).

							
draw_pair:- drawSymbol(' ',4), drawSymbol('a',1),
			drawSymbol(' ',4), drawSymbol('b',1),
			drawSymbol(' ',4), drawSymbol('c',1),
			drawSymbol(' ',4), drawSymbol('d',1),
			drawSymbol(' ',4), drawSymbol('e',1),
			drawSymbol(' ',4), drawSymbol('f',1),
			drawSymbol(' ',4), drawSymbol('g',1),
			drawSymbol(' ',4), drawSymbol('h',1).		

pair(a,8).
pair(b,7).
pair(c,6).
pair(d,5).
pair(e,4).
pair(f,3).
pair(g,2).
pair(h,1).
pair(rook,r).
pair(bishop,b).
pair(king,k).
pair(pawn,p).
pair(queen,q).
pair(night,n).
	
mymember(X, [X|_]).
mymember(X, [_|L]) :- mymember(X, L).
	
	
init_board( [
 	state(white, WhiteKing, WhiteKingRook, WhiteQueenRook),
	state(black, BlackKing, BlackKingRook, BlackQueenRook),
	piece(a-8, black, rook  ), piece(b-8, black, night ),
	piece(c-8, black, bishop), piece(d-8, black, queen ),
	piece(e-8, black, king  ), piece(f-8, black, bishop),
	piece(g-8, black, night ), piece(h-8, black, rook  ),
	piece(a-7, black, pawn  ), piece(b-7, black, pawn  ),
	piece(c-7, black, pawn  ), piece(d-7, black, pawn  ),
	piece(e-7, black, pawn  ), piece(f-7, black, pawn  ),
	piece(g-7, black, pawn  ), piece(h-7, black, pawn  ),
	piece(a-1, white, rook  ), piece(b-1, white, night ),
	piece(c-1, white, bishop), piece(d-1, white, queen ),
	piece(e-1, white, king  ), piece(f-1, white, bishop),
	piece(g-1, white, night ), piece(h-1, white, rook  ),
	piece(a-2, white, pawn  ), piece(b-2, white, pawn  ),
	piece(c-2, white, pawn  ), piece(d-2, white, pawn  ),
	piece(e-2, white, pawn  ), piece(f-2, white, pawn  ),
	piece(g-2, white, pawn  ), piece(h-2, white, pawn  ) ]).