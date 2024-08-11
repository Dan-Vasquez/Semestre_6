"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

def frog(piedras, cantidad_piedras, longitud_rio):
    distancia_maxima = 0
    distancia_piedra_actual = 0
    i = 0
    while i < cantidad_piedras - 1:

        distancia_piedra_siguiente = piedras[i][1]
        tipo_piedra = piedras[i][0]
        distancia_piedra_siguiente2 = piedras[i + 1][1]
        tipo_piedra2 = piedras[i + 1][0]
        distancia_entre_piedras = distancia_piedra_siguiente - distancia_piedra_actual
        distancia_entre_piedras2 = distancia_piedra_siguiente2 - distancia_piedra_actual
        if tipo_piedra == "B":
            distancia_piedra_actual = distancia_piedra_siguiente
            distancia_maxima = max(distancia_maxima, distancia_entre_piedras)
            i += 1
        else:
            distancia_piedra_actual = distancia_piedra_siguiente2
            distancia_maxima = max(distancia_maxima, distancia_entre_piedras2)
            if tipo_piedra2 == "S": piedras[i + 1][2] = 1
            i += 2
    distancia_piedra_actual = 0
    for j in range(cantidad_piedras):
        distancia_piedra_siguiente = piedras[j][1]
        tipo_piedra = piedras[j][0]
        saltos = piedras[j][2]
        distancia_entre_piedras = distancia_piedra_siguiente - distancia_piedra_actual
        if saltos == 0:
            distancia_piedra_actual = distancia_piedra_siguiente
            distancia_maxima = max(distancia_maxima, distancia_entre_piedras)
    return distancia_maxima

def orden_piedras(piedras, cantidad_piedras):
    for i in range(cantidad_piedras):
        tipo, distancia = piedras[i].split('-')
        piedras[i] = [tipo, int(distancia), 0]
    return piedras

def main():

    casos = int(stdin.readline())

    for k in range(casos):
        cantidad_piedras, longitud_rio = map(int, stdin.readline().split())
        piedras = list(str( x ) for x in stdin.readline().split())
        piedras.append(f"B-{longitud_rio}")
        cantidad_piedras += 1
        piedras = orden_piedras(piedras, cantidad_piedras)
        print( f"Case {k+1}: {frog(piedras, cantidad_piedras, longitud_rio)}")

main()