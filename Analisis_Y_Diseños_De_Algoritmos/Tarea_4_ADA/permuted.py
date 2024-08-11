"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

def factorial(n):
    resultado = 1
    for i in range(1, n + 1):
        resultado *= i
    return resultado

def permuted( letras, indice, permutacion, solucion, permutaciones, posiciones):
    if indice == len(letras):
        print("".join(solucion))
    else:
        ramas = len(solucion) + 1
        ramas_faltantes = permutaciones // factorial(ramas)
        bandera = 0
        i = 0
        while i < (ramas) and bandera == 0:
            solucion_parcial = list("".join(solucion[0:i] + [letras[indice]] + solucion[i:]))
            if posiciones + ramas_faltantes >= permutacion:
                bandera = 1
                permuted( letras, indice + 1, permutacion, solucion_parcial, permutaciones, posiciones)
            else:
                posiciones += ramas_faltantes
            i += 1

def main():
    casos = int(stdin.readline())
    for _ in range(casos):
        letras = list(stdin.readline().strip())
        permutacion = int(stdin.readline())
        permuted( letras, 1, permutacion, [letras[0]], factorial(len(letras)), 0)
        
main()