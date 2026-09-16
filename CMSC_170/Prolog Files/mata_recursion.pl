%Name: Diana Mata
%LabExer - Prolog 2 - Recursion
%August 26, 2011


%fibonacci
hasfibonacci(0,0).
hasfibonacci(1,1).

hasfibonacci(X,Z) :- X>1, A is X-2, B is X-1, hasfibonacci(A,C), hasfibonacci(B,D), Z is C+D.


%base & exponent
raisedTo(P,1,P).
raisedTo(_,0,1).

raisedTo(P,Q,R) :- Q>1, L is Q-1, raisedTo(P,L,N), R is P*N.