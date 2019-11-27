#include <stdio.h>
#include <math.h> //compile with -lm to link the math library libm.a
#include <time.h>
#include <stdlib.h>

//char *fgets(char* str, int n, FILE *stream) as safe alternative to gets
//stdout is the output stream

//Paul's suggestion: multiply and divide by primes to prevent low order bits from zeroing out.


long bits = 0; //for asm
double timeDiv = 0; //for asm

//07fa
long getRand(long currTime, double dproduct, double *result)
{
    //%rbp is 0x7fffffffdc50
    double dbits = currTime / dproduct; //-0x10(%rbp)
    *result = dbits; //result is at -0x28(%rbp)
    long bits = 0xaabbccddeeffaabb; //-0x8(%rbp) = dc48
    
    //https://www.codeproject.com/Articles/15971/Using-Inline-Assembly-in-C-C
    asm("movq -0x10(%rbp), %r8; movq %r8, -0x8(%rbp);"); //move double dbits to long bits
    
    return bits; //return bits
}





int main(int argc, char *argv[])
{
    //char str[] = {'H', 'e', 'l', 'l', 'o', '\0'};
    //char str[] = {'H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd', '!', ' ', 'Y', 'o', 'l', 'o', '!', ' ', 'M', 'o', 'r', 'e', '\0'}; //C string, 12 chars gave 1.18*10^23
    //We reached infinity on the 'o' in "More" (21st character).
    
    char str[50];
    
    puts("Insert phrase 1:");
    fgets(str, 50, stdin);
    
    float product = 1;
    char *itr = str;
    int index = 0;
    
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
    double timeDiv; //stores currTime / dproduct
    
    //take bits from division and store them in "bits"
    bits = getRand(currTime, dproduct, &timeDiv);

    printf("Time divided by product %f is %e, as an int is %ld or %lx\n", dproduct, timeDiv, bits, bits);
    
    return 0;
}