/**
 * AUTHOR: Shreya Bajpai
 * CREATED: July 10, 2017
 * FILE: formula.c
 * CLASS: Computer Architecture
 * PROFESSOR: Brian M. Russell
 */

#include "nCr.h"
#include <stdio.h> 
#include <stdlib.h> 
#include <time.h> 
#include <string.h>
#include <sys/time.h> 

int main (int argc, const char * argv[]) { 
  if (argc != 2) { 
      printf("ERROR: Please give one integer argument.\n");
      return 1;
  }

	struct timeval start, end;
  int i;  
  int comp;
 	int pow = atoi(argv[1]);

 	if (strcmp(argv[1], "-h") == 0){
  	  printf("Usage: formula <positive integer>\n");
   		return 0;
 	}

  if (pow < 0) { 
      printf("ERROR: Please enter a valid positive integer.\n");
      return 1;
  }

  if (pow > 12) { 
      printf("(1 + x)^%i = ERROR: Overflow.\n", pow); 
      return 0; 
  }

  if(pow == 0){
    gettimeofday(&start, NULL);
    printf("(1 + x)^%i = 1 \n", pow);
    gettimeofday(&end, NULL);
    printf("Time Required: %ld microseconds\n", (end.tv_usec - start.tv_usec)); 
    return 0; 
  }

  else { 
    gettimeofday(&start, NULL);
    for (i = 1; i <= pow; i++) {
      comp = nCr(pow, i);
      if (comp == -1 || comp == 0) { 
        printf("(1 + x)^%i = ERROR: Multiplication Overflow.\n", pow); 
        return 0; 
        break;
      } 
      else {
        if (i == 1) {
          printf("(1 + x)^%i = 1", pow);
        }
        else { 
          printf(" + %i*x^%i", comp, i);
        }
      }
    }
    printf("\n");
  }
  gettimeofday(&end, NULL);
  printf("Time Required: %ld microseconds\n", ((end.tv_sec * 1000000 + end.tv_usec) - (start.tv_sec * 1000000 + start.tv_usec)));
  return 0;
}




