"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin
from heapq import heappush, heappop

def customer(ordenes, cantidad_ordenes):

    ordenes_aceptadas = []
    tiempo_transcurrido = 0
    for i in range(cantidad_ordenes):
        toneladas_acero = ordenes[i][0]
        fecha_vencimiento = ordenes[i][1]
        tiempo_transcurrido += toneladas_acero
        heappush(ordenes_aceptadas, -toneladas_acero)
        if tiempo_transcurrido > fecha_vencimiento:
            tiempo_transcurrido += heappop(ordenes_aceptadas)
            
    return len(ordenes_aceptadas)

def main():

    casos = int(stdin.readline())

    for _ in range(casos):
        blank_line = stdin.readline().strip()
        cantidad_ordenes = int(stdin.readline())
        ordenes = []
        for _ in range(cantidad_ordenes):
            toneladas_acero, fecha_vencimiento = map(int, stdin.readline().split())
            ordenes.append((toneladas_acero, fecha_vencimiento))
        ordenes.sort(key=lambda orden: orden[1])
        print(customer(ordenes, cantidad_ordenes))
        print()

main()