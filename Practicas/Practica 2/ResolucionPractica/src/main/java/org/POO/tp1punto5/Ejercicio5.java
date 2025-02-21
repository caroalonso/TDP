// El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
// (con puntaje de 1 a 10) los siguientes aspectos:
// (0) Atención al cliente
// (1) Calidad de la comida
// (2) Precio (3) Ambiente.
// Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
// para cada uno de los aspectos y almacene la información en una estructura. Luego
// imprima la calificación promedio obtenida por cada aspecto.


package org.POO.tp1punto5;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimf = 5; // clientes
        int dimc = 4; // aspectos   
        int matriz[][] = new int[dimf][dimc];
        int suma;

        for (int filas = 0; filas < dimf; filas++) {
            for (int columnas = 0; columnas < dimc; columnas++) {
                matriz[filas][columnas] = GeneradorAleatorio.generarInt(11) + 1;
            }
        }


        for (int columnas = 0; columnas < dimc; columnas++) {
            suma = 0;
            for (int filas = 0; filas < dimf; filas++) { // me muevo en las filas
                suma = suma + matriz[filas][columnas];
            }
            System.out.println();
            System.out.println("suma para aspecto " + columnas + " : " + suma);
            System.out.println("Promedio para aspecto" + columnas + " : " + (suma / dimc));
        }

    }

}
