// CODIGO 9 Write a program in c to function to check lowercase letter

#include <stdio.h>

int esMinuscula(char c) {
    if (c >= 'a' && c <= 'z') {
        return 1; // Es una letra minúscula
    } else {
        return 0; // No es una letra minúscula
    }
}

int main() {
    char letra;
    printf("Ingrese una letra: ");
    scanf("%c", &letra);

    if (esMinuscula(letra)) {
        printf("Es una letra minúscula.\n");
    } else {
        printf("No es una letra minúscula.\n");
    }

    return 0;
}