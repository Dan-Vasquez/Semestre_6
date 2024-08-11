"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

mem = {}

def flops(oracion):
    global mem 
    #print(oracion)
    respuesta = float('inf')
    chunks = len(oracion[0])
    chunks2 = chunks
    if (tuple(oracion[0]), len(oracion)) in mem: respuesta = mem[(tuple(oracion[0]), len(oracion))]
    else:
        if len(oracion) > 1:
            resultados = []
            resultados.append(flops(oracion[1:]) + chunks) 
            oracion2 = oracion[1]
            for letra1 in oracion[0]:
                rama = []
                for letra2 in oracion2:
                    if len(oracion2) == 1: 
                        if letra1 != letra2:
                            rama.append(letra2)
                        else:
                            chunks -= 1 
                            rama.append(letra2)
                    else:
                        if letra1 != letra2:
                            rama.append(letra2) 
                oracion[1] = rama
                resultados.append(flops(oracion[1:]) + chunks)
                chunks = chunks2
            for i in resultados: respuesta = min(respuesta, i)
        else:
            respuesta = len(oracion[0])
        mem[(tuple(oracion[0]), len(oracion))] = respuesta    
    return respuesta


def sin_repeticiones(matriz):
    matriz_sin_repeticiones = []
    for lista in matriz:
        resultado = []
        for letra in lista:
            if letra not in resultado:
                resultado.append(letra)
        matriz_sin_repeticiones.append(resultado)
    return matriz_sin_repeticiones

def main():

    global mem
    casos = int(stdin.readline())
    
    for _ in range(casos):
        long_sub, oracion = map(str, stdin.readline().split())
        long_sub = int(long_sub)
        oracion = [oracion[i:i+long_sub] for i in range(0, len(oracion), long_sub)]
        oracion = sin_repeticiones(oracion)
        #print(oracion)
        print(flops(oracion))
        mem = {}
main()
