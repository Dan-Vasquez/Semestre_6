"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

espacio_vacio = 0

def verificar(ficha, fichas_usadas):
    se_puede_usar = False
    ficha_elegida = ficha
    ficha_elegida2 = [ficha[1], ficha[0]]
    if ficha[0] == fichas_usadas[-1][1]:
        se_puede_usar = True
    elif ficha[1] == fichas_usadas[-1][1]:
        se_puede_usar = True
        ficha_elegida = ficha_elegida2
    respuesta = [se_puede_usar, ficha_elegida]
    return respuesta

def dominoes(fichas, fichas_usadas, ficha_final):
    global espacio_vacio
    respuesta = "NO"
    if len(fichas_usadas) == espacio_vacio + 1:
        
        if fichas_usadas[-1][1] == ficha_final[0]:
            
            respuesta = "YES"
    else:
        i = 0
        while respuesta == "NO" and i < len(fichas):
            verificacion = verificar(fichas[i], fichas_usadas)
            if verificacion[0]:
                fichas_usadas_plus = list(fichas_usadas)
                fichas_usadas_plus.append(verificacion[1])
                fichas_plus = list(fichas)
                del fichas_plus[i]
                respuesta = dominoes(fichas_plus, fichas_usadas_plus, ficha_final)
            i += 1
    return respuesta

def main():
    global espacio_vacio
    espacio_vacio = int(stdin.readline())
    while espacio_vacio != 0:
        cantidad_fichas = int(stdin.readline())
        ficha_inicial = list(map(int, stdin.readline().split()))
        ficha_final = list(map(int, stdin.readline().split()))
        fichas = []
        for _ in range(cantidad_fichas):
            ficha = list(map(int, stdin.readline().split()))
            fichas.append(ficha)
        print(dominoes( fichas, [ficha_inicial], ficha_final))
        espacio_vacio = int(stdin.readline())

main()