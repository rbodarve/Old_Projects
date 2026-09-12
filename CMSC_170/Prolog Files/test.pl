%expert system on Jutsu Types and users in Naruto

%beging here!!!
start(X) :- asserta(known(a,b,c)), abolish(known/3), asserta(known(a,b,c)), ninja(X).

%the heroes– 3rd level of the diagram
ninja(kisame) :- discipline(suiton), bloodline(none), !.
ninja(tobirama) :- discipline(suiton), bloodline(present), !.
ninja(kakashi) :- discipline(raiton), bloodline(none), !.
ninja(darui) :- discipline(raiton), bloodline(none), !.
ninja(sasuke) :- discipline(katon), bloodline(present), !.
ninja(sarutobi) :- discipline(katon), bloodline(present), !.
ninja(akatsuchi) :- discipline(doton), bloodline(none), !.
ninja(jirobo) :- discipline(doton), bloodline(none), !.
ninja(naruto) :- discipline(fuuton), bloodline(none), !.
ninja(temari) :- discipline(fuuton), bloodline(none), !.
ninja(guy) :- discipline(hand2hand), bloodline(none), !.
ninja(lee) :- discipline(hand2hand), bloodline(none), !.
ninja(tenten) :- discipline(weapon), bloodline(none), !.
ninja(asuma) :- discipline(weapon), bloodline(present), !.
ninja(itachi) :- discipline(doujutsu), bloodline(present), !.
ninja(madara) :- discipline(doujutsu), bloodline(present), !.
ninja(jiraiya) :- discipline(nondoujutsu), bloodline(none), !.
ninja(kurenai) :- discipline(nondoujutsu), bloodline(none), !.

%discipline – 2nd level of the diagram
discipline(suiton) :- jutsu(ninjutsu), weakness(doton).
discipline(raiton) :- jutsu(ninjutsu), weakness(fuuton).
discipline(katon) :- jutsu(ninjutsu), weakness(suiton).
discipline(doton) :- jutsu(ninjutsu), weakness(raiton).
discipline(fuuton) :- jutsu(ninjutsu), weakness(katon).
discipline(hand2hand) :- jutsu(taijutsu), weakness(nondoujutsu).
discipline(weapon) :- jutsu(taijutsu), weakness(doujutsu).
discipline(doujutsu) :- jutsu(genjutsu), weakness(hand2hand).
discipline(nondoujutsu) :- jutsu(genjutsu), weakness(weapon).

%major element jutsu – 1st level of the diagram
jutsu(ninjutsu) :- handseals(fast), chakra(high).
jutsu(genjutsu) :- intelligence(high).
jutsu(taijutsu) :- speed(fast), strength(strong).

%all possible properties – used to describe each node
intelligence(X) :- ask(intelligence, X).
strength(X) :- ask(strength, X).
speed(X) :- ask(speed, X).
chakra(X) :- ask(chakra, X).
stamina(X) :- ask(stamina, X).
handseals(x) :- ask(handseals, X).
weakness(x) :- ask(weakness, X).
bloodline(x) :- ask(bloodline, X).


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
