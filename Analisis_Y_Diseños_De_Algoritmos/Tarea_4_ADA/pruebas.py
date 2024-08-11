# Define las dimensiones de la matriz
filas = 1000
columnas = 1000

# Crea una matriz llena de "#"
matriz = [["#" for _ in range(columnas)] for _ in range(filas)]

# Calcula el índice de la fila central
fila_central = filas // 2

# Reemplaza la fila central con "."
matriz[fila_central] = ["." for _ in range(columnas)]

# Imprime la matriz
for fila in matriz:
    print("".join(fila))
