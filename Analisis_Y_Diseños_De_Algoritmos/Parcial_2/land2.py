"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin, setrecursionlimit

setrecursionlimit(10**6)

def ordenar_fila(A):
    N = len(A)
    B = [0 for _ in range(N)]
    for n in range(N):
        if A[n] == 0:
            if B[n - 1] > 0:
                B[n] = B[n-1] + 1
            else:
                B[n] = 1
        else:
            B[n] = float('-inf')
    return B

def kadane_no(A):
    suma_maxima = float('-inf')
    suma_actual = 0
    numero_minimo = float('inf')
    max_numero_minimo = 0
    cantidad = 0
    N = len(A)

    for n in range(N):
        if A[n] == float('-inf'):
            suma_actual = 0
            numero_minimo = float('inf')
            cantidad = 0
        else:
            suma_actual += A[n]
            numero_minimo = min(numero_minimo, A[n])
            cantidad += 1

        if suma_actual == suma_maxima:
            if numero_minimo > max_numero_minimo :
                suma_maxima = suma_actual
                max_numero_minimo = numero_minimo
                max_cantidad = cantidad
        elif suma_actual > suma_maxima:
                suma_maxima = suma_actual
                max_numero_minimo = numero_minimo
                max_cantidad = cantidad

    return max_numero_minimo * max_cantidad
    

def main():

    m, n = map(int, stdin.readline().split())
    #suma_areas = 0
    while m != 0:
        suma_areas = 0
        matrix  = [ [ 0 for _ in range(n) ] for _ in range(m) ]
        for i in range(m):
            fila = list(map(int, stdin.readline().split()))
            fila_convertida = ordenar_fila(fila)
            matrix[i] = fila_convertida
        for i in matrix: print(i)
        print()
        matrix2 = [list(map(lambda fila: fila[i], matrix)) for i in range(n)]
        for i in matrix2: print(i)
        maximo_caso = 0
        for h in matrix2: 
            for k in range(len(h)):
                maximo_caso = max(maximo_caso,kadane_no(h[k:]))           
        print(maximo_caso)         
        m, n = map(int, stdin.readline().split())
main()