#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdbool.h>
#include <assert.h>
#include <stdlib.h>

int OFFSET = 4; //byte offset for shrink function

void convert(float *fptr, int *iptr)
{
    //asm("mov (%rdi), %r8; mov %r8, (%rsi);");
    asm("movl (%rdi), %edx; movl %edx, (%rsi);");
}


int getRand()
{
    float fbits;
    int bits;
    
    char str[50];
    
    puts("\nInsert phrase:");
    fgets(str, 50, stdin);
    
    float product = 1;
    char *itr = str;
    
    while(*itr != 0 && *itr != '\n')
    {
        product = product * *itr;
        itr++;
    }
    
    //now print the value of 1 / product (as a float)
    time_t currTime;
    time(&currTime);
    //printf("Current time: %ld\n", currTime);
    
    fbits = currTime / product;
    
    //https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C
    //printf("About to convert with in-line assembly\n");
    convert(&fbits, &bits); //move double dbits to long bits
    //printf("Time divided by product is %e, as an int is %d or %x\n", fbits, bits, bits);

    return bits; //return bits
}


//change (OFFSET + 1) most significant bits to 0s
int shrink(int num)
{
    int output;
    output = num << OFFSET;
    if(output < 0)
    {
        output = ~output;
    }
    output = output >> OFFSET;
    return output;
}


int getSeed()
{
    int seed;
    seed = getRand();
    seed = shrink(seed); //make sure there is enough space for a broader range of private exponents
    //change seed to odd number (I use 3 to work with my flaw's edge case)
    seed = (seed % 2 == 0? seed + 3 : seed);

    return seed;
}

//find next prime
//@param start is assumed to be odd; only returns odd numbers (I'm removing 2 from dataset)
int findPrime(int start)
{
    bool found = false;
    int num = start; //start is where the search will start from
    while(!found)
    {
    	//check if num is prime
        bool prime = true;
        int end = (int) sqrt(num);
        for(int i = 3; i <= end; i += 2)
        {
            if(num % i == 0)
            {
                prime = false;
                break;
            }
        }
        
        //only accept prime numbers greater than 2.
        if(prime && num > 2)
        {
            found = true;
        }
        else
        {
            num += 2;
        }
    } //end of while loop
    return num;
} //end of findPrime


//@param k is public exponent
long findD(long totient, int k)
{
    long d = 0;
    long one = 1;
    long limit = ~(one << 63) ^ 1; //limit ends up being (2^63 - 1) - 1
    long maxTMultiple = limit / totient;

    //printf("Max multiple of totient: %ld\n", maxTMultiple);
    //long maxD = (totient * maxTMultiple + 1) / k;
    //printf("Max d is %ld\n", maxD);

    bool valid = false;
    while(!valid)
    {
        long r = rand();
        if(r < 0)
        {
            r = ~r;
        }
        long x = (r % maxTMultiple) + 1;
        long prod = x * totient + 1; //product of exponents
        if(prod % k == 0)
        {
            //printf("\nx is %ld\n", x);
            d = prod / k;
            assert(prod == d * k);
            valid = true;
        }
    }
    return d;
} //end of findD


//produce both keys and write them to files
void getKey()
{
    int seed1, seed2;
    int prime1, prime2;
    long n; //public number
    long totient = 0;
    int k = 5; //public exponent. 5 was suggested by the RSA simple wiki source
    long d; //private exponent
    bool coprime = (totient % k != 0); //no common factors besides 1; this % works since k is prime

    do {
	    seed1 = getSeed();
	    seed2 = getSeed();
	    prime1 = findPrime(seed1); //should only be 64-bit
	    prime2 = findPrime(seed2); //should only be 64-bit

	    n = (long) prime1 * prime2;

	    totient = (long) (prime1 - 1) * (prime2 - 1);

	    //we must have 1 < k < totient
	    while(k >= totient)
	    {
	    	printf("\n\nYour totient is %ld\n", totient);
	    	printf("Your primes are %d and %d\n", prime1, prime2);
	        puts("Your prime factors are too small. Please use a different input.");
	        seed2 = getSeed();
	        prime2 = findPrime(seed2);
	        totient = (prime1 - 1) * (prime2 - 1);
	        n = (long) prime1 * prime2;
	    }

	    coprime = (totient % k != 0); //this works since k is prime

	    //easiest way to deal with a situation that will probably never arise
	    if(!coprime)
	    {
	        puts("k is not coprime to totient. Try different inputs.");
	    }
	} while(!coprime); //end of do while to get factors

    //now find d (private exponent)
    d = findD(totient, k);


    //WRITE RESULTLS TO FILES
    FILE *public = fopen("public.txt", "w");
    fprintf(public, "%ld", n); //modulo n
    fputc(',', public);
    fprintf(public, "%d\n", k); //public exponent, aka "e"
    fclose(public);

    FILE *private = fopen("private.txt", "w");
    fprintf(private, "%ld", d); //private exponent
    fputc(',', private);
    fprintf(private, "%d,", prime1);
    fprintf(private, "%d\n", prime2);
    fclose(private);
}


int main(int argc, char *argv[])
{
	unsigned long randSeed = getRand();
    srand(randSeed);
    getKey();
    return 0;
}