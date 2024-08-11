// CODIGO 12 Write program to display number 1 to 10 in octal, decimal and hexadecimal system.

#include <stdio.h>

int main() {
    int i;

    printf("Número\tOctal\tDecimal\tHexadecimal\n");
    printf("-------------------------------------\n");

    for (i = 1; i <= 10; i++) {
        printf("%d\t%o\t%d\t%X\n", i, i, i, i);
    }

    return 0;
}