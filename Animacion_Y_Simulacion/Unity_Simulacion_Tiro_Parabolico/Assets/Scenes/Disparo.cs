using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Disparo : MonoBehaviour
{
    public float velocidad = 10.0f;  // Velocidad inicial de la bola de cañón
    public float angulo = 45.0f;     // Ángulo de lanzamiento
    public float friccion = 0.95f;  // Factor de fricción
    private Vector3 direccion;      // Dirección del movimiento

    void Start()
    {
        // Convierte el ángulo de grados a radianes
        float anguloRadianes = angulo * Mathf.Deg2Rad;

        // Calcula la dirección del movimiento en base al ángulo y la velocidad
        direccion = new Vector3(velocidad * Mathf.Cos(anguloRadianes), velocidad * Mathf.Sin(anguloRadianes), 0);
    }

    void FixedUpdate()
    {
        // Comprueba si la bola de cañón ha chocado con el suelo
        if (transform.position.y <= 0)
        {
            // Si la velocidad horizontal es muy pequeña, detén completamente el movimiento horizontal
            if (Mathf.Abs(direccion.x) < 0.01f)
            {
                direccion.x = 0;
            }
            else
            {
                // Si la bola de cañón ha chocado con el suelo, aplica fricción a su movimiento horizontal
                direccion.x *= friccion;
            }
        }

        // Calcula la posición de la bola de cañón en el siguiente frame
        Vector3 desplazamiento = direccion * Time.deltaTime;

        // Aplica la gravedad al componente vertical de la dirección
        direccion.y -= 9.8f * Time.deltaTime;

        // Asegúrate de que la bola de cañón no atraviese el suelo
        direccion.y = Mathf.Max(0, direccion.y);

        // Actualiza la posición de la bola de cañón
        transform.position += desplazamiento;
    }
}