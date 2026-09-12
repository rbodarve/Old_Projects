%write() is built-in Prolog function
%write each element of the list [H|T]
traverse([H|T]):-write(H),write('\n'),traverse(T).

%get the first element of the list [X|L]
firstof([X|L],X).

%checks if the item X is a member of the list [Y|L]
ismember(X,[X|L]).
ismember(X,[Y|L]) :- ismember(X,L).

%checks if the list is in ascending order
asc([]).
asc([A]).
asc([A|[B|T]]):- A=<B, asc([B|T]).

%removes repeating elements of the 1st parameter and stores it in the 2nd parameter
unique([],[]).
unique([H|T],U):-member(H,T),unique(T,U).
unique([H|T],[H|U]):- \+member(H,T),unique(T,U).

%delete X from [Y|L] to get Mnew
dodelete(X,[],[]).
dodelete(X,[X|L],M) :- dodelete(X,L,M).
dodelete(X,[Y|L],Mnew) :- not(X=Y), dodelete(X,L,M), Mnew is [Y|M].

%appends the 2nd parameter to the 1st parameter
lappend([],X,X).
lappend([A|X],Y,[A|Z]):-lappend(X,Y,Z).

%shows the list weekdays and its contents
weekdays([monday,tuesday,wednesday,thursday,friday]).
weekends([saturday,sunday]).

%get the last element of the list [X|L]
lastof([X],X).
lastof([X|L],X2) :- lastof(L,X2).

%get the number of elements of the list [X|L]
lengthof([],0).
lengthof([X|L],N) :- lengthof(L,N2), N is N2 + 1.