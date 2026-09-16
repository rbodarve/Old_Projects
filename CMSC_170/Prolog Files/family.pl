%these are the facts
male(renaire).
male(ryan).
male(reonell).
male(victor).
female(francisca).
female(lilian).
parent(victor,renaire).
parent(victor,ryan).
parent(victor,reonell).
parent(victor,lilian).
parent(francisca,renaire).
parent(francisca,ryan).
parent(francisca,reonell).
parent(francisca,lilian).

%these are rule
father(X,Y):-parent(X,Y), male(X).
mother(X,Y):-parent(X,Y), female(X).
grandparent(X,Z) :- parent(X,Y) , parent(Y,Z).
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(Z,Y), ancestor(X,Z).
brother(X,Y) :- male(X), father(F,X), father(F,Y), mother(M,X), mother(M,Y), \+(X=Y).

somebodysparent(X):-father(X,_).
somebodysparent(X):-mother(X,_).
somebodysparent(X):-father(X,_); mother(X,_).

somebodysparent(X):-father(X,_);mother(X,_).
hasnochild(X):- \+parent(X,_).
hasnochild(X):- \+parent(X,_).
