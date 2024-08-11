"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin
from heapq import heappush, heappop

distancia_mayor_entre_menores = 0

def wifi(distancia_casas, low, hi, mid, rango_direcciones):
    
    global distancia_mayor_entre_menores    
    error = 1e-4
    
    #print(distancia_casas, low, hi, mid, rango_direcciones)
    
    if low + error >= hi:
        for i in (rango_direcciones):
            if distancia_mayor_entre_menores < abs(mid - i):
                distancia_mayor_entre_menores = abs(mid - i)
    else:
        mayor_distancias_1 = 0
        for i in (rango_direcciones):
            if mayor_distancias_1 < abs(mid - i):
                mayor_distancias_1 = abs(mid - i)
            
        mayor_distancias_2 = 0
        for i in (rango_direcciones):
            if mayor_distancias_2 < abs(mid + error) - i:
                mayor_distancias_2 = abs(mid + error) - i
                
        #print(mayor_distancias_1, mayor_distancias_2)
        if mayor_distancias_2 < mayor_distancias_1:
            centro = (mid + hi) / 2
            wifi(distancia_casas, mid, hi, centro, rango_direcciones)
            
        else:
            centro = (low + mid) / 2
            wifi(distancia_casas, low, mid, centro, rango_direcciones)

    #print(distancia_casas, accesos)

def main():
    global distancia_mayor_entre_menores
    
    casos = int(stdin.readline())
    
    while casos != 0:
        
        distancia_casas = []
        particiones = []
        accesos, casas = map( int, stdin.readline().split() )
        tamaño = casas
        
        while casas != 0:
            distancia_casas.append( int(stdin.readline()) )
            casas -= 1

        distancia_maxima = tamaño - 1
        rango = distancia_maxima // accesos
        
        if accesos >=  tamaño:
            distancia_mayor_entre_menores = 0
            
        else:
            
            for i in range(accesos):
                low = i * (rango + 1) 
                hi = low + rango
                
                if len(distancia_casas) <= hi:
                    mid = (distancia_casas[distancia_maxima]  + distancia_casas[low]) / 2
                    #print(distancia_casas[low], distancia_casas[distancia_maxima], mid)
                    wifi(distancia_casas, distancia_casas[low], distancia_casas[distancia_maxima], mid,  distancia_casas[low:])
                    
                else:
                    #print("hola")
                    mid = (distancia_casas[hi] + distancia_casas[low]) / 2
                    #print(distancia_casas[low], distancia_casas[hi], mid)
                    wifi(distancia_casas, distancia_casas[low], distancia_casas[hi], mid,  distancia_casas[low:hi + 1])
                    
        print(round(distancia_mayor_entre_menores, 1))
        distancia_mayor_entre_menores = 0
        casos -= 1
        
main() 
