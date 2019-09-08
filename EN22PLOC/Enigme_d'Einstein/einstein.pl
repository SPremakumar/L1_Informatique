% Nom : PREMAKUMAR 
% Prénom : Samya 
% Numéro étudiant : 15600051

gauche(X,Y,L) :- append(_,[X,Y|_],L).

voisin(X,Y,L) :- gauche(X,Y,L) ; gauche(Y,X,L).

resoudre(Maisons) :- length(Maisons,5),
	member([rouge,anglais,_,_,_],Maisons),               % Anglais vit dans la maisons rouge  
	member([_,suedois,_,_,chien],Maisons),               % Le suedois possède le chien 
	member([_,danois,the,_,_],Maisons),                  % Le danois boit du thé
	gauche([verte,_,_,_,_],[blanche,_,_,_,_],Maisons),   % La maison verte est voisine avec la maison blanche 
	member([verte,_,cafe,_,_],Maisons),                  % Le propriétaire de la maison verte boit du café 
	member([_,_,_,pallmall,oiseaux],Maisons),            % Le fumeur de pallmall possède des oiseaux
	member([jaune,_,_,dunhill,_],Maisons),               % Le propriétaire de la maison jaune fume des dunhill 
	Maisons=[_,_,[_,_,lait,_,_],_,_], 				     % La personne qui boit du lait vit au centre
	Maisons=[[_,norvegien,_,_,_],_,_,_,_],               % Le norvegien vit dans la premiere maison
	voisin([_,_,_,blend,_],[_,_,_,_,chat],Maisons),      % La personne qui fume des blend vit à côté de celui qui possède un chat  
	voisin([_,_,_,_,cheval],[_,_,_,dunhill,_],Maisons),  % La personne qui possède un cheval vit à côté de celui qui fume des dunhill
	member([_,_,biere,bluemaster,_],Maisons),            % La personne qui boit des bieres, fume également des bluemasters
	member([_,allemand,_,prince,_],Maisons),             % Allemand fume des princes 
	voisin([_,norvegien,_,_,_],[bleue,_,_,_,_],Maisons), % Le norvegien vit a côté de la maison bleue 
	voisin([_,_,_,blend,_],[_,_,eau,_,_],Maisons),       % La personne qui fume des blends vit à côté de la personne qui boit de eau 
	member([_,_,_,_,poisson],Maisons).                   % Qui est le propriétaire qui possède le poisson