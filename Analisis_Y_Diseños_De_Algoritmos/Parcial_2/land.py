"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

mem = {}

def kadane1d(A):
    ans, psum, N = 0, 0, len(A)
    for n in range(N):
        psum = max(psum + A[n], A[n])
        ans = max(ans, psum)
    return ans

def suma_filas(primera_fila, matriz):
    global mem
    resultado = 0

    ancla = primera_fila
    kd = kadane1d(ancla)
    mem[tuple(ancla)] = kd
    resultado = kd
    for fila in matriz:
        fila_suma = []
        for i in range(len(fila)):
            suma = ancla[i] + fila[i]
            fila_suma.append(suma)
        ancla = fila_suma
        if tuple(ancla) in mem: resultado = max(resultado, mem[tuple(ancla)])
            
        else:
            kd = kadane1d(ancla)
            resultado = max(resultado, kd)
            mem[tuple(ancla)] = resultado

    return resultado

def main():
    global mem
    n, m = map(int, stdin.readline().split())
    while n != 0:
        resultado = 0
        matriz  = [ [ 0 for _ in range(m) ] for _ in range(n) ]
        for i in range(n):
            matriz[i] = list(map(lambda x: float('-inf') if x == 1 else 1, map(int, stdin.readline().split())))

        for i in range(n):
            resultado = max(resultado, suma_filas(matriz[i], matriz[i+1:]))

        print(resultado)
        mem = {}
        n, m = map(int, stdin.readline().split())
main()