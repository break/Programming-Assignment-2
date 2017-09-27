#include <stdio.h>
#include <stdlib.h> //calloc(size_t nitems [# of elements], size_t size [size of elements])
#include <string.h> 
#include "mystery.h"

/**
 * AUTHOR: Shreya Bajpai
 * CREATED: July 19, 2017
 * FILE: mystery.c
 * CLASS: Computer Architecture
 * PROFESSOR: Brian M. Russell
 */

	/* 
	NOTE TO GRADERS: 
	Fibbonacci and this entire code DOES NOT account for any error checks because there were none in the .s file. 

	However, the compiler cannot handle fibonacci inputs greater than 46, since it exceeds the bit limit. Professor Russell said it would be
	alright if we don't include error checks.
	*/

	long int num[200]; //Global variable.comm name, size, alignment --> .comm num, 1600, 32 --> 32/4 = 4; 1600/4 = 400

	//Since we are using 'r' registers we are working in and with 64-bit registers

	long int add (long int x, long int y) { 
		/* 
		* [In mystery.s]
		* [L8-13] Save base polong inter by pushing it. Then, we copy stack polong inter. 
		*
		* [L14-L17] Args x and y are passed in registers %rdi and %rsi, rather than on the stack. These are
		* the 64-bit versions of %edi and %esi. This eliminates the need to fetch args from memory.
 		*
		* [L18-L22] The two numbers are then moved to %rdx and %rax, added, and %rbp is popped (returned)
		*/
		return x + y; 
	}

	long int fibb (long int input) { 
		/* Save previous base polong inter and then copy new stack polong inter long into base polong inter */
		long int output; //[L35-L36] Push second parameter long into return polong inter [L35] and we create space for local data [L36]

		/* 
		* L38 - Store the space you've created in L36 as the param 1 passed long into the function 
		* L39 - Save this new variable ito the return output register (%rax)
		* L40 - Tests to see if this num[]'s fib val has been calculated
		* L41 - Jumps to .L4 (CL38) or directly to output (CL57) if -1 is equal to the finVal fib #
		*/
		if (num[input] == -1) { //According to L41, if equal, then go long into .L4 (L46-L51)
			long int curr = -1;  //L47 - Create new var and set it equal to -1
			if (input == 0) {  //L48 
				curr = 0; //L50 (Jump to .L7)
			}
			else if (input == 1) { //Enter here because of L49 (.L6 - L52-L56) and compare if input equals 1
				curr = 1; //L55 (Jump to .L7)
			}
			else { //If input is not equal to 1 (L54, then jump to .L8: L57-L70)
				curr = add(fibb(input - 2), fibb(input - 1)); //L58-70
			}
			//.L7 [L71-L78]
			if (num[input] == -1) { //L74 - If equal, then perform L76-78
				num[input] = curr; //L76-L78
			}
			//L75 - JNE to .L9
			output = num[input]; //L79-81: Sets %rax (output) to num[input]
		}

		else { //.L5
			output = num[input];
		}
		return output; //L88
	}

	int main (int argc, char ** argv) { 
		long int input = atoi(argv[1]); //L106 creates new long int var; L112-113
		int i = 0; //L115
		while (i <= 199) { //[.L11: L122-137] L123 compares var created in L115 to 199
			num[i] = -1; //Goes to .L12 since i < 199 (L117-L121)
			i++; //Increment
		}
		printf("Value:%ld\n", fibb(input)); //L125-133
		return 0; //L134-L136
	}