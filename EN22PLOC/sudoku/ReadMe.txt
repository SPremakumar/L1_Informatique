% Nom : PREMAKUMAR
% Prénom : Samya 
% Numéro étudiant : 15600051

EXPLICATION : 
Comment résoudre les sudokus avec Prolog ?

Premièrement, nous avons créer le prédicat "affiche_sudoku". Il permet d'afficher les valeurs du sudoku résolu, avec des espaces entres eux (write(' ')), et en colonne c'est à dire à la ligne (nl). Deuxièmement, nous allons initialiser les nombres.

Troisièmement, nous avons créer le prédicat "different". Il permet de trouver les différences entre les colonnes et les lignes. L'operateur '=\=' permet d'évaluer X et Y, et réussit s'il ne sont pas égaux.

Quatrièmement, nous avons créer le prédicat "solution" en utilisant le prédicat "different" (définit précédemment). Celui - ci (le prédicat solution), permet de trouver les différences pour toutes les valeurs, entre les lignes, entre les colonnes et par carré.

Et pour finir, nous avons créer le prédicat "sudoku", c'est la fonction principale, car il permet de trouver et afficher les valeurs du sudokus.



UTILISATION : 
Vous avez le choix avec plusieurs grilles de sudoku : 4x4; 6x6; 9x9 

Pour utiliser, il faut d'abord taper le prédicat, ensuite inserer les valeurs du sudoku : c'est à dire les nombres (de 1 à 9), et des cases vides (qu'il faut écrire _,) chacune espacée. L'interprête de Prolog se s'agira de trouver la solution, et de vous l'afficher. 

?- sudoku(_, 1, _, 2, 4, _, _, _, _, _, _, 3, 1, _, 2, _).



