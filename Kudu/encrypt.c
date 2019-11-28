#include <stdio.h>
#include "print128.c" //for handling __int128
#include <stdlib.h>

//encrypt
int main(int argc, char *argv[])
{
	const char* infile;

	puts("Optional third argument: name of output file after encryption.");

	if(argc < 2)
	{
		puts("ERROR: Please name of public key .txt as an argument.");
		exit(EXIT_FAILURE);
	}

	infile = argv[1];
	__int128 n = 0; //modulo
	long e; //public exponent

	FILE *input = fopen(infile, "r");

	//get n
	char ch;
	int dig;
	while(!feof(input))
	{
		ch = fgetc(input);
		if(ch == ',')
		{
			break;
		}
		dig = atoi(&ch);
		n *= 10;
		n += dig;
	}
	fscanf(input, "%ld", &e);
	fclose(input);

	//from print128.c
	char nStr[41];
	int128toa(nStr, n);
	printf("n (modulo) is %s\n", nStr);
	printf("e (public exponent) is %ld\n", e);

	return 0;
}