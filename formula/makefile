COMPILER = gcc
CCFLAGS = -Wall

formula: formula.h formula.c nCr.h nCr.s
	$(COMPILER) $(CCFLAGS) -o formula formula.c	nCr.s

clean:
	rm -f formula
	rm -f *.o