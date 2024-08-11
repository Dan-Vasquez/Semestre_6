"""
Nombre: Daniel Andres Vasquez Murillo
Codigo: 8963154
"""
from sys import stdin

def story(cantidad_palabras, lineas_pagina, caracteres_linea, palabras):
    lineas = 1
    conteo_caracteres = len(palabras[0])
    for i in range(cantidad_palabras - 1):
        caracteres_palabra = len(palabras[i + 1])
        if conteo_caracteres + caracteres_palabra + 1 <= caracteres_linea:
            conteo_caracteres += caracteres_palabra + 1
        else:
            conteo_caracteres = caracteres_palabra
            lineas += 1

    paginas = lineas / lineas_pagina
    paginas2 = lineas // lineas_pagina
    if paginas == paginas2:
        respuesta = paginas2
    else:
        respuesta = paginas2 + 1 
    return respuesta

def main():

    linea = stdin.readline().strip()
    while linea != "":
        cantidad_palabras, lineas_pagina, caracteres_linea = map(int, linea.split())
        palabras = list(str(x) for x in stdin.readline().split())
        print(story(cantidad_palabras, lineas_pagina, caracteres_linea, palabras))
        linea = stdin.readline().strip()
main()