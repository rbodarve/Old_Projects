:- dynamic known/3.
%expert system on memory

%begin here!!!
start(X) :- asserta(known(a,b,c)),abolish(known/3), asserta(known(a,b,c)), memory(X).

%the memories - 3rd level of the diagram
memory(ddrsdram) :- subgroup(dram), clockspeed(depends), !.
memory(rdram) :- subgroup(dram), clockspeed(nonupgradable), !.
memory(sdram) :- subgroup(dram), clockspeed(upgradable),!.

memory(fourtcell) :- subgroup(sram), numcell(fourcell), !.
memory(sixtcell) :- subgroup(sram), numcell(sixcell), !.
memory(tftcell) :- subgroup(sram), numcell(none), !.

memory(maskromA) :- subgroup(maskrom), sizebytes(onemb), !.
memory(maskromB) :- subgroup(maskrom), sizebytes(fourmb), !.

memory(c080) :- subgroup(eprom), sizemem(onemb), !.
memory(c160) :- subgroup(eprom), sizemem(twomb), !.
memory(c320) :- subgroup(eprom), sizemem(fourmb), !.

memory(usb) :- subgroup(eeprom), storage(tenmbtotengb), usedfor(pc_laptops), !.
memory(sdcard) :- subgroup(eeprom), storage(tenmbtotengb), usedfor(cd_cams), !.

%subgroups - 2nd level of the diagram
subgroup(dram) :- class(ram), capacity(large), prosspeed(slow), cost(low), refresh(available), power(high).
subgroup(sram) :- class(ram), capacity(small), prosspeed(fast), cost(high), refresh(notavailable), power(low).
subgroup(maskrom) :- class(rom), erasability(nonerasable), writeability(writable).
subgroup(eprom) :- class(rom), erasability(erasable), writeability(writable).
subgroup(eeprom) :- class(rom), erasability(erasable), writeability(nonwritable).

%major memory classes - 1st level of the diagram
class(ram) :- volatility(volatile).
class(rom) :- volatility(none).

%all possible properties - used to describe each node
volatility(X) :- ask(volatility, X).
erasability(X) :- ask(erasability,X).
writeability(X) :- ask(writeability, X).
capacity(X) :- ask(capacity, X).
prosspeed(X) :- ask(prosspeed, X).
cost(X) :- ask(cost, X).
refresh(X) :- ask(refresh, X).
power(X) :- ask(power, X).
storage(X) :- ask(storage, X).
usedfor(X) :- ask(usedfor, X).
sizemem(X) :- ask(sizemem, X).
sizebytes(X) :- ask(sizebytes, X).
numcell(X) :- ask(numcell, X).
clockspeed(X) :- ask(clockspeed, X).

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