//2) Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
// 15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
// obtener edad 0. Luego de almacenar la información:
//  Informe la cantidad de personas mayores de 65 años.
// - Muestre la representación de la persona con menor DNI.

package org.POO.tp2punto2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimf = 15;
        Persona vector[] = new Persona[dimf];
        int diml = 0;
        int edad;
        int dni;
        String nombre;
        int min = 999;
        int suma_mayores = 0;
        int aux = -1;

        edad = GeneradorAleatorio.generarInt(70);
        while ((diml < dimf) && (edad != 0)) {
            nombre = GeneradorAleatorio.generarString(4);
            dni = GeneradorAleatorio.generarInt(15);
            Persona persona = new Persona(nombre, dni, edad);
            vector[diml] = persona;
            diml++;
            edad = GeneradorAleatorio.generarInt(70);
        }

        System.out.println();
        for (int i = 0; i < dimf; i++) {
            if (vector[i].getEdad() > 65) {
                suma_mayores++;
            }
            if (vector[i].getDni() < min) {
                min = vector[i].getDni();
                aux = i;
            }
            System.out.println("Persona " + i + " : " + vector[i].toString()); //PRUEBA
        }

        System.out.println();
        System.out.println("La suma total de mayores de 65 años fue: " + suma_mayores + "\n" + "La persona con menor DNI fue : " + vector[aux].toString());

    }
}
