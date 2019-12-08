#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdbool.h>
#include "print128.c"
#include <assert.h>
#include <stdlib.h>

//char *fgets(char* str, int n, FILE *stream) as safe alternative to gets
//stdout is the output stream

int OFFSET = 12; //byte offset for shrink function

void convert(double *dptr, long *lptr)
{
    asm("movq (%rdi), %r8; movq %r8, (%rsi);");
}


//07fa
long getRand()
{
    //%rbp is 0x7fffffffdcb0
    double dbits = 12.0; //-0x10(%rbp)
    long bits = 0xaabbccddeeffaabb; //-0x8(%rbp) = dc48
    
    char str[50];
    
    puts("\nInsert phrase:");
    fgets(str, 50, stdin);
    
    float product = 1;
    char *itr = str;
    //int index = 0;
    
    while(*itr != 0 && *itr != '\n')
    {
        product = product * *itr;
        //printf("%d Char: %c %d, ", index++, *itr, *itr);
        //printf("Partial Product: %f\n", product);
        itr++;
    }
    
    printf("\nFinal value of product: %f\n", product);
    
    float pow = logf(product) / logf(10.0);
    printf("Power of 10: %f\n", pow); //print the power of 10
    
    //now print the value of 1 / product (as a float)
    time_t currTime;
    time(&currTime);
    printf("Current time: %ld\n", currTime);
    double dproduct = product;
    
    dbits = currTime / dproduct;
    
    //https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C
    convert(&dbits, &bits); //move double dbits to long bits
    printf("Time divided by product is %e, as an int is %ld or %lx\n", dbits, bits, bits);

    return bits; //return bits
}


//change (OFFSET + 1) most significant bits to 0s
long shrink(long num)
{
    long output;
    output = num << OFFSET;
    if(output < 0)
    {
        output = ~output;
    }
    output = output >> OFFSET;
    return output;
}


long getSeed()
{
    long seed;
    seed = getRand();

    //make it so I can generate prime numbers more quickly.
    seed = shrink(seed);
    //change seed to odd number (I use 3 to work with my flaw's edge case)
    seed = (seed % 2 == 0? seed + 3 : seed);

    return seed;
}

//find next prime
//start is assumed to be odd; only returns odd numbers (I'm removing 2 from dataset)
long findPrime(long start)
{
    bool found = false;
    long num = start;
    while(!found)
    {
        bool prime = true;
        long end = (long) sqrt(num);
        for(int i = 3; i <= end; i += 2)
        {
            if(num % i == 0)
            {
                prime = false;
                break;
            }
        }
        
        if(prime)
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
__int128 findD(__int128 totient, long k)
{
    __int128 d = 0;
    __int128 one = 1;
    __int128 limit = ~(one << 127) ^ 1; //limit ends up being (2^127 - 1) - 1
    long maxTMultiple = limit / totient;
    //protection for if totient is too small and maxTMultiple is too big
    if(maxTMultiple < 0)
    {
        maxTMultiple = ~maxTMultiple;
    }
    printf("Max multiple of totient: %ld\n", maxTMultiple);
    __int128 maxD = (totient * maxTMultiple + 1) / k;

    char maxDStr[41]; //41 worst case according to https://code-examples.net/en/q/b1dc31
    int128toa(maxDStr, maxD);
    printf("Max d is %s\n", maxDStr);

    bool valid = false;
    while(!valid)
    {
        long r = rand();
        if(r < 0)
        {
            r = ~r;
        }
        long x = (r % maxTMultiple) + 1;
        //printf("X %ld ", x);
        __int128 prod = x * totient + 1;
        if(prod % k == 0)
        {
            printf("\nx is %ld\n", x);
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
    long seed1, seed2;
    long prime1, prime2;
    __int128 bigPrime1, bigPrime2;
    __int128 n; //public number
    __int128 totient;
    long k; //public exponent
    __int128 d; //private exponent

    seed1 = getSeed();
    seed2 = getSeed();
    prime1 = findPrime(seed1); //should only be 64-bit
    prime2 = findPrime(seed2); //should only be 64-bit

    bigPrime1 = prime1; //for calculating n and totient without long int overflow
    bigPrime2 = prime2;
    n = bigPrime1 * bigPrime2;

    totient = (bigPrime1 - 1) * (bigPrime2 - 1);

    k = (1 << 16) + 1; //prime number 2^16 + 1 as suggested by source
    //determine if default k is coprime or not

    //we must have 1 < k < totient
    while(k >= totient)
    {
        puts("\n\nYour prime factors are too small. Please do a different input.");
        seed2 = getSeed();
        prime2 = findPrime(seed2);
        bigPrime2 = prime2;
        totient = (bigPrime1 - 1) * (bigPrime2 - 1);
        n = bigPrime1 * bigPrime2;
    }

    printf("\nSeed 1: %ld or %lx\n", seed1, seed1);
    printf("Seed 2: %ld or %lx\n", seed2, seed2);
    printf("Prime 1: %ld\n", prime1);
    printf("Prime 2: %ld\n", prime2);

    //print n (the modulo)
    char nStr[41];
    int128toa(nStr, n);
    printf("n is %s\n", nStr);
    
    long factor1 = n / prime2; //use to check if n is correct
    long factor2 = n / prime1; //use to check if n is correct

    assert(prime1 == factor1);
    assert(prime2 == factor2);

    //print totient
    char tStr[41];
    int128toa(tStr, totient);
    printf("Totient is %s\n", tStr);

    bool coprime = (totient % k != 0); //this works since k is prime

    //easiest way to deal with a situation that will probably never arise
    if(!coprime)
    {
        puts("k is not coprime to totient. Try different inputs.");
        exit(EXIT_FAILURE);
    }

    printf("Public exponent k: %ld\n", k);

    //now find d (private exponent)
    d = findD(totient, k);
    char dStr[41];
    int128toa(dStr, d);
    printf("Private exponent d: %s\n", dStr);


    /*
    //FILE I/O TESTING
    //https://stackoverflow.com/questions/4600797/read-int-values-from-a-text-file-in-c
    FILE *testoutput = fopen("testoutput.txt", "w");
    fputs(nStr, testoutput);
    fputc('\n', testoutput);
    fprintf(testoutput, "%ld\n", factor1);
    fprintf(testoutput, "%ld\n", factor2);
    fclose(testoutput);

    FILE *testinput = fopen("testoutput.txt", "r");
    __int128 l1 = 0;
    long l2;
    long l3;
    char ch;
    int dig;
    puts("Getting char: ");
    //https://www.quora.com/How-do-you-read-integers-from-a-file-in-C
    while(!feof(testinput))
    {
        ch = fgetc(testinput);
        if(ch == '\n')
        {
            break;
        }
        dig = atoi(&ch);
        printf("%d", dig);
        l1 *= 10;
        l1 += dig;
    }
    fscanf(testinput, "%ld", &l2);
    fscanf(testinput, "%ld", &l3);

    char testbig[41];
    int128toa(testbig, l1);

    printf("\n__int128: %s\n", testbig);
    printf("Prime 1: %ld\n", l2);
    printf("Prime 2: %ld\n", l3);
    printf("n / prime2: %ld\n", (long)(l1 / l3));
    printf("n / prime1: %ld\n", (long)(l1 / l2));
    fclose(testinput);
    //TEST SUCCESSFUL! I CORRECTLY READ IN AN __int128!
    */

    //WRITE RESULTLS TO FILES
    FILE *public = fopen("public.txt", "w");
    fputs(nStr, public); //modulo n
    fputc(',', public);
    fprintf(public, "%ld\n", k); //public exponent, aka "e"
    fclose(public);

    FILE *private = fopen("private.txt", "w");
    fputs(dStr, private); //private exponent
    fputc(',', private);
    fprintf(private, "%ld,", prime1);
    fprintf(private, "%ld\n", prime2);
    fclose(private);
}


int main(int argc, char *argv[])
{
    unsigned long randSeed = getRand();
    srand(randSeed);

    getKey();

    /*
    puts("Simulate search for prime factors\n");

    __int128 bigs1 = seed1;
    __int128 n = bigs1 * seed2;
    long start = sqrt(n);
    printf("Sqrt of n is %ld\n", start);
    if(start % 2 == 0)
    {
        start = start + 1;
    }
    //sqrt seems to be closer to the lower prime than the larger prime
    for(long i = start; i > 1; i -= 2)
    {
        if(i == seed1 || i == seed2)
        {
            printf("Found %ld\n", i);
            break;
        }
    }
    puts("Finished searching possible primes in range\n");
    */
    return 0;
}