"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

"""
Logica general: Lo que primero se hace es recibir el número casos, de accesos y casas, luego las distancias del final
de la calle a cada casa, se agregan en una lista y se ordenan ascendentemente,  luego se aplica el codigo de wifi el cual es recursivo
usando el concepto de dividir y conquistar, más específicamente el algoritmo de búsqueda binaria, donde la mitad de cada división es
la distancia óptima que debe tener cada acceso entre una casa, y se hacen las verificaciones, donde se coloca el primer acceso siempre en
casa[0] + mid y luego se comienza a verificar si le llega acceso wifi a cada casa posterior, si no entonces se pone otro acceso en casa[casa que no tiene acceso] + mid
y asi iterativamente, luego de eso y dado 2 casos donde o los accesos puestos son mayores a los permitidos o los accesos son menores o iguales, me muevo de derecha
a izquierda respectivamente, donde siempre se busca un nuevo mid que sea mejor al anterior para posicionar de forma óptima cada acceso.
"""

from sys import stdin

def wifi(distancia_casas, accesos, tamaño, low, hi, mid, respuesta):

    error = 1e-2
    
    if low + error >= hi:
        print(respuesta)
    else:
        accesos_puestos = 1
        casas_revisadas = 0
        proximo_acceso = distancia_casas[casas_revisadas] + mid
        distancia_mayor_entre_menores = 0
        while casas_revisadas < tamaño:
            if abs(proximo_acceso - distancia_casas[casas_revisadas]) <= mid:
                if distancia_mayor_entre_menores < abs(round(proximo_acceso - distancia_casas[casas_revisadas], 1)):
                    distancia_mayor_entre_menores = abs(round(proximo_acceso - distancia_casas[casas_revisadas], 1))
                casas_revisadas += 1
            else:
                proximo_acceso = distancia_casas[casas_revisadas] + mid
                if distancia_mayor_entre_menores < abs(round(proximo_acceso - distancia_casas[casas_revisadas], 1)):
                    distancia_mayor_entre_menores = abs(round(proximo_acceso - distancia_casas[casas_revisadas], 1))
                casas_revisadas += 1
                accesos_puestos += 1
            
        if accesos_puestos <= accesos:
            centro = (low + mid) / 2
            wifi(distancia_casas, accesos, tamaño, low, mid, centro, distancia_mayor_entre_menores )
        else:
            centro = (mid + hi) / 2
            wifi(distancia_casas, accesos, tamaño, mid, hi, centro, distancia_mayor_entre_menores )

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

        
        
        if accesos >=  tamaño:
            print(0.0)  
        else:
            distancia_casas.sort()
            mid = distancia_casas[tamaño-1] / 2
            wifi(distancia_casas, accesos, tamaño, 0, distancia_casas[tamaño-1], mid, 0)

        casos -= 1
        
main() 
