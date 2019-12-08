#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdbool.h>
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


	long n = 0; //modulo
	int e; //public exponent
	long d = 0; //private exponent
	int p; //prime factor 1
	int q; //prime factor 2

	time_t startTime; //set before looking for solution
	time_t endTime; //set after finding solution


	//READ VALUES FROM PUBLIC KEY

	FILE *pubfile = fopen(pubkey, "r");

	fscanf(pubfile, "%ld", &n);
	fgetc(pubfile); //store excess comma
	fscanf(pubfile, "%d", &e);
	fclose(pubfile);


	//READ VALUES FROM PRIVATE KEY

	FILE *privfile = fopen(privkey, "r");

	//get private exponent
	fscanf(privfile, "%ld", &d);
	fgetc(privfile);
	fscanf(privfile, "%d", &p);
	fgetc(privfile);
	fscanf(privfile, "%d", &q);
	fclose(privfile);


	//I don't actually check if the argument for debug is -d
	if(argc > 1)
	{
		printf("n (modulo) is %ld\n", n);
		printf("e (public exponent) is %d\n", e);
		//from print128.c
		printf("d (private exponent) is %ld\n", d);
		printf("p is %d\n", p);
		printf("q is %d\n", q);
	}


	//BEGIN ATTACK
	int start; //start of search for primes
	int primeGuess;
	long dGuess;
	bool found = false;
	

	//START THE TIMER
	time(&startTime);


	//First, assume one of the primes is 3 (my keygen flaw)
	primeGuess = 3;
	long otherPrime = (n / primeGuess); //must be long for assumption if neither prime is 3
	long totient = (primeGuess - 1) * (otherPrime - 1);
	if(argc > 1) //debug
		printf("Totient is %ld\n", totient);
	//find upper bound of loop
	long one = 1;
    long limit = ~(one << 63) ^ 1; //limit ends up being (2^127 - 1) - 1
    long maxTMultiple = limit / totient;
	for(long i = 1; i <= maxTMultiple; i++)
	{
		//printf("%ld|", i);
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
		start = (start % 2 == 0? start + 1 : start + 2);
		if(argc > 1) //debug
			printf("Square root of n: %d\n", start);
		primeGuess = start;
		dGuess = d;

		//stop when primeGuess is p or q and dGuess is d.
		while( primeGuess > 3 && ( (primeGuess != p && primeGuess != q) || dGuess != d) )
		{
			primeGuess -= 2;
			otherPrime = n / primeGuess;
			long totient = (primeGuess - 1) * (otherPrime - 1);
			long maxTMultiple = limit / totient;
			for(long i = 1; i <= maxTMultiple; i++)
			{
				dGuess = (totient * i + 1) / e; //e is public exponent
				if(dGuess == d)
				{
					found = true;
					break;
				}
			}
		}
	}

	time(&endTime);

	printf("\nPrimes are %d and %d\n", primeGuess, (int) (n / primeGuess) );
	printf("Runtime: %ld\n", endTime - startTime);
	printf("Done\n");
	return 0;
}