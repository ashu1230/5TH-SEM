#include <stdio.h>
#include<conio.h> 

int main()  
{
  
  int Array[50], i, N;
 
  printf("\nPlease Enter Number of elements in an array:- ");
  scanf("%d", &N);
  
 
  printf("\nPlease Enter %d elements of an Array \n", N);
  for (i = 0; i < N; i++)
   {
     scanf("%d", &Array[i]);
   }     
 
  printf("\n Elemenst in this Array are :\n");
  for (i = 0; i < N; i++)
  {
    
 	printf("%d\t", Array[i]);
  }     
 
  getch();
}


