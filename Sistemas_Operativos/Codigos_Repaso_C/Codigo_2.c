// CODIGO 2 Write a program in c to find prime number or not.

#include <stdio.h>

int es_primo(int numero) {
    if (numero <= 1) {
        return 0;
    }
    for (int i = 2; i * i <= numero; ++i) {
        if (numero % i == 0) {
            return 0;
        }
    }
    return 1;
}
int main() {
    int numero;
    printf("Ingrese un número: ");
    scanf("%d", &numero);

    if (es_primo(numero)) {
        printf("%d es un número primo.\n", numero);
    } else {
        printf("%d no es un número primo.\n", numero);
    }
    return 0;
