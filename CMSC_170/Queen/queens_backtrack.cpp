/* SOLUTION #1 : The N-Queens problem by simple backtracking / recursion.
   The only array used in this solution is a 1-D array.
   Economical on memory, but inefficient on speed compared to the stack
   and heuristic versions.

   Output format ::  SOLUTION # k : (1,c1) (2,c2) (3,c3) .....
   meaning the queen in row 1 goes in column c1, the queen in row 2 in
   column c2, and so on. Rows and columns are numbered 1 - N. */

# include <stdio.h>
# include <stdlib.h>
# include <time.h>
int N;  //For N * N ChessBoard
int flag;
void printArray(int a[]);        /* Just to Print the Final Solution */
void getPositions(int a[],int n1,int n2);  /* The Recursive Function */
int main()
{int *a;
 int ctr=0;
 printf("\nTHE N QUEENS PROBLEM ");
 printf("\nNumber Of Rows(N) For NxN Chessboard.");
 scanf("%d",&N);
 if(N<1) { printf("\nN must be >= 1.\n"); return 1; }
 a=(int *)(malloc(sizeof(int)*N));
 printf("\nAll possible Solutions ..  \n");
 printf("\nIn Each of the solutions the Coordinates of the N-Queens are given (Row,Col) .");
 printf("\nNote that the Rows and Colums are numbered between 1 - N :\n");
 for(ctr=0;ctr<N;ctr++)
 getPositions(a,0,ctr);
 getchar();
 getchar();
 return 0;
}
void printArray(int a[])
{
  int i,choice;
  static int counter=0;
  counter++;
 printf("\nSOLUTION # %d :",counter);
 for(i=0;i<N;i++)
 printf("(%d,%d) ",i+1,a[i]+1);
 if(counter%10==0) { printf("\nEnter 0 to exit , 1 to continue .");
		     scanf("%d",&choice);
		     if(choice==0) exit(0);
		     };
}
void getPositions(int a1[],int colno,int val)
{ int ctr1,ctr2;
  a1[colno]=val;
  if(colno==N-1)
	{ printArray(a1) ; return;
	 };
  for(ctr1=0;ctr1<N;)
  {      /* This Loop Finds Suitable Column Numbers , in the NEXT ROW */
   for(ctr2=0;ctr2<=colno;ctr2++)
   if(a1[ctr2]==ctr1 || (colno+1-ctr2)*(colno+1-ctr2)==(ctr1-a1[ctr2])*(ctr1-a1[ctr2]))
   goto miss1;
   getPositions(a1,colno+1,ctr1);
   miss1:
   ctr1++;
   }
}
