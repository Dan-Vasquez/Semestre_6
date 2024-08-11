"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin


def verificacion(numeros, numeros_vistos):

    eleccion = 0
    numero_menor = float('inf')
    numeros_mayor = 0
    posiciones_cambio = []

    for i in range(len(numeros)):
        if i not in numeros_vistos:
            posiciones_cambio.append(i)
            numero_menor = min(numero_menor, numeros[i])

    longitud_menor = len(str(numero_menor))
    for i in posiciones_cambio:
        num1 = numeros[i]
        num1_str = len(str(num1))
        num1 = num1 // 10**(num1_str - longitud_menor)
        if num1 == numeros_mayor:

            if int("".join(str(numeros[i]) + str(eleccion_numero))) > int("".join(str(eleccion_numero) + str(numeros[i]))):
                numeros_mayor = num1  
                eleccion = i
                eleccion_numero = numeros[i]

        elif num1 > numeros_mayor:
            numeros_mayor = num1 
            eleccion = i
            eleccion_numero = numeros[i]
    return eleccion

def game( numeros, numeros_vistos, respuesta):
    
    if len(numeros) == len(numeros_vistos):
        print(respuesta)
    else:
        eleccion = verificacion(numeros, numeros_vistos)
        numeros_vistos.add(eleccion)
        solucion_plus = (respuesta * (10**len(str(numeros[eleccion])))) + numeros[eleccion]
        game( numeros, numeros_vistos, solucion_plus)
        
def main():
    
    cantidad_numeros = int(stdin.readline())
    while cantidad_numeros != 0:
        numeros = list(map(int, stdin.readline().split()))
        game( numeros, set(), 0)
        cantidad_numeros = int(stdin.readline())

main()