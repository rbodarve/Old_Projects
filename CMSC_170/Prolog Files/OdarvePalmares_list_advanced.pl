%Odarve, Renaire
%Palmares, Jon Daniel
%Prolog 4 - Advanced Lists
%Date Due: September 5, 2012

split([],N,[],[]).
split([H|T],N,[H|T1],L3) :- H =< N, split(T,N,T1,L3).
split([H|T],N,L2,[H|T2]) :- H > N, split(T,N,L2,T2).
