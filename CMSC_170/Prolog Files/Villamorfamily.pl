%there are facts
male(ernesto).
male(willie).
male(jorge).
male(clint).
male(junjun).
male(arnel).
male(edu).
male(dongkoy).
female(lilia).
female(alice).
female(aime).
female(cel).
female(charmz).
female(connie).
female(ivy).
female(lotlot).
parent(lilia,clint).
parent(lilia,cel).
parent(lilia,charmz).
parent(lilia,connie).
parent(ernesto,clint).
parent(ernesto,celeste).
parent(ernesto,charmz).
parent(ernesto,connie).
parent(willie,edu).
parent(willie,ivy).
parent(aime,edu).
parent(aime,ivy).
parent(jorge,lotlot).
parent(jorge,dongkoy).
parent(jorge,cecil).
parent(alice,lotlot).
parent(alice,cecil).
parent(alice,dongkoy).

%these are rules
father(X,Y):- parent(X,Y), male(X).
mother(X,Y):- parent(X,Y), female(X).
son(X,Y):- parent(X,Y), male(Y).
daughter(X,Y):- parent(X,Y), female(Y).
sibling(X,Y):- father(F,X), father(F,Y), mother(M,X), mother(M,Y)\+(X=Y). 
brother(X,Y):- male(X), father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).
sister(X,Y):- female(X), father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).
aunt(X,Y):- female(X),  parent(F,Y), sister(X,F),\+(X=Y). 
uncle(X,Y):- male(X),  parent(F,Y), brother(X,F),\+(X=Y).
cousin(X,Y):- parent(P,Y), parent(O,X), sibling(O,P),\+(X=Y).


%Programmer: Carmelyn M. Villamor
%Exercise1: My Family
%Objective: To understand and practice the basics of Prolog programming.
%Date Due: August 08, 2012
%Time Due: 5:30 PM
