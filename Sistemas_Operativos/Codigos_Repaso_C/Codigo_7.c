// CODIGO 7 Write a program in c to print fabonnaci series.

#include <stdio.h>

void printFibonacciSeries(int n) {
    int a = 0, b = 1, c;

    printf("Fibonacci series up to %d terms:\n", n);
    printf("%d, %d", a, b); // Print the first two terms

    for (int i = 3; i <= n; ++i) {
        c = a + b;
        printf(", %d", c);
        a = b;
        b = c;
    }

    printf("\n");
}

int main() {
    int numTerms;

    printf("Enter the number of terms for Fibonacci series: ");
    scanf("%d", &numTerms);

    if (numTerms < 1) {
        printf("Number of terms should be greater than 0.\n");
    } else {
        printFibonacciSeries(numTerms);
    }

    return 0;
}