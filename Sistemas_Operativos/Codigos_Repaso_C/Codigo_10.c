// CODIGO 10 Find the greater of the three numbers
#include <stdio.h>

int encontrarMayor(int num1, int num2, int num3) {
    int mayor = num1;

    if (num2 > mayor) {
        mayor = num2;
    }

    if (num3 > mayor) {
        mayor = num3;
    }

    return mayor;
}

int main() {
    int numero1, numero2, numero3;

    printf("Ingrese tres números separados por espacios: ");
    scanf("%d %d %d", &numero1, &numero2, &numero3);

    int mayor = encontrarMayor(numero1, numero2, numero3);

    printf("El mayor de los tres números es: %d\n", mayor);

    return 0;
}