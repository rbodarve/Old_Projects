:- dynamic known/3.
%expert system on Jutsu Types and users in Naruto

%beging here!!!
start(X) :- asserta(known(a,b,c)), abolish(known/3), asserta(known(a,b,c)), ninja(X).

%the heroes- 3rd level of the diagram
ninja(kisame) :- discipline(suiton), bloodline(none), strength(strong), !.
ninja(tobirama) :- discipline(suiton), bloodline(present), stamina(high), !.
ninja(kakashi) :- discipline(raiton), bloodline(none), intelligence(high), !.
ninja(darui) :- discipline(raiton), bloodline(none), handseals(fast), !.
ninja(sasuke) :- discipline(katon), bloodline(present), speed(fast), !.
ninja(sarutobi) :- discipline(katon), bloodline(present), intelligence(high), !.
ninja(akatsuchi) :- discipline(doton), bloodline(none), speed(fast), !.
ninja(jirobo) :- discipline(doton), bloodline(none), strength(strong), !.
ninja(naruto) :- discipline(fuuton), bloodline(none), stamina(high), !.
ninja(temari) :- discipline(fuuton), bloodline(none), intelligence(high), !.
ninja(guy) :- discipline(hand2hand), bloodline(none), stamina(high), !.
ninja(lee) :- discipline(hand2hand), bloodline(none), intelligence(high), !.
ninja(tenten) :- discipline(weapon), bloodline(none), handseals(fast), !.
ninja(asuma) :- discipline(weapon), bloodline(present), handseals(fast), !.
ninja(itachi) :- discipline(doujutsu), bloodline(present), speed(fast), !.
ninja(madara) :- discipline(doujutsu), bloodline(present), strength(strong), !.
ninja(jiraiya) :- discipline(nondoujutsu), bloodline(none), strength(strong), !.
ninja(kurenai) :- discipline(nondoujutsu), bloodline(none), speed(fast), !.

%discipline - 2nd level of the diagram
discipline(suiton) :- jutsu(ninjutsu), weakness(doton).
discipline(raiton) :- jutsu(ninjutsu), weakness(fuuton).
discipline(katon) :- jutsu(ninjutsu), weakness(suiton).
discipline(doton) :- jutsu(ninjutsu), weakness(raiton).
discipline(fuuton) :- jutsu(ninjutsu), weakness(katon).
discipline(hand2hand) :- jutsu(taijutsu), weakness(nondoujutsu).
discipline(weapon) :- jutsu(taijutsu), weakness(doujutsu).
discipline(doujutsu) :- jutsu(genjutsu), weakness(hand2hand).
discipline(nondoujutsu) :- jutsu(genjutsu), weakness(weapon).

%major element jutsu - 1st level of the diagram
jutsu(ninjutsu) :- handseals(fast), chakra(high).
jutsu(genjutsu) :- intelligence(high).
jutsu(taijutsu) :- speed(fast), strength(strong).

%all possible properties - used to describe each node
intelligence(X) :- ask(intelligence, X).
strength(X) :- ask(strength, X).
speed(X) :- ask(speed, X).
chakra(X) :- ask(chakra, X).
stamina(X) :- ask(stamina, X).
handseals(X) :- ask(handseals, X).
weakness(X) :- ask(weakness, X).
bloodline(X) :- ask(bloodline, X).


%creates the questions dynamically:

ask(A, V) :- 
write(A:V), %ask user
write('?: '), 
read(R), %get the answer
asserta(known(R, A, V)), %remember it
R==yes. %succeed or fail

ask(A, V) :- 
known(_, A, V), %fail if false
!, fail.

ask(A, V) :- known(yes, A, V), %succeed if true
!. %stop looking

known(a, a, a).
