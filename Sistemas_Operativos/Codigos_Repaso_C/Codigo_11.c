// CODIGO 11 Write a program in c to type casting implicit explicit

#include <stdio.h>

int main() {
    // Casting implícito
    int entero = 10;
    float decimal = entero; // Casting implícito de int a float

    printf("Casting implícito:\n");
    printf("Entero: %d\n", entero);
    printf("Decimal: %f\n\n", decimal);

    // Casting explícito
    float numDecimal = 15.75;
    int numEntero = (int)numDecimal; // Casting explícito de float a int

    printf("Casting explícito:\n");
    printf("Decimal: %f\n", numDecimal);
    printf("Entero: %d\n", numEntero);

    return 0;
}