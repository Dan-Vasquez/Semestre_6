"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""

"""
logica general: el codigo recibe para cada caso el periodo de eleccion y el numero de papas elegidos
junto con sus respectivos años, luego se recorre cada posicion del arreglo donde estan los años de eleccion,
para utilizar el algoritmo de busqueda binaria y determinar cual es el primer numero mas grande que representa
el periodo de eleccion para un año inicial, por ejemplo se si se tiene un periodo de 5 años y estoy buscando en el año
16 el numero mas grande que que debo encontrar es igual o mayor que 20, y asi contar cuantos papas se eligieron
en esa epoca, verficando al final si el numero es mayor a una epoca anterior y reemplazando en cada caso para dar
paso a la repuesta.
"""

from sys import stdin

respuesta = [0,0,0]

def popes( eleccion_papas, periodo_inferior, periodo_superior, low, hi, mid ):
    global respuesta
    if low + 1 == hi:
        num_papas = (hi) - periodo_inferior
        if respuesta[0] < num_papas :
            respuesta = [num_papas, eleccion_papas[periodo_inferior], eleccion_papas[hi - 1]]
    else:
        if eleccion_papas[mid] <= periodo_superior:
            centro = (hi + mid) // 2
            popes(eleccion_papas, periodo_inferior, periodo_superior, mid, hi, centro )
        else:
            centro = (mid + low) // 2
            popes(eleccion_papas, periodo_inferior, periodo_superior, low, mid, centro )
    
def main():
    global respuesta
    linea = stdin.readline().strip()
    while linea != "":
        periodo = int(linea)
        papas = int(stdin.readline())
        tamaño = papas
        eleccion_papas = []
        while papas != 0:
            eleccion_papas.append( int(stdin.readline()) )
            papas -= 1
        i = 0   
        while i < tamaño:
            periodo_superior = eleccion_papas[i] + (periodo - 1)
            popes(eleccion_papas, i ,periodo_superior, 0, tamaño, tamaño//2)
            i += 1
        print( respuesta[0], respuesta[1], respuesta[2] )  
        respuesta = [0,0,0] 
        a = stdin.readline().strip()
        if a == "": linea = stdin.readline().strip()
        
main() 
