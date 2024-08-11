respuesta = float("-inf")
peso_mayor = 0
def subconjuntos_pesos(lista_numeros, pesos, indice, T, suma_solucion, sub_solucion, peso_solucion):
    global respuesta, peso_mayor
    if suma_solucion == T:
        if peso_solucion > peso_mayor:
            respuesta = sub_solucion
            peso_mayor = peso_solucion
    elif suma_solucion < T and indice < len(lista_numeros):
        subconjuntos_pesos(lista_numeros, pesos, indice + 1, T, suma_solucion, sub_solucion, peso_solucion)
        sub_solucion_plus = list(sub_solucion)
        sub_solucion_plus.append(lista_numeros[indice])
        subconjuntos_pesos(lista_numeros, pesos, indice + 1, T, suma_solucion + lista_numeros[indice], sub_solucion_plus, peso_solucion + pesos[indice])
def main():
    global respuesta
    X = [2,4,1,3,5]
    W = [15,2,10,20,5]
    T = 6
    subconjuntos_pesos(X, W, 0, T, 0, [], 0)
    print(respuesta)
main()
