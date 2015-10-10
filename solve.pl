:- module(parse, [solve/2]).

:- use_module(library(clpfd)).

sudoku(Rows) :-
  append(Rows, Vs), Vs ins 1..9,
  maplist(all_distinct, Rows),
  transpose(Rows, Columns),
  maplist(all_distinct, Columns),
  Rows = [A,B,C,D,E,F,G,H,I],
  blocks(A, B, C), blocks(D, E, F), blocks(G, H, I),
  maplist(label, Rows).

blocks([], [], []).
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :-
  all_distinct([A,B,C,D,E,F,G,H,I]),
  blocks(Bs1, Bs2, Bs3).

replace_unknown("?", _) :- !.
replace_unknown(E, E).

replace_unknowns(Row, OutRow) :-
  maplist(replace_unknown, Row, OutRow).


solve(Data, Solution):-
  Puzzle = Data.puzzle,
  maplist(replace_unknowns, Puzzle, SudokuPuzzle),
  sudoku(SudokuPuzzle),
  Solution = SudokuPuzzle.
