% Nom : Premakumar 
% Prénom : Samya 
% Numéro étudiant : 15600051

% A1 B1   C1 D1
% A2 B2   C2 D2

% A3 B3   C3 D3
% A4 B4   C4 D4


% affiche les valeurs du sudoku : 
affiche_sudoku(A, B, C, D) :- write(' '), write(A), write('  '), write(B), write('  '), write(C), write('  '), write(D), nl.

% Initialise les nombres : 
num(1). num(2). num(3). num(4).

% Determine si les colonnes et/ou lignes sont différents : 
different(A, B, C, D) :-
num(A), num(B), num(C), num(D), 
 A=\=B, A=\=C, A=\=D,
 B=\=C, B=\=D,
 C=\=D.

% Fonction principale : 
sudoku(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4)
:- solution(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4),
	affiche_sudoku(A1, B1, C1, D1), % Affiche les résultats, calculés par le prédicats solution (en-bas)
	affiche_sudoku(A2, B2, C2, D2),
	affiche_sudoku(A3, B3, C3, D3),
	affiche_sudoku(A4, B4, C4, D4).

% Trouve la solution du sudoku : 
solution(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4):-
	different(A1, B1, C1, D1), % Cherche les differences entre les valeurs du A1 et D4
	different(A2, B2, C2, D2), % Par lignes 
	different(A3, B3, C3, D3), 
	different(A4, B4, C4, D4), 
	different(A1, A2, A3, A4), % Par colonnes
	different(B1, B2, B3, B4), 
	different(C1, C2, C3, C4), 
	different(D1, D2, D3, D4), 
	different(A1, A2, B1, B2), % Par carré 
	different(C1, C2, D1, D2),
	different(A3, A4, B3, B4),
	different(C3, D3, C4, D4).