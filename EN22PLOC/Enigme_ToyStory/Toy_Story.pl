% Nom : PREMAKUMAR 
% Prénom : Samya 
% Numéro étudiant : 15600051

person(buzz, 5).
person(woody, 10).
person(rex, 20).
person(jambon, 25).

ponts(Passage, TempsTotal):-
  findall(Person-Temps, person(Person, Temps), Gauche),
  ponts(Gauche, [], Passage),
  findall(Temps, member([Temps|_], Passage), LTemps),
  sumlist(LTemps, TempsTotal).

ponts([P1-T1, P2-T2], _, [[T, [P1-P2]]]):-
  T is max(T1, T2).
ponts(Gauche, Droit, [[LT, [P1-P2]],[RT, [P3]]|Passage]):-
  select(P1-T1, Gauche, MGauche1),
  select(P2-T2, MGauche1, MGauche2),
  LT is max(T1, T2),
  select(P3-RT, [P1-T1,P2-T2|Droit], MDroit),
  ponts([P3-RT|MGauche2], MDroit, Passage).

solution(M) :- ponts(M, 60).