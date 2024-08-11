"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

mem = {}

def flops(oracion, k):
    print(oracion)
    global mem
    ans = float('inf')
    if (tuple(oracion[k])) in mem : ans = mem[tuple(oracion[k])]
    else:
        if k < len(oracion) - 1:
            caminos = contar2(oracion[k], oracion[k + 1])
            ans = min(ans, flops(oracion, k + 1) + len(oracion[k]))
            for i in caminos:
                oracion[ k + 1 ] = i[1]
                ans = min( ans, flops(oracion, k + 1) + i[0])
        elif k == len(oracion) - 1:
            ans = min(ans, len(oracion[k]))
        mem[tuple(oracion[k])] = ans
    return ans

def contar2(lista1, lista2):
    ans = []
    chunks = len(lista1)
    for letra1 in lista1:
        caso_temp = []
        for letra2 in lista2:
            if len(lista2) == 1:
                if letra1[1] == letra2[1]: chunks = len(lista1) - 1
                caso_temp.append(letra2)
            else:
                if letra1[1] != letra2[1]:
                    caso_temp.append(letra2)
        ans.append((chunks, caso_temp)) 
    ans.append((len(lista1), lista2))   
    return ans 

def contar(subconjuntos):
    resultados = []
    for subconjunto in subconjuntos:
        contador = {}
        for letra in subconjunto:
            if letra in contador:
                contador[letra] += 1
            else:
                contador[letra] = 1
        resultado = [(contador[letra], letra) for letra in contador]
        resultados.append(resultado)
    return resultados

def main():

    global mem
    casos = int(stdin.readline())
    
    for _ in range(casos):
        long_sub, oracion = map(str, stdin.readline().split())
        long_sub = int(long_sub)
        oracion = [oracion[i:i+long_sub] for i in range(0, len(oracion), long_sub)]
        oracion = contar(oracion)
        print(flops(oracion, 0))
        mem = {}
main()
