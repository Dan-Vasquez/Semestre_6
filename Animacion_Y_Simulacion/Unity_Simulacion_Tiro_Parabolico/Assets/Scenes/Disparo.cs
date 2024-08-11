using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Disparo : MonoBehaviour
{
    public float velocidad = 10.0f;  // Velocidad inicial de la bola de ca��n
    public float angulo = 45.0f;     // �ngulo de lanzamiento
    public float friccion = 0.95f;  // Factor de fricci�n
    private Vector3 direccion;      // Direcci�n del movimiento

    void Start()
    {
        // Convierte el �ngulo de grados a radianes
        float anguloRadianes = angulo * Mathf.Deg2Rad;

        // Calcula la direcci�n del movimiento en base al �ngulo y la velocidad
        direccion = new Vector3(velocidad * Mathf.Cos(anguloRadianes), velocidad * Mathf.Sin(anguloRadianes), 0);
    }

    void FixedUpdate()
    {
        // Comprueba si la bola de ca��n ha chocado con el suelo
        if (transform.position.y <= 0)
        {
            // Si la velocidad horizontal es muy peque�a, det�n completamente el movimiento horizontal
            if (Mathf.Abs(direccion.x) < 0.01f)
            {
                direccion.x = 0;
            }
            else
            {
                // Si la bola de ca��n ha chocado con el suelo, aplica fricci�n a su movimiento horizontal
                direccion.x *= friccion;
            }
        }

        // Calcula la posici�n de la bola de ca��n en el siguiente frame
        Vector3 desplazamiento = direccion * Time.deltaTime;

        // Aplica la gravedad al componente vertical de la direcci�n
        direccion.y -= 9.8f * Time.deltaTime;

        // Aseg�rate de que la bola de ca��n no atraviese el suelo
        direccion.y = Mathf.Max(0, direccion.y);

        // Actualiza la posici�n de la bola de ca��n
        transform.position += desplazamiento;
    }
}