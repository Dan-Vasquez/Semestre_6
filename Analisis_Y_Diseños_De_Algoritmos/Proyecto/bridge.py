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

    """
    Entradas:

    posicion_inicial (list): Lista con las coordenadas de la posición inicial.
    mapa (list): Lista de listas que representa el mapa.
    filas (int): Número de filas en el mapa.
    columnas (int): Número de columnas en el mapa.
    direccion (str): Dirección en la que se está moviendo (“superior” o “inferior”).

    Salida: profundidades (list): para reflejar la profundidad máxima encontrada en cada columna del mapa.

    Detalle: Esta función realiza un recorrido para descubrir la profundidad de la costa en el mapa dado, 
    comenzando desde la posición inicial y utilizando la lista de posiciones accesibles guarda en que dirección
    se puede mover desde la posicion en la que este situado, luego saca la ultima posicion a la que puede acceder
    para actualizar la posicion actual y repite el proceso de descubrir a que posiciones se puede mover y guardandolas
    esto se repite hasta que no haya mas posiciones accesibles. Durante el recorrido, la función actualiza la 
    profundidad máxima encontrada en cada columna del mapa. La profundidad se calcula como la distancia
    desde la costa hasta la posición actual. Si la dirección es “superior”, la profundidad se calcula
    como la distancia desde la posición actual hasta la parte superior del mapa. Si la dirección es
    “inferior”, la profundidad se calcula como la distancia desde la posición actual hasta la parte inferior del mapa.
    """
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

    """
    Entradas:

    posicion (int): Posición actual en el mapa.
    puentes (int): Número de puentes a construir.
    separacion (int): Separación mínima entre los puentes.
    distancias (list): Distancia que hay de costa a costa en cada columna
    filas (int): Número de filas en el mapa.
    columnas (int): Número de columnas en el mapa.

    Salida: respuesta (int): Costo mínimo de construir los puentes.

    Detalle: Esta función utiliza programación dinámica para calcular el 
    costo mínimo de construir un número dado de puentes en el mapa, con 
    una separación mínima entre los puentes. La función considera dos 
    opciones en cada posición del mapa: construir un puente en la posición 
    actual o no construir un puente. Si se construye un puente, la próxima 
    posición considerada será la posición actual más la separación. Si no 
    se construye un puente, la próxima posición considerada será la posición 
    actual más uno. El costo de construir un puente en una posición dada es
    otorgado por la lista de distancias en esa posicion de la columna. 
    La función utiliza una tabla de memoria para almacenar los costos mínimos 
    calculados previamente, lo que permite evitar cálculos redundantes.
    """
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

    """
    Entradas:

    mapa (list): Una lista de listas que representa el mapa.
    costa_superior (list): Una lista de enteros que representa la profundidad de la costa superior en cada columna.

    Salida: resultado (list): Una lista de enteros que representa la cantidad de puntos contados en cada columna.

    Detalle: Esta función recorre cada columna del mapa desde la posición inicial dada por la costa superior. 
    En cada columna, cuenta la cantidad de puntos '.' encontrados hasta que se encuentra un símbolo '#'. 
    La cantidad de puntos contados en cada columna se agrega a la lista de resultados. 
    Finalmente, la función devuelve la lista de resultados.
    """

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
    """
    Detalles: Esta es la función principal del programa. 
    Lee los datos de entrada desde la entrada estándar, 
    que incluyen las dimensiones del mapa, el número de 
    puentes a construir, la separación mínima entre los 
    puentes y el mapa en sí. Luego, la función llama a 
    profundidad_costa para calcular la profundidad de 
    la costa superior. Después de eso, la función 
    llama a distancia para saber las distancias de costa a costa y 
    luego construir_puentes para calcular el costo mínimo 
    de construir los puentes y finalmente imprime el resultado. 
    La función se ejecuta en un bucle hasta que no haya más datos
    de entrada.
    """

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