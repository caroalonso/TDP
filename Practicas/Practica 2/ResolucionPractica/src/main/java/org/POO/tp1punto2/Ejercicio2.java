//2) Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
// básquet y las almacene en un vector. Luego informe:
// la altura promedio
// la cantidad de jugadores con altura por encima del promedio
// NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java

package org.POO.tp1punto2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimf = 15;
        double suma = 0;
        double[] vector = new double[dimf];

        for (int i = 0; i < dimf; i++) {
            vector[i] = GeneradorAleatorio.generarDouble(2) + 1;
            suma = suma + vector[i];
        }

        System.out.println();
        System.out.println("Altura promedio: " + String.format("%.2f", (suma / dimf)));
        System.out.println();
        for (int i = 0; i < dimf; i++) {
            if (vector[i] > (suma / dimf))
                System.out.println("La altura del jugador" + i + "es mayor al promedio :" + String.format("%.2f", vector[i]));
        }

    }

}
