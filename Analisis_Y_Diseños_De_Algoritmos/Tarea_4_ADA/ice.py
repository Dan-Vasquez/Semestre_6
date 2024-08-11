"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

from sys import stdin

def derecha(check_points, camino, pasos, M, N, checks):
    respuesta = 0
    if camino[-1][0] + 1 < (M) and [camino[-1][0] + 1, camino[-1][1]] not in camino: 
        camino_temp = list(camino)
        camino_temp.append([camino[-1][0] + 1, camino[-1][1]])
        respuesta = ice(check_points, camino_temp, pasos, M, N, checks)
    return respuesta
def izquierda(check_points, camino, pasos, M, N, checks):
    respuesta = 0
    if camino[-1][0] - 1 >= 0 and [camino[-1][0] - 1, camino[-1][1]] not in camino: 
        camino_temp = list(camino)
        camino_temp.append([camino[-1][0] - 1, camino[-1][1]])
        respuesta = ice(check_points, camino_temp, pasos, M, N, checks)
    return respuesta
def arriba(check_points, camino, pasos, M, N, checks):
    respuesta = 0
    if camino[-1][1] + 1 < (N) and [camino[-1][0], camino[-1][1] + 1] not in camino: 
        camino_temp = list(camino)
        camino_temp.append([camino[-1][0], camino[-1][1] + 1])
        respuesta = ice(check_points, camino_temp, pasos, M, N, checks)
    return respuesta
def abajo(check_points, camino, pasos, M, N, checks):
    respuesta = 0
    if camino[-1][1] - 1 >= 0 and [camino[-1][0], camino[-1][1] - 1] not in camino: 
        camino_temp = list(camino)
        camino_temp.append([camino[-1][0], camino[-1][1] - 1])
        respuesta = ice(check_points, camino_temp, pasos, M, N, checks)
    return respuesta

def ice(check_points, camino, pasos, M, N, checks):
    respuesta = 0
    if pasos == M*N:
        if camino[-1] == [0,1]:
            #print(respuesta)
            respuesta = 1
    else:
        distancia_checkpoint = abs(check_points[checks][0] - camino[-1][0]) + abs(check_points[checks][1] - camino[-1][1])
        #print(distancia_checkpoint, camino)
        if check_points[checks] == camino[-1] and pasos == int((checks + 1) * ( (M*N) / 4)):
            respuesta += derecha(check_points, camino, pasos + 1, M, N, checks + 1)
            respuesta += izquierda(check_points, camino, pasos + 1, M, N, checks + 1)
            respuesta += arriba(check_points, camino, pasos + 1, M, N, checks + 1)
            respuesta += abajo(check_points, camino, pasos + 1, M, N, checks + 1)

        elif (distancia_checkpoint + pasos) <= int((checks + 1) * ( (M*N) / 4) ) and camino[-1] != [0,1]:
            respuesta += derecha(check_points, camino, pasos + 1, M, N, checks)
            respuesta += izquierda(check_points, camino, pasos + 1, M, N, checks)
            respuesta += arriba(check_points, camino, pasos + 1, M, N, checks)
            respuesta += abajo(check_points, camino, pasos + 1, M, N, checks)
        
    return respuesta

def main():
    M, N = map(int, stdin.readline().split())
    casos = 1
    while M != 0:
        numeros = list(map(int, stdin.readline().split()))
        check_points = [numeros[i:i+2] for i in range(0, len(numeros), 2)]
        check_points.append([0,1])
        print(f"case {casos}: {ice(check_points, [[0,0]], 1, M, N, 0)}")
        M, N = map(int, stdin.readline().split())
        casos += 1
main()