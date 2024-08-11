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

profundidades = 0
memoria = {}

def profundidad_costa(posicion, mapa, filas, columnas, direccion):

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


    global profundidades
    
    if direccion == "superior":
        profundidades[posicion[1]] = max(posicion[0] + 1, profundidades[posicion[1]])
    elif direccion == "inferior":
        profundidades[posicion[1]] = max(filas - posicion[0], profundidades[posicion[1]])

    mapa[posicion[0]][posicion[1]] = "."
    
    if posicion[0] - 1 >= 0 and mapa[posicion[0] - 1][posicion[1]] == "#": # Arriba
        profundidad_costa([posicion[0] - 1, posicion[1]], mapa, filas, columnas, direccion)
    if posicion[0] + 1 < filas and mapa[posicion[0] + 1][posicion[1]] == "#": # Abajo
        profundidad_costa([posicion[0] + 1, posicion[1]], mapa, filas, columnas, direccion)
    if posicion[1] - 1 >= 0  and mapa[posicion[0]][posicion[1] - 1] == "#": # Izquierda
        profundidad_costa([posicion[0], posicion[1] - 1], mapa, filas, columnas, direccion)
    if posicion[1] + 1 < columnas and mapa[posicion[0]][posicion[1] + 1] == "#": # Derecha
        profundidad_costa([posicion[0], posicion[1] + 1], mapa, filas, columnas, direccion)

def construir_puentes(posicion, puentes, separacion, costa_superior, costa_inferior, filas, columnas):

    """
    Entradas:

    posicion (int): Posición actual en el mapa.
    puentes (int): Número de puentes a construir.
    separacion (int): Separación mínima entre los puentes.
    costa_superior (list): Lista de profundidades de la costa superior.
    costa_inferior (list): Lista de profundidades de la costa inferior.
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
    la suma de las profundidades de la costa superior e inferior en esa posición. 
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
                construir_puentes(posicion + 1, puentes, separacion, costa_superior, costa_inferior, filas, columnas),
                construir_puentes(posicion + 1 + separacion, puentes - 1, separacion, costa_superior, costa_inferior, filas, columnas) + (filas - (costa_inferior[posicion] + costa_superior[posicion]))  )
        memoria[(posicion, puentes)] = respuesta
    return respuesta

def main():
    """
    Detalles: Esta es la función principal del programa. 
    Lee los datos de entrada desde la entrada estándar, 
    que incluyen las dimensiones del mapa, el número de 
    puentes a construir, la separación mínima entre los 
    puentes y el mapa en sí. Luego, la función llama a 
    profundidad_costa para calcular las profundidades de 
    la costa superior e inferior. Después de eso, la función 
    llama a construir_puentes para calcular el costo mínimo 
    de construir los puentes y finalmente imprime el resultado. 
    La función se ejecuta en un bucle hasta que no haya más datos
    de entrada.
    """
    global profundidades, memoria
    line = stdin.readline().strip()

    while line != "":
        filas, columnas = map(int, line.split())
        puentes, separacion = map(int, stdin.readline().split())
        mapa = [list(stdin.readline().strip()) for _ in range(filas)]

        profundidades = [ 0 for _ in range(columnas)]
        profundidad_costa([0,0], mapa, filas, columnas, "superior")
        costa_superior = profundidades 

        profundidades = [ 0 for _ in range(columnas)]
        profundidad_costa([filas - 1,0], mapa, filas, columnas, "inferior")
        costa_inferior = profundidades 

        print(construir_puentes(0, puentes, separacion, costa_superior, costa_inferior, filas, columnas))

        memoria = {}

        line = stdin.readline().strip()

main()