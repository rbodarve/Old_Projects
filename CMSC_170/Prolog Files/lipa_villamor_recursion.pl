hasfibonacci(1,1).
hasfibonacci(2,1).
hasfibonacci(X,Z):- X>2, A is X-1,B is X-2, hasfibonacci(A,C), hasfibonacci(B,D), Z is C+D.

raisedTo(_,0,1).
raisedTo(X,Y,Z):- Y>0, A is Y-1, raisedTo(X,A,B), Z is X*B.
