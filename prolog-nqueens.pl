%====================================================================
% Checks for no conflict
%====================================================================
% V: row index for new column to be added to existing solution list
% P: existing solution list
% D: distance between V and head of P, initially D will be 1, but
% will be incremented during recursion
% H: the row value of the head of the list P
% RD: current row - current head column row, used to check that
% there is no diagonal conflict with the current head column
nc(V,P,D) :-
    P = [H|T],
    H =\= V,
    RD is abs(V - H),
    RD =\= D,
    D1 is D + 1,
    nc(V,T,D1).

% Base case: When solution list is empty, no conflict exists
nc(_,[],_).


%====================================================================
% Solves for N Queens Problem
%====================================================================
% Top level solve/2 function calls recursive solve/3 helper function
% with initiated parameters. The empty list is the temporary
% solution which initially should be empty.
% N: number of queens / board size
% QP: Queen positions, a solution in which each index in the list
% represents a column and the value held in that index represents 
% the row for that column.
solve(N,QP) :-
    solve(N,[],QP).

% This helper function calculates the last index and recursively
% solves problem one column at a time. Each potential solution
% is checked for no conflict with the existing solution thus far.
solve(N,QPT,QP) :-
    NM1 is N - 1,
    between(0,NM1,V),
    nc(V,QPT,1),
    QPT1 = [V|QPT],
    solve(N,QPT1,QP).

% Base case: If the length of the temporary solution list QPT is
% equal to N, then a solution has been found and QPT is matched
% to QP.
solve(N,QPT,QP) :-
    length(QPT,LL),
    LL = N,
    QP = QPT.


%====================================================================
% Displays the solution QP on a chess board
%====================================================================
% QP: Queen positions, a solution in which each index in the list
% represents a column and the value held in that index represents 
% the row for that column.
display_solution(QP) :-
    length(QP,N),
    NM1 is N - 1,
    display_col_headers(NM1),
    display_row_separator(NM1),
    forall(between(0,NM1,R), display_row(R,QP)),
    writeln("").

% Displays one row one at a time.
% R: current row.
display_row(R,QP) :-
    length(QP,N),
    NM1 is N - 1,
    write(R),
    write("|"),
    forall(between(0,NM1,C), display_square(R,C,QP)),
    writeln(""),
    display_row_separator(NM1).

% Displays one individual square on the board. If the current
% square is has a queen piece, an "X" is diplayed on the board.
% Else, the square is empty when displayed.
% R: current row
% C: current column
% V: row of column that is a solution in QP
display_square(R,C,QP) :-
    nth0(C,QP,V),
    ( R =:= V
    -> write(" X|")
    ;  write("  |")
    ).

% Displays the indexes of all columns
% N: last column index
display_col_headers(N) :-
    write(" "),
    forall(between(0,N,R), display_col(R)),
    writeln("").

% Displays the current column index
% R: current column index
display_col(R) :-
    write("  "),
    write(R).

display_row_separator(N) :-
    write(" "),
    forall(between(0,N,_), write("---")),
    writeln("-").

display_row_separator(0) :-
    writeln("").
    