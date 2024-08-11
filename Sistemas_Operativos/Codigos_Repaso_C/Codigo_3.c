// CODIGO 3 Write a program in c to find the leap year.


#include <stdio.h>

int isLeapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 1; // Es un año bisiesto
    } else {
        return 0; // No es un año bisiesto
    }
}

int main() {
    int year;

    printf("Pon un año: ");
    scanf("%d", &year);

    if (isLeapYear(year)) {
        printf("%d Es bisiesto .\n", year);
    } else {
        printf("%d No es bisiesto .\n", year);
    }

    return 0;
}