# N-Queens Problem Solver in Prolog

This is a Prolog implementation for solving the classic **N-Queens Problem**. The problem consists of placing **N queens** on an **NxN chessboard** such that no two queens can attack each other. This implementation uses **backtracking** and a **conflict-checking** method to find solutions.

## Features

- **Conflict Checker (nc/3)**: Ensures no two queens are in the same row, column, or diagonal.
- **Backtracking Solver (solve/2)**: Solves the N-Queens problem recursively by trying to place queens column by column and checking for conflicts.
- **Solution Display (display_solution/1)**: Prints the board with queens placed (denoted by an **X**) and empty spaces.

## Usage

1. Load the program into SWI-Prolog.
   
   ```prolog
   ?- [nqueens].
2. To find a solution for a given `N`, query:

   ```prolog
   ?- solve(N, QP).
- `N` is the size of the board (also the number of queens) that you want to solve for.

- `QP` is the list that will store the queen positions, where each index represents a column and the value at that index represents the row of the queen.

3. To display a solution on the chessboard:

    ```prolog
    ?- solve(N, QP), display_solution(QP).
    
- This will output the board with queens placed in valid positions.

## Example

- Below is an example of the program being run.

    ```prolog
    ?- solve(8, QP), display_solution(QP).
       0  1  2  3  4  5  6  7
     -------------------------
    0|  |  |  |  |  |  |  | X|
     -------------------------
    1|  | X|  |  |  |  |  |  |
     -------------------------
    2|  |  |  | X|  |  |  |  |
     -------------------------
    3| X|  |  |  |  |  |  |  |
     -------------------------
    4|  |  |  |  |  |  | X|  |
     -------------------------
    5|  |  |  |  | X|  |  |  |
     -------------------------
    6|  |  | X|  |  |  |  |  |
     -------------------------
    7|  |  |  |  |  | X|  |  |
     -------------------------
    QP = [3, 1, 6, 2, 5, 7, 4, 0] ;
    
       0  1  2  3  4  5  6  7
     -------------------------
    0|  |  |  |  |  |  |  | X|
     -------------------------
    1|  | X|  |  |  |  |  |  |
     -------------------------
    2|  |  |  |  | X|  |  |  |
     -------------------------
    3|  |  | X|  |  |  |  |  |
     -------------------------
    4| X|  |  |  |  |  |  |  |
     -------------------------
    5|  |  |  |  |  |  | X|  |
     -------------------------
    6|  |  |  | X|  |  |  |  |
     -------------------------
    7|  |  |  |  |  | X|  |  |
     -------------------------
    QP = [4, 1, 3, 6, 2, 7, 5, 0].

## Notes
- The program uses recursive backtracking to find a solution.

- The **display_solution/1** predicate prints the board where each queen is represented by an **X**.

- If you want to find multiple solutions, you can use backtracking by pressing `;` in the query prompt after a solution is found to show another solution. To stop finding solutions press `.`

## Requirements

- SWI-Prolog (or any other Prolog environment that supports standard Prolog predicates).
