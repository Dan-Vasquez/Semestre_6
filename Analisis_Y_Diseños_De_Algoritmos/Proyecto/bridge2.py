"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
Honor: Como miembro de la comunidad académica de la 
Pontificia Universidad Javeriana Cali me comprometo a 
seguir los más altos estándares de integridad académica.
"""

from sys import stdin, setrecursionlimit

setrecursionlimit(10**9)

from collections import deque

memoria = {}

def profundidad_costa(posicion_inicial, mapa, filas, columnas):

    profundidades = [ 0 for _ in range(columnas)]

    posiciones_accesibles = [posicion_inicial]
    visitados = set()

    while posiciones_accesibles:
        posicion = posiciones_accesibles.pop()
        if (posicion[0], posicion[1]) not in visitados:
            visitados.add((posicion[0], posicion[1]))

            profundidades[posicion[1]] = max(posicion[0] + 1, profundidades[posicion[1]])

            mapa[posicion[0]][posicion[1]] = "."

            if posicion[1] - 1 >= 0  and mapa[posicion[0]][posicion[1] - 1] == "#": # Izquierda
                posiciones_accesibles.append([posicion[0], posicion[1] - 1])
            if posicion[1] + 1 < columnas and mapa[posicion[0]][posicion[1] + 1] == "#": # Derecha
                posiciones_accesibles.append([posicion[0], posicion[1] + 1])
            if posicion[0] + 1 < filas and mapa[posicion[0] + 1][posicion[1]] == "#": # Abajo
                posiciones_accesibles.append([posicion[0] + 1, posicion[1]])

    return profundidades

def construir_puentes(posicion, puentes, separacion, distancias, filas, columnas):

    respuesta = 0
    if (posicion, puentes) in memoria:
        respuesta = memoria[(posicion, puentes)]
    else:
        if puentes == 0:
            respuesta = 0
        elif posicion >= columnas:
            if puentes == 0:
                respuesta = 0
            else:
                respuesta = float("inf")
        else:
            respuesta = min( 
                construir_puentes(posicion + 1, puentes, separacion, distancias, filas, columnas),
                construir_puentes(posicion + 1 + separacion, puentes - 1, separacion, distancias, filas, columnas) + distancias[posicion])
        memoria[(posicion, puentes)] = respuesta
    return respuesta

def distancia(mapa, costa_superior):

    resultado = []

    for columna, inicio_fila in enumerate(costa_superior):
        puntos_contados = 0
        fila_actual = inicio_fila

        while mapa[fila_actual][columna] != '#':
            if mapa[fila_actual][columna] == '.':
                puntos_contados += 1

            fila_actual += 1

        resultado.append(puntos_contados)

    return resultado
    
def main():

    global memoria
    line = stdin.readline().strip()

    while line != "":
        filas, columnas = map(int, line.split())
        puentes, separacion = map(int, stdin.readline().split())
        mapa = [list(stdin.readline().strip()) for _ in range(filas)]

        costa_superior = profundidad_costa([0,0], mapa, filas, columnas)
        
        distancias = distancia(mapa, costa_superior)

        print(construir_puentes(0, puentes, separacion, distancias, filas, columnas))

        memoria = {}

        line = stdin.readline().strip()

main()