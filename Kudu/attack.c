#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdbool.h>
#include "print128.c" //for handling __int128
#include <stdlib.h>

//This is all I can do for attack until I can get OpenSSL working.
int main(int argc, char *argv[])
{
	if(argc == 1)
	{
		printf("Run with -d for debug info.\n");
	}

	const char* pubkey = "public.txt";
	const char* privkey = "private.txt";


	__int128 n = 0; //modulo
	long e; //public exponent
	__int128 d = 0; //private exponent
	long p; //prime factor 1
	long q; //prime factor 2

	//ch and dig for use in reading __int128 from files
	char ch;
	int dig;

	time_t startTime; //set before looking for solution
	time_t endTime; //set after finding solution


	//READ VALUES FROM PUBLIC KEY

	FILE *pubfile = fopen(pubkey, "r");

	//get n
	while(!feof(pubfile))
	{
		ch = fgetc(pubfile);
		if(ch == ',')
		{
			break;
		}
		dig = atoi(&ch);
		n *= 10;
		n += dig;
	}
	fscanf(pubfile, "%ld", &e);
	fclose(pubfile);


	//READ VALUES FROM PRIVATE KEY

	FILE *privfile = fopen(privkey, "r");

	//get private exponent
	while(!feof(privfile))
	{
		ch = fgetc(privfile);
		if(ch == ',')
		{
			break;
		}
		dig = atoi(&ch);
		d *= 10;
		d += dig;
	}
	fscanf(privfile, "%ld", &p);
	ch = fgetc(privfile); //store excess comma
	fscanf(privfile, "%ld", &q);
	fclose(privfile);


	//I don't actually check if the argument for debug is -d
	if(argc > 1)
	{
		//from print128.c
		char nStr[41];
		int128toa(nStr, n);
		printf("n (modulo) is %s\n", nStr);
		printf("e (public exponent) is %ld\n", e);
		//from print128.c
		char dStr[41];
		int128toa(dStr, d);
		printf("d (private exponent) is %s\n", dStr);
		printf("p is %ld\n", p);
		printf("q is %ld\n", q);
	}


	//BEGIN ATTACK
	long start;
	long primeGuess;
	__int128 dGuess;
	bool found = false;
	

	//START THE TIMER
	time(&startTime);


	//First, assume one of the primes is 3 (my keygen flaw)
	primeGuess = 3;
	long otherPrime = (long) (n / primeGuess);
	long totient = (primeGuess - 1) * (otherPrime - 1); //small enough to use long
	//find upper bound of loop
	__int128 one = 1;
    __int128 limit = ~(one << 127) ^ 1; //limit ends up being (2^127 - 1) - 1
    long maxTMultiple = limit / totient;
	for(int i = 1; i <= maxTMultiple; i++)
	{
		dGuess = (totient * i + 1) / e; //e is public exponent
		if(dGuess == d)
		{
			found = true;
			break;
		}
	}


	//If we didn't find the private key yet, start looking at primes from sqrt(n)
	if(!found)
	{
		start = sqrt(n);
		start = (start % 2 == 0? start - 1 : start);
		if(argc > 1) //debug
			printf("Square root of n: %ld\n", start);
		primeGuess = start;
		dGuess = d;

		//stop when primeGuess is p or q and dGuess is d.
		while( primeGuess > 3 && ( (primeGuess != p && primeGuess != q) || dGuess != d) )
		{
			primeGuess -= 2;
		}
	}

	time(&endTime);

	printf("Primes are %ld and %ld\n", primeGuess, (long) (n / primeGuess) );
	printf("Runtime: %ld", endTime - startTime);
	printf("Done\n");
	return 0;
}