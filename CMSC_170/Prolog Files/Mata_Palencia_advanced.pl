%Mata, Diana P.
%Palencia, May Ann E.
%Prolog 4 - Advanced Lists
%Date Due: September 16, 2011

cutlast([H], []) :- !.
cutlast([H|T], L2) :- cutlast(T, H2), putfirst(H, H2, L2).



size([],0).
size([H|T],N) :- size(T,N1), N is N1+1 .
trim([H|T],0,[]).
trim([H|T],X,[H|T1]) :- size([H|T],N), N>X, cutlast([H|T],M), trim(M,X,[H|T1]).
trim([H|T],X,[H|T]) :- size([H|T],N), N<X;N=X.



%min no. in the list
getmin([],0).
getmin([X],X).
getmin([H|T],M) :- getmin(T,R), M is min(H,R).

%beg_small
beg_small(L1,L2) :- getmin(L1,S), del(S, L1, L3), putfirst(S,L3,L2).

putfirst(S, L2, [S|L2]).

del(X, [X|L], L).
del(X, [A|L], [A|L1]) :- del(X,L,L1).



split([],N,[],[]).
split([H|T],N,[H|T1],L3) :- H =< N, split(T,N,T1,L3).
split([H|T],N,L2,[H|T2]) :- H > N, split(T,N,L2,T2).



sortasc([],[]).
sortasc([H],[H]).
sortasc([H,B|T],S) :-  split1([H,B|T],L1,L2), sortasc(L1,S1), sortasc(L2,S2), merge(S1,S2,S).

split1([],[],[]).
split1([H],[H],[]).
split1([H,B|T],[H|T1],[B|T2]) :-  split1(T,T1,T2).

merge(H,[],H).
merge([],B,B).
merge([H|T1],[B|T2],[H|M]) :-  H =< B, merge(T1,[B|T2],M).
merge([H|T1],[B|T2],[B|M]) :-  H > B,  merge([H|T1],T2,M).