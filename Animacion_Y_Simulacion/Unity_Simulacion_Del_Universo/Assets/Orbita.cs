using UnityEngine;

public class PlanetOrbit : MonoBehaviour
{
    public Transform sun; // El objeto que representa al Sol
    public float gravitationalConstant = 6.674e-4f; // Constante gravitatoria
    public float planetMass = 1.0f; // Masa del planeta (Tierra)
    public float initialVelocity = 5.0f; // Velocidad inicial del planeta
    public float initialDistance = 10.0f; // Distancia inicial del planeta al Sol

    private Vector3 planetPosition;
    private Vector3 planetVelocity;

    void Start()
    {
        // Inicializamos la posición y la velocidad del planeta en el plano XZ
        planetPosition = new Vector3(initialDistance, 0, 0);
        planetVelocity = new Vector3(0, 0, initialVelocity);
    }

    void Update()
    {
        // Calculamos la dirección y magnitud de la fuerza gravitatoria
        Vector3 directionToSun = sun.position - transform.position;
        float distanceToSun = directionToSun.magnitude;
        float gravitationalForceMagnitude = (gravitationalConstant * planetMass * 333000) / (distanceToSun * distanceToSun); // Masa del Sol ajustada

        // Calculamos la fuerza gravitatoria en la dirección correcta
        Vector3 gravitationalForce = gravitationalForceMagnitude * directionToSun.normalized;

        // Aplicamos la fuerza como una aceleración (F = ma)
        Vector3 acceleration = gravitationalForce / planetMass;

        // Actualizamos la velocidad y la posición del planeta en el plano XZ
        planetVelocity += acceleration * Time.deltaTime;
        planetPosition += planetVelocity * Time.deltaTime;

        // Actualizamos la posición del objeto en Unity en el plano XZ
        transform.position = planetPosition;
    }
}
