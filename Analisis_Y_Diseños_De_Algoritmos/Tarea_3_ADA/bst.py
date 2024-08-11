"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

respuesta = ""

def bst(nodos, altura, low, hi):
    if low != hi:
        global respuesta
        if low + 1 == hi:
            respuesta += " " + str(nodos[low])
        else:
            encontro_raiz = 0
            i = low
            while encontro_raiz == 0:
                if ((hi - (i + 1))) <= ((2**(altura - 1)) - 1):
                    encontro_raiz = 1
                    respuesta += " " + str(nodos[i])
                    bst(nodos, altura - 1, low, i)
                    bst(nodos, altura - 1, i + 1, hi)
                i += 1

def main():

    cantidad_nodos, altura = map(int, stdin.readline().split())
    caso = 1
    global respuesta
    while cantidad_nodos != 0:
        if cantidad_nodos > (2**altura) - 1:
            print( f"Case {caso}: Impossible.")
        else:
            nodos = [(i + 1) for i in range(cantidad_nodos)]
            bst(nodos, altura, 0, cantidad_nodos)
            print( f"Case {caso}:{respuesta}")
            respuesta = ""
        caso += 1
        cantidad_nodos, altura = map(int, stdin.readline().split())

main()