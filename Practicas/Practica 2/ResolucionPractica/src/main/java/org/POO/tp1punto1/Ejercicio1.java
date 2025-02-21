// 1) En el programa Demo08Vector escriba las instrucciones necesarias para:
// generar enteros aleatorios hasta obtener el número 11. Para cada número
// muestre el resultado de multiplicarlo por 2 (accediendo al vector).

package org.POO.tp1punto1;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimf = 11;  // tamaño del vector random
        int[] vector = new int[dimf];
        int num;
        int diml = 0;

        // Generar números aleatorios hasta que salga un 11 o se llene el vector dimf = 8
        num = GeneradorAleatorio.generarInt(12) + 1;  // Genera números entre 1 y 12
        while (diml < dimf && num != 11) {
            vector[diml] = num;
            diml++;
            num = GeneradorAleatorio.generarInt(12) + 1;
        }

        System.out.println();
        for (int i = 0; i < diml; i++)
            System.out.println("El valor: " + vector[i] + " multiplicado por 2 es igual a: " + (vector[i] * 2));
    }
}

