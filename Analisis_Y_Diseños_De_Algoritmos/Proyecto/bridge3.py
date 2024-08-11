"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
Honor: Como miembro de la comunidad académica de la 
Pontificia Universidad Javeriana Cali me comprometo a 
seguir los más altos estándares de integridad académica.
"""

from sys import stdin, setrecursionlimit

setrecursionlimit(10**6)

from collections import deque

profundidades = 0
memoria = {}

def profundidad_costa_superior(posicion, mapa, filas, columnas):
    global profundidades
    profundidades[posicion[1]] = max(posicion[0] + 1, profundidades[posicion[1]])
    mapa[posicion[0]][posicion[1]] = "."
    if posicion[0] - 1 >= 0 and mapa[posicion[0] - 1][posicion[1]] == "#": # Arriba
        profundidad_costa_superior([posicion[0] - 1, posicion[1]], mapa, filas, columnas)
    if posicion[0] + 1 < filas and mapa[posicion[0] + 1][posicion[1]] == "#": # Abajo
        profundidad_costa_superior([posicion[0] + 1, posicion[1]], mapa, filas, columnas)
    if posicion[1] - 1 >= 0  and mapa[posicion[0]][posicion[1] - 1] == "#": # Izquierda
        profundidad_costa_superior([posicion[0], posicion[1] - 1], mapa, filas, columnas)
    if posicion[1] + 1 < columnas and mapa[posicion[0]][posicion[1] + 1] == "#": # Derecha
        profundidad_costa_superior([posicion[0], posicion[1] + 1], mapa, filas, columnas)

def profundidad_costa_inferior(posicion, mapa, filas, columnas):
    global profundidades
    profundidades[posicion[1]] = max(filas -  posicion[0], profundidades[posicion[1]])
    mapa[posicion[0]][posicion[1]] = "."
    if posicion[0] - 1 >= 0 and mapa[posicion[0] - 1][posicion[1]] == "#": # Arriba
        profundidad_costa_inferior([posicion[0] - 1, posicion[1]], mapa, filas, columnas)
    if posicion[0] + 1 < filas and mapa[posicion[0] + 1][posicion[1]] == "#": # Abajo
        profundidad_costa_inferior([posicion[0] + 1, posicion[1]], mapa, filas, columnas)
    if posicion[1] - 1 >= 0  and mapa[posicion[0]][posicion[1] - 1] == "#": # Izquierda
        profundidad_costa_inferior([posicion[0], posicion[1] - 1], mapa, filas, columnas)
    if posicion[1] + 1 < columnas and mapa[posicion[0]][posicion[1] + 1] == "#": # Derecha
        profundidad_costa_inferior([posicion[0], posicion[1] + 1], mapa, filas, columnas)

def construir_puentes(posicion, puentes, separacion, costa_superior, costa_inferior, filas, columnas):
    respuesta = 0

    if (posicion, puentes) in memoria:
        respuesta = memoria[(posicion, puentes)]
    else:
        if posicion >= columnas:
            if puentes == 0:
                respuesta = 0
            else:
                respuesta = float("inf")
        elif puentes == 0:
            respuesta = 0
        else:
            respuesta = min( 
                construir_puentes(posicion + 1, puentes, separacion, costa_superior, costa_inferior, filas, columnas),
                construir_puentes(posicion + 1 + separacion, puentes - 1, separacion, costa_superior, costa_inferior, filas, columnas) + (filas - (costa_inferior[posicion] + costa_superior[posicion]))  )
        memoria[(posicion, puentes)] = respuesta
    return respuesta

def main():
    global profundidades, memoria
    line = stdin.readline().strip()

    while line != "":
        filas, columnas = map(int, line.split())
        puentes, separacion = map(int, stdin.readline().split())
        mapa = [list(stdin.readline().strip()) for _ in range(filas)]

        profundidades = [ 0 for _ in range(columnas)]
        profundidad_costa_superior([0,0], mapa, filas, columnas)
        costa_superior = profundidades 

        profundidades = [ 0 for _ in range(columnas)]
        profundidad_costa_inferior([filas - 1,0], mapa, filas, columnas)
        costa_inferior = profundidades 

        print(construir_puentes(0, puentes, separacion, costa_superior, costa_inferior, filas, columnas))

        memoria = {}

        line = stdin.readline().strip()

main()