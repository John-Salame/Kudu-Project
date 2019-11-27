#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdbool.h>
#include <stdlib.h>

//char *fgets(char* str, int n, FILE *stream) as safe alternative to gets
//stdout is the output stream


void convert(double *dptr, long *lptr)
{
    asm("movq (%rdi), %r8; movq %r8, (%rsi);");
}

//07fa
long getRand(double *result)
{
    //%rbp is 0x7fffffffdcb0
    double dbits = 12.0; //-0x10(%rbp)
    long bits = 0xaabbccddeeffaabb; //-0x8(%rbp) = dc48
    
    char str[50];
    
    puts("Insert phrase:");
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
    *result = dbits; //result is at -0x28(%rbp)
    
    //https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C
    convert(&dbits, &bits); //move double dbits to long bits
    
    return bits; //return bits
}


//start is assumed to be odd; only returns odd numbers (I'm removing 2 from dataset since it's too small anyway);
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


/*
    expects odd numbered seeds
    writes to file for public and private keys
*/
void getKey(long seed1, long seed2)
{
    long prime1 = findPrime(seed1); //should only be 64-bit
    printf("Prime 1: %ld\n", prime1);
    long prime2 = findPrime(seed2); //should only be 64-bit
    printf("Prime 2: %ld\n", prime2);

    __int128 bigPrime1 = prime1;
    __int128 bigPrime2 = prime2;
    __int128 n = bigPrime1 * bigPrime2;
    
    long factor1 = n / prime2; //use to check if n is correct
    long factor2 = n / prime1; //use to check if n is correct

    printf("n / %ld is %ld\n", prime2, factor1);
    printf("n / %ld is %ld\n", prime1, factor2);
}


long shrink(long num)
{
    long output;
    output = num << 6;
    if(output < 0)
    {
        output = ~output;
    }
    output = output >> 6;
    return output;
}


int main(int argc, char *argv[])
{
    double timeDiv1; //stores currTime / dproduct
    double timeDiv2;
    
    //take bits from division and store them in "bits"
    long seed1 = getRand(&timeDiv1);
    
    long seed2 = getRand(&timeDiv2);

    printf("Time divided by product is %e, as an int is %ld or %lx\n", timeDiv1, seed1, seed1);
    
    printf("Time divided by product is %e, as an int is %ld or %lx\n", timeDiv2, seed2, seed2);
    
    //these 2 lines will make it so I can generate prime numbers more quickly.
    seed1 = shrink(seed1);
    seed2 = shrink(seed2);
    
    seed1 = (seed1 % 2 == 0? seed1 + 1 : seed1); //change seed to odd number
    seed2 = (seed2 % 2 == 0? seed2 + 1 : seed2); //change seed to odd number
    
    printf("Seed 1: %ld\n", seed1);
    printf("Seed 2: %ld\n", seed2);
    
    getKey(seed1, seed2);
    
    return 0;
}