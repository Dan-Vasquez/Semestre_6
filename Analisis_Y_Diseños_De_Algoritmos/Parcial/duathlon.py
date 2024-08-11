"""
Nombre: Daniel Andres Vasquez
Codigo Estudiante: 8963154
"""

"""
Para el desarrollo de este punto se utilizo el concepto de busqueda binaria como base y el concepto de biseccion
"""
from sys import stdin

"""
En duathlon() se hace primero que todo tomar las distancias de r y k respectivamente, tener la variable de la diferencia
que es la cantidad de error que puedo tolerar para buscar los r y k para que el tramposo en el mejor de los casos gane la
carrera con la mayor ventaja, luego de eso se hace una verificacion si ya low y hi se encuentran en los casos base donde
ya no se puede seguir dividiendo, luego lo que se hace es hacer dos veces el calculo de la ventaja, donde se toma la primera
mitad y se calculan los tiempos de llegada del tramposo y los demas competidores, tomando de estos ultimos la competidor mas
rapido y restando ese tiempo con el del tramposo, para tener la primera ventaja, luego se vuelve a hacer lo mismo pero tomando
r + diferencia(que es el error) y k - diferencia, donde posterirmente se verifica cual de las dos ventajas calculadas es mejor
para de ese modo volver a llamar la funcion duathlon() pero actualizando low, hi y mitad en cada caso.
"""

def duathlon(low, hi, mitad, kilometros, competidores, A, ventaja):
  r = mitad
  k = kilometros - mitad

  diferencia = 1e-6

  if low + diferencia >= hi:  
    if round(ventaja) >= 0:
      r = round(r, 2)
      k = round(k, 2)
      print(
          f"The cheater can win by {round(ventaja)} seconds with r = {r:.2f}km and k = {k:.2f}km."
      )
    else:
      print("The cheater cannot win.")
      
  else:
    competidor_rapido1 = float("inf")
    tramposo1 = ((r / A[competidores - 1][0]) * 60**2) + (
        (k / A[competidores - 1][1]) * 60**2)
    for i in range(competidores - 1):
      tiempo_competidor = ((r / A[i][0]) * 60**2) + ((k / A[i][1]) * 60**2)
      if tiempo_competidor < competidor_rapido1:
        competidor_rapido1 = tiempo_competidor
    ventaja1 = competidor_rapido1 - tramposo1

    competidor_rapido2 = float("inf")
    tramposo2 = (((r + diferencia) / A[competidores - 1][0]) * 60**2) + ((
        (k - diferencia) / A[competidores - 1][1]) * 60**2)
    for i in range(competidores - 1):
      tiempo_competidor = (((r + diferencia) / A[i][0]) * 60**2) + ((
          (k - diferencia) / A[i][1]) * 60**2)
      if tiempo_competidor < competidor_rapido2:
        competidor_rapido2 = tiempo_competidor
    ventaja2 = competidor_rapido2 - tramposo2
    if ventaja2 > ventaja1:
      centro = (mitad + hi) / 2  
      duathlon(mitad, hi, centro, kilometros, competidores, A, ventaja2)
    else: 
      centro = (mitad + low) / 2  
      duathlon(low, mitad, centro, kilometros, competidores, A, ventaja1)

"""
En el main() lo que se hace es tomar las entradas que en este caso son los kilometros
de la carrera, la cantidad de compretirdores y las velocidades de los competidores y el tramposo
para cada tramo de la carrera r y k, para posteriormente ser enviados a la funcion duathlon() junto con
la primera mitad de la carrera, donde se separan las distancias entre r y k.
"""

def main():
  line = stdin.readline().strip()
  while line != "":
    A = {}
    ventaja = 0
    kilometros = int(line)
    competidores = int(input())
    for i in range(competidores):
      carrera, cicla = map(float, stdin.readline().split())
      A[i] = [carrera, cicla]
    mitad = 0 + ((kilometros - 0) >> 1)
    duathlon(0, kilometros, mitad, kilometros, competidores, A, ventaja)
    line = stdin.readline()
    line = stdin.readline()

main()
