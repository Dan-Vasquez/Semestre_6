"""
Nombre: Daniel Andres Vasquez
Codigo Estudiante: 8963154
"""

"""
Para la solucion de este punto se utilizo el concepto de dividir y conquistar, asi como la base
en los algoritmos de merge sort, el que fue visto en clase y el que se encontraba en las notas.
"""

"""
En merge() lo que se hace basicamente es unir las partes de la lista, miestras se ordena
junto con el ordenamiento se usa la variable global inv donde basicamente se cuenta
la cantidad de inversiones que tiene como base la cantidad para el conteo la cantidad de
elementos que existen en la lista L (left) para asi poder contar las inversiones de forma correcta
cada vez que se va ordenando elemento por elemento.
"""

inv = 0

def merge(A, low, medio,  hi):
  global inv
  n1 = medio - low - 1
  L, R = [], []
  for i in range(low, medio):
    L.append(A[i])
  for i in range(medio,  hi):
    R.append(A[i])
  L.append(float("inf"))
  R.append(float("inf"))
  i, j = 0, 0
  for k in range(low,  hi):
    if L[i] <= R[j]:
      A[k] = L[i]
      i += 1
    else:
      A[k] = R[j]
      j += 1
      inv += (n1 - i) + 1

"""
En mergesort() lo que se hace basicamente es aplicar el concepto de dividir y conquistar
donde se divide la lista A recursivamente hasta que ya solo quede un elemento y no se pueda
dividir para posteriormente ser enviada a la funcion merge()
"""

def mergesort(A, low, hi):
  if low + 1 <  hi:
    medio = low + (( hi - low) >> 1)
    mergesort(A, low, medio)
    mergesort(A, medio,  hi)
    merge(A, low, medio,  hi)

"""
En el main() lo que basicamente se hace es recibir las entradas que en este caso es la
cantidad de elementos de una lista y dichos elementos, que posteriormente se envian la
lista, la primera y ultima posicion de la lista a la funcion mersort().
"""

def main():
  global inv
  cantidad = int(input())
  while cantidad != 0:
    A = []
    inv = 0
    for i in range(cantidad):
      A.append(int(input()))
    mergesort(A, 0, len(A))
    print(inv)
    cantidad = int(input())

main()
