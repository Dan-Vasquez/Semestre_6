#include <stdio.h>

// CODIGO 1 Write a program in c to find the division of student.

int main() {
  int estudiantes;

  printf("Cuantos estudiantes hay: ");
  scanf("%d", &estudiantes);

  char lista_estudiantes[estudiantes][50];

  printf("Pon %d nombres:\n", estudiantes);

  for (int i = 0; i < estudiantes; ++i) {
    printf("Pon el nombre %d: ", i + 1);
    scanf("%s", lista_estudiantes[i]);
  }

  printf("List contents:\n");

  for (int i = 0; i < estudiantes; ++i) {
    printf("%s\n", lista_estudiantes[i]);
  }

  return 0;
}