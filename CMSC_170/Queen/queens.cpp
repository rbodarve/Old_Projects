/* The ' N - Queens ' / Eight Queens  Problem :
Here are my solutions to the N-Queens / 8 queens Problem . There are three solutions here .
1.  A solution by simple Backtracking / Recursion . (The only array used in this solution is a 1-d array)
2.  A solution to the N-Queens / Eight Queens Problem WITHOUT RECURSION . (Using Stacks )
3.  Another recursive function with better ( but vague ) heuristics .
      The heuristic was completely my own (as far as I know ) , but a bit arbitrary to some extent .
       Anyway , I was glad to see that it produced results pretty quickly uptil N = 70 or so .
       ( That's on a AMD K-6 Machine with 128 MB Ram. )

IMPORTANT , PLEASE READ ::::

Regarding the display of solutions : The solutions appear in the following format ::
Example : SOLN 1 :  (1,1) (2,5)  (3,8) .....
This means that the queen in the first row must be placed in column 1 , the queen in the
second row must be placed in column 5 , the queen in the third row must be placed in col 8...
and so on ....( obviously , there can only be 1 queen for each column or row ) .

NOTE : Both solutions 2 & 3 implement the famous method of Niklaus Wirth to use 3 boolean arrays
to marks squares already visited . The first solution , though quite economical on memory , is 
very much inefficient as  far as speed is concerned . I put it up because it was the first 
solution which was completely thought of by me .


*** ALL THESE PROGRAMS HAVE BEEN TRIED AND TESTED IN TURBO-CPP ***  
------------------------------------------------------------------------------------ */

//SOLUTION #1

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
 a=(int *)(malloc(sizeof(int)*N));
 printf("\nAll possible Solutions ..  \n");
 printf("\nIn Each of the solutions the Coordinates of the N-Queens are given (Row,Col) .");
 printf("\nNote that the Rows and Colums are numbered between 1 - N :\n"); 
 for(ctr=0;ctr<N;ctr++)
 getPositions(a,0,ctr);
 getchar();
 getchar();
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

/* END OF FIRST PROGRAM*/
--------------------------------------------------------------------------------------

2. PROGRAM FOR N QUEENS PROBLEM WITHOUT RECURSION (Using two stacks instead)

/*EightQueens Program using two Stacks , Stacks are implemented using arrays */

 # include <stdio.h>
 # include <stdlib.h>
 # include <time.h>

 typedef struct  { int x,y;
		    } position ;
 void SolveProblem(int n);
 int N=0;
 void main()
 {printf("\nENTER THE SIZE OF CHESSBOARD ( N ) FOR NxN CHESSBOARD :");
  scanf("%d",&N);
  printf("\nIn Each of the solutions the Coordinates of the N-Queens are given (Row,Col) .");
  printf("\nNote that the Rows and Colums are numbered between 1 - N :\n");
  SolveProblem(N);
  getchar();
 }
 void SolveProblem(int n)
 {
 int counter1,counter2=-1,counter3=-1;
 static int counter=0,choice;
 int d[100][3]={0};
 int *stack2;
 position Position1,Position2,Position3;
 position *head1=(position *)malloc(n*n*sizeof(position));
  stack2=(int *)malloc(n*sizeof(int));
 for(counter1=n-1;counter1>=0;counter1--)
	{ Position1.x=0;
	  Position1.y=counter1;
	  head1[++counter2]=Position1;
	 };
  while(counter2>=0){ Position1=head1[counter2--];
		  while(counter3>=0 && Position1.x<=counter3){
		  Position2.x=counter3;
		  Position2.y=stack2[counter3--];
		  d[Position2.y][0]=0;
		  d[Position2.x+Position2.y][1]=0;
		  d[Position2.x-Position2.y+n][2]=0;};
		  stack2[++counter3]=Position1.y;
		  d[Position1.y][0]=1;
		  d[Position1.x+Position1.y][1]=1;
		  d[Position1.x-Position1.y+n][2]=1;


		if(counter3==n-1)
		  {
		   counter++;
		   printf("\nSOLUTION # %d:",counter);
		   for(counter1=0;counter1<=counter3;counter1++)
		    printf("(%d,%d) " ,counter1+1, stack2[counter1]+1);
		   if(counter%10==0){printf("\nEnter 1 to Continue , 0 to end.");
				     scanf("%d",&choice);
				     if(choice==0)
				     exit(0);
				     };
			 Position2.x=counter3;
		   Position2.y=stack2[counter3--];
		   d[Position2.y][0]=0;
		   d[Position2.x+Position2.y][1]=0;
		   d[Position2.x-Position2.y+n][2]=0;}
	   else{for(counter1=n-1;counter1>=0;counter1--)
	       if(d[counter1][0]==0 && d[Position1.x+1+counter1][1]==0 && 			d[n+Position1.x+1-counter1][2]==0)
		{Position3.x=Position1.x+1;
		 Position3.y=counter1;
		 head1[++counter2]=Position3;
		 };
		   }
	}

  }






3. PROGRAM WITH (At Least Some !) HEURISTICS 

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
 int ctr=0,ctr1,n1;
 printf("\nNumber Of Rows/Cols For NxN Chessboard.");
 scanf("%d",&N);
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
 printf("\n N=%d ",n1==N);
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
int leastval,k=N/2;
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

if(callCounter!=8*k-1)
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
