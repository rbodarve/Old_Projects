parent(tatay,edith).
parent(nanay,edith).
parent(tatay,manny).
parent(nanay,manny).
parent(tatay,ernie).
parent(nanay,ernie).
parent(tatay,beth).
parent(nanay,beth).

parent(edith,jeff).

parent(manny,kyra).

parent(ernie,cza).
parent(lorie,cza).
parent(ernie,clarisse).
parent(lorie,clarisse).
parent(ernie,jelai).
parent(lorie,jelai).
parent(ernie,pat).
parent(lorie,pat).

parent(danilo,danica).
parent(beth,danica).
parent(danilo,diana).
parent(beth,diana).
parent(danilo,ella).
parent(beth,ella).
parent(danilo,paul).
parent(beth,paul).

male(tatay).
male(manny).
male(ernie).
male(jeff).
male(danilo).
male(paul).

female(nanay).
female(edith).
female(beth).
female(kyra).
female(lorie).
female(cza).
female(clarisse).
female(jelai).
female(pat).
female(danica).
female(diana).
female(ella).

father(X,Y):- male(X), parent(X,Y).
mother(X,Y):- female(X), parent(X,Y).
son(X,Y):- male(X), parent(Y,X).
daughter(X,Y):- female(X), parent(Y,X).
siblings(X,Y):- mother(A,X), mother(A,Y), father(B,X), father(B,Y), X\=Y.
cousins(X,Y):- parent(Z,X), parent(A,Y), siblings(Z,A).
aunt(X,Y):- female(X), cousins(A,Y), parent(X,A).
uncle(X,Y):- male(X), cousins(A,Y), parent(X,A).