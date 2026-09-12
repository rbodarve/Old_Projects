%Programmers: Renaire Odarve
%Exercise 1: My Family
%Objective: To understand and practice the basics of Prolog Programming
%Date Due: August 8, 2012
%Time Due: 5:30PM

%these are the facts
male(renaire).
male(ryan).
male(reonell).
male(victor).
male(bantilan).
male(intoy).
male(jolo).
male(amancio).
male(lolo).
female(bing).
female(julie).
female(matos).
female(francisca).
female(lilian).
female(tomasa).
female(love).
female(lola).
parent(victor,renaire).
parent(victor,ryan).
parent(victor,reonell).
parent(victor,lilian).
parent(francisca,renaire).
parent(francisca,ryan).
parent(francisca,reonell).
parent(francisca,lilian).
parent(bantilan,victor).
parent(bantilan,amancio).
parent(bantilan,julie).
parent(lola,victor).
parent(lola,amancio).
parent(lola,julie).
parent(matos, francisca).
parent(matos, bing).
parent(matos, tomasa).
parent(lolo, francisca).
parent(lolo, bing).
parent(lolo, tomasa).
parent(julie, love).
parent(bing, jolo).
parent(tomasa, intoy).

%these are rule
father(X,Y):-parent(X,Y), male(X).
mother(X,Y):-parent(X,Y), female(X).
son(X,Y):-parent(Y,X), male(X).
daughter(X,Y):- parent(Y,X), female(X).
brother(X,Y) :- male(X), father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).
sister(X,Y) :- female(X), father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).
sibling(X,Y) :- father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).
aunt(X,Y):- female(X), parent(F,X), parent(G,Y), parent(F,G).
uncle(X,Y):- male(X), parent(F,X), parent(G,Y), parent(F,G).
cousin(X,Y):- parent(A,X), parent(B,Y), sibling(A,B).

