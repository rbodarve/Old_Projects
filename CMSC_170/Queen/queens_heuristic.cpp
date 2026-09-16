/* SOLUTION #3 : N-Queens with a (home-grown) heuristic for column ordering.
   Also uses Wirth's three boolean arrays to mark attacked squares. The
   heuristic orders the candidate columns so that solutions are usually found
   quickly, reportedly up to N = 70 or so.

   BUG FIX vs. the original : the local variable n1 was declared but never
   assigned, so it held garbage and the search never ran. It is now set to N
   after reading the board size. */

# include <stdio.h>
# include <stdlib.h>
# include <time.h>
# include <math.h>
int N;  //For N * N ChessBoard
void printArray(int a[]);
void getPositions(int ,int);
void assignPriority();
void assignSecondOrderPriority();
void motionorder(const int);
int  d[500][3]={0};
int *a1;
int ctr2;
int *a2;
long int **priority_array,**secondOrderPriority;long int **motionOrder;
int main()
{
 int ctr=0,n1;
 printf("\nNumber Of Rows/Cols For NxN Chessboard.");
 scanf("%d",&N);
 if(N<1 || N>250) { printf("\nN must be between 1 and 250 (bounded by the d[500][3] marker array).\n"); return 1; }
 n1=N;
 a1=(int *)(malloc(sizeof(int)*N));
 a2=(int *)(malloc(sizeof(int)*N));
 priority_array=(long int **)malloc(N*sizeof(long int *));
 for(ctr=0;ctr<N;ctr++) priority_array[ctr]=(long int *)malloc(N*sizeof(long int));
 secondOrderPriority=(long int **)malloc(N*sizeof(long int *));
 for(ctr=0;ctr<N;ctr++) secondOrderPriority[ctr]=(long int *)malloc(N*sizeof(long int));
 motionOrder=(long int **)malloc(N*sizeof(long int *));
 for(ctr=0;ctr<N;ctr++) motionOrder[ctr]=(long int *)malloc(N*sizeof(long int));
 assignPriority();
 printf("\nAll possible Solutions .. (Row,Col) \n");
 assignSecondOrderPriority();
 printf("\n N=%d ",n1);
 motionorder(n1);
 printf("\nIn Each of the solutions the Coordinates of the N-Queens are given (Row,Col) .");
 printf("\nNote that the Rows and Colums are numbered between 1 - N :\n");
 N=n1;
 for(ctr=n1-1;ctr>=0;ctr--)
 getPositions(0,motionOrder[0][ctr]);

 getchar();
 getchar();
 return 0;
}
void printArray(int a[])
{
  int i,choice;
  static int counter=0;

 printf("\nSOLN %d :",++counter);
 for(i=0;i<N;i++)
 printf("%d ",a[i]+1);

 if(counter%10==0) {printf("\nEnter 0 to exit, 1 to continue.");
 scanf("%d",&choice);
 if(choice==0)
 exit(0);
 }
}
void getPositions(int colno,int val)
{ int ctr1;
  if(colno==0)
  for(ctr1=0;ctr1<N;ctr1++) a1[ctr1]=0;
  a1[colno]=val;
  d[N+val-colno][0]=1;
  d[val][1]=1;
  d[val+colno][2]=1;
  if(colno==N-1)
	{
	   printArray(a1);
	   d[N+val-colno][0]=0;
	   d[val][1]=0;
	   d[val+colno][2]=0;
	 }
   else
	for(ctr1=N-1;ctr1>=0;ctr1--)
		{ctr2=(int)motionOrder[colno+1][ctr1];
		 if(d[ctr2][1]!=1)
		if(d[ctr2+colno+1][2]!=1)
		if(d[N+ctr2-colno-1][0]!=1)
		if(ctr2>=0 && ctr2<N)
		getPositions(colno+1,ctr2);
		}



   d[N+val-colno][0]=0;
   d[val][1]=0;
   d[val+colno][2]=0;
}

void assignPriority()
{long int counter1,counter2,v1,v2;
for(counter1=0;counter1<=N/2;counter1++)
for(counter2=0;counter2<=N/2;counter2++)
priority_array[counter1][counter2]=0;
for(counter1=0;counter1<N;counter1++)
for(counter2=0;counter2<N;counter2++)
{if((v1=counter1+counter2+1)>N) v1=2*N-v1;
 v2=N-abs(counter1-counter2) ;
 priority_array[counter1][counter2]=2*N+v1+v2-1;

 }
printf("\n");

}

void assignSecondOrderPriority()
{static int callCounter=0;
long int leastval;
int k=N/2;
long int row,col,valueToPlace,counter1,counter2;
callCounter++;
for(row=0;row<N;row++)
	for(col=0;col<N;col++)
	   {valueToPlace=0;
	    for(counter1=0;counter1<N;counter1++)
	    valueToPlace+=priority_array[counter1][col]+priority_array[row][counter1];
	    counter1=0;
	    while(row+counter1<N && col+counter1<N)
	    {valueToPlace+=priority_array[row+counter1][col+counter1];
	     counter1++;
	     };
	     counter1=0;
	    while(row+counter1<N && col-counter1>=0)
	    {valueToPlace+=priority_array[row+counter1][col-counter1];
	     counter1++;
	     };
	     counter1=0;
	    while(row-counter1>=0 && col+counter1<N)
	    {valueToPlace+=priority_array[row-counter1][col+counter1];
	     counter1++;
	     };
	     counter1=0;
	    while(row-counter1>=0 && col-counter1>=0)
	    {valueToPlace+=priority_array[row-counter1][col-counter1];
	     counter1++;
	     };
	    secondOrderPriority[row][col]=valueToPlace-5*priority_array[row][col];
	    if(row==0 && col==0) leastval = valueToPlace ;
	    else if(leastval>valueToPlace) leastval=valueToPlace  ;
	    }

if(callCounter<8*k-1)
{ for(counter1=0;counter1<N;counter1++)
    for(counter2=0;counter2<N;counter2++)
    priority_array[counter1][counter2]=secondOrderPriority[counter1][counter2]-leastval;
   assignSecondOrderPriority();
 }

}


void motionorder(const int N1)
{
long int counter1,counter2,temp1,val1,p;
for(counter1=0;counter1<N1;counter1++)
 for(counter2=0;counter2<N1;counter2++)
  motionOrder[counter1][counter2]=counter2;
for(counter1=0;counter1<N1;counter1++)
{ for(counter2=1;counter2<N1;counter2++)
	{ temp1=secondOrderPriority[counter1][counter2];
	  val1=motionOrder[counter1][counter2];
	  p=counter2;
	  while(temp1<secondOrderPriority[counter1][motionOrder[counter1][p-1]] && p-1>=0)
	  {motionOrder[counter1][p]=motionOrder[counter1][p-1];p=p-1;};
	  motionOrder[counter1][p]=val1;
	}
}

}
