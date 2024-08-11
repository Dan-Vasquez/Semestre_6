// CODIGO 8 Write a Function to check uppercase letter.

#include <stdio.h>

int esMayuscula(char c) {
    if (c >= 'A' && c <= 'Z') {
        return 1; // Es una letra mayúscula
    } else {
        return 0; // No es una letra mayúscula
    }
}

int main() {
    char letra;
    printf("Ingrese una letra: ");
    scanf("%c", &letra);

    if (esMayuscula(letra)) {
        printf("Es una letra mayuscula.\n");
    } else {
        printf("No es una letra mayuscula.\n");
    }

    return 0;
}