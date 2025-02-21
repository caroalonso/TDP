// 5) Se realizará un casting para un programa de TV.
// El casting durará a lo sumo 5 días y en
// cada día se entrevistarán a 8 personas en distinto turno.
// a) Simular el proceso de inscripción de personas al casting.
// A cada persona se le pide: nombre,DNIy edad.
//
// y se la debe asignar en un día y turno de la siguiente manera:
// las personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
// siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
//40 cupos de casting.
//
// Una vez finalizada la inscripción:
// b) Informar para cada día y turno el nombre de la persona a entrevistar.
// NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.


package org.POO.tp2punto5;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio5 {

    public static void main(String[] args) {

        int dimf = 8; // Cantidad de turnos por día
        int dimc = 5; // Cantidad de días

        Persona[][] matriz = new Persona[dimc][dimf]; // La matriz ahora está correctamente indexada

        String nombre = GeneradorAleatorio.generarString(4);
        int dni, edad;
        int dia = 0, turno = 0;

        // Proceso de inscripción
        while (dia < dimc && !nombre.equals("ZZZ")) {
            turno = 0;
            while (turno < dimf && !nombre.equals("ZZZ")) {
                dni = GeneradorAleatorio.generarInt(20);
                edad = GeneradorAleatorio.generarInt(40);

                matriz[dia][turno] = new Persona(nombre, dni, edad);

                nombre = GeneradorAleatorio.generarString(4);
                turno++;
            }
            dia++;
        }

        // Impresión de la agenda del casting
        for (int i = 0; i < dimc; i++) {
            for (int j = 0; j < dimf; j++) {
                if (matriz[i][j] != null) {
                    System.out.println("Día " + (i + 1) + " Turno " + (j + 1) + ": " + matriz[i][j].getNombre());
                }
            }
        }
    }
}

