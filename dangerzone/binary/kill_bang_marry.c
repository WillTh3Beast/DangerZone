
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define BUFFER_SIZE 24

const char *agents[] = {
   "Archer",
   "Lana",
   "Pam",
   "Cyril",
   "Cheryl",
   "Malory",
   "Krieger",
   "Ray"
};


void questions()
{
   char c[2];
   for (int i=0; i< sizeof(agents)/sizeof(agents[0]); i++)
   {
      printf("(K)ill (B)ang (M)arry - %s\n>>> ", agents[i]);
      gets(c);
   }

   printf("Answers Saved!\n\n");
   printf("Continue...");
   c[0] = getchar();
}


void results(const char *firstname, const char *lastname)
{
   int i, j;
   int r;

   printf("PRINTING AGENT ANSWERS\n");
   for (i=0; i<sizeof(agents)/sizeof(agents[0]); i++)
   {
      printf("\n\n%s - Answers\n***", agents[i]);
      for (j=0; j<sizeof(agents)/sizeof(agents[0]); j++)
      {
         r = rand() % 3;
	 if ( i != j )
	 {
	    switch(r)
	    {
	       case 0:
		  printf(" %s - KILL, ", agents[j]);
	          break;
	       case 1:
		  printf(" %s - BANG, ", agents[j]);
	          break;
	       default:
		  printf(" %s - MARRY, ", agents[j]);
	          break;
	    }
	 } else {
	    switch(r)
	    {
	       case 0:
		  printf(" %s %s - KILL, ", firstname, lastname);
	          break;
	       case 1:
		  printf(" %s %s  - BANG, ", firstname, lastname);
	          break;
	       default:
		  printf(" %s %s - MARRY, ", firstname, lastname);
	          break;
	    }
	 
	 }
      }
   }
}

void kill_bang_marry()
{
   char firstname[BUFFER_SIZE];
   char lastname[BUFFER_SIZE];

   printf("\n\nAttempting to location your position...\n\n");
   printf("Where are you? Oh there you are! %p %p\nReady to play!\n\n\n", (void*)firstname, (void*)lastname);

   printf("#####################\n");
   printf("# KILL, BANG, MARRY #\n");
   printf("#####################\n");
   printf("LOGIN\n");
   printf("First Name: ");
   gets(firstname);
   printf("Last Name: ");
   gets(lastname);

   questions();
   results(firstname, lastname);

}


int main(){
   char choice[2];
   printf("Do you want to play kill, bang, marry? (y/n)\n");
   gets(choice);

   if ('y' == choice[0])
   {
      kill_bang_marry();
   }
   printf("\n\n\nBye bye!\n");
   return 0;
}
