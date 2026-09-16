%1 - the list [H|T] has the average A
count([],0).
count([_|T],C) :- count(T,C1), C is C1 + 1.

sum([],0).
sum([H|T],S) :- sum(T,S1), S is S1+H.

hasaverage([],0).
hasaverage([H|T],A) :- count([H|T],Co), sum([H|T],Su), A is Su / Co.


%2 - the sum of the positive elements in the list [H|T] is P
sumpositive([H],H) :- H>0.
sumpositive([H|T],P) :- H>0, sumpositive(T,P1), P is H+P1.
sumpositive([H|T],P) :- H<0, sumpositive(T,P).


%3 - the sum of each element squared in the list is P
sumsquare([],0).
sumsquare([H|T],S) :- sumsquare(T,S1), S is S1 + (H * H).


%4 - should write only the elements on the even positions
even([H|T]) :- write(H), evenpositions(T).
evenpositions([_|T]) :- even(T).


%5 - the list [H|T] has the maximum element M
getmax([H], H).
getmax([H|T], M) :- getmax(T, M1), M is max(H, M1).