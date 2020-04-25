% SWI-Prolog
% Rules: 1 is a wall, 0 - road, 3 - end point
% Labirint must be surrounded by walls(1)
% From current position you can move up, down, left, right

labirint([[1, 1, 1, 1, 1, 1, 1], 
          [1, 0, 0, 0, 0, 0, 1],
          [1, 1, 0, 1, 1, 0, 1],
          [1, 0, 0, 0, 0, 0, 1],
          [1, 1, 1, 0, 1, 1, 1],
          [1, 3, 0, 0, 0, 0, 1],
          [1, 1, 1, 1, 1, 1, 1]]).

start(1, 1). 

print_matr([], _):-!.
print_matr([Head|Tail], SepFunctor):-
    write(Head), call(SepFunctor),
  	print_matr(Tail, SepFunctor).

get_matrix_element(Matr, RowIndex, ColumnIndex, Element):-
    nth0(RowIndex, Matr, Row),
	nth0(ColumnIndex, Row, Element).

% repl_list(OldList, ColNum, NewEl, ResList)
% will replace element in colNum position to NewEl
repl_list([], _Col, _El, []).

repl_list([_|Tail], 0, El, [El|TailResult]):-
   	repl_list(Tail, -1, El, TailResult), !.

repl_list([Head|Tail], Col, El, [Head|TailResult]):-
    NewCol is Col - 1,
   	repl_list(Tail, NewCol, El, TailResult).

% repl_matr will replace element in matrix
repl_matr(Matr, Row, Col, El, NewMatr) :-
    nth0(Row, Matr, RowToChange),
    repl_list(RowToChange, Col, El, NewRow),
    repl_list(Matr, Row, NewRow, NewMatr).


next_step(Matrix, CurRow, CurCol, ResMatr) :-
    (   Ind1 is CurRow + 1, find_path(Matrix, Ind1, CurCol, ResMatr));
    (   Ind2 is CurRow -1, find_path(Matrix, Ind2, CurCol, ResMatr));
    (   Ind3 is CurCol + 1, find_path(Matrix, CurRow, Ind3, ResMatr));
    (   Ind4 is CurCol -1, find_path(Matrix, CurRow, Ind4, ResMatr)).


find_path(Matrix, CurRow, CurCol, ResMatr) :-
    get_matrix_element(Matrix, CurRow, CurCol, CurEl),
    CurEl == 3, 
    ResMatr = Matrix, !.

find_path(Matrix, CurRow, CurCol, ResMatr) :-
    get_matrix_element(Matrix, CurRow, CurCol, CurEl),
    CurEl == 0,
    repl_matr(Matrix, CurRow, CurCol, 4, NewMatr),
    next_step(NewMatr, CurRow, CurCol, ResMatr).



/** <examples>
?- labirint(Matr),
start(Row, Col),
find_path(Matr, Row, Col, ResMatr),
repl_matr(ResMatr, Row, Col, 2, FinalAnsw),
print_matr(FinalAnsw, nl)

*/
