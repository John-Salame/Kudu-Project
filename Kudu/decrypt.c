#include <stdio.h>
#include "print128.c" //for handling __int128
#include <stdlib.h>

//decrypt
int main(int argc, char *argv[])
{
	const char* infile;

	puts("Optional third argument: name of output file after decryption.");
	
	if(argc < 2)
	{
		puts("ERROR: Please name of private key .txt as an argument.");
		exit(EXIT_FAILURE);
	}

	infile = argv[1];
	__int128 d = 0; //private exponent
	long p; //prime factor 1
	long q; //prime factor 2

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
		d *= 10;
		d += dig;
	}
	fscanf(input, "%ld", &p);
	ch = fgetc(input); //store excess comma
	fscanf(input, "%ld", &q);
	fclose(input);

	//from print128.c
	char dStr[41];
	int128toa(dStr, d);
	printf("d (private exponent) is %s\n", dStr);
	printf("p is %ld\n", p);
	printf("q is %ld\n", q);
}