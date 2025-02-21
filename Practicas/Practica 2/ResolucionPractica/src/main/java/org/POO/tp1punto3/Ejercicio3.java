//3) Escriba un programa que defina una matriz de enteros de tamaño 10x10.
// Inicialice la matriz con números aleatorios entre 0 y 200.
// Luego realice las siguientes operaciones:
// A- Mostrar el contenido de la matriz en consola.
// B- Calcular e informar la suma de todos los elementos almacenados entre las
// filas 2 y 9 y las columnas 0 y 3.
// C- Generar un vector de 10 posiciones donde cada posición i contiene la suma
// de los elementos de la columna i de la matriz.
// D- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
// encontrarse indique su ubicación (fila y columna) en caso contrario
// imprima “No se encontró el elemento”.
//
// NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

package org.POO.tp1punto3;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int dimF = 10;
        int dimC = 10;
        int matriz[][] = new int[dimF][dimC];
        int vector[] = new int[dimF];
        int suma_elementos = 0;
        int num;
        boolean encontro = false;

        System.out.println();
        System.out.println("PUNTO A : ");
        for (int filas = 0; filas < dimF; filas++) {
            for (int columnas = 0; columnas < dimC; columnas++) {
                matriz[filas][columnas] = GeneradorAleatorio.generarInt(201) + 1;
                System.out.println("para la posicion [" + filas + "]" + "[" + columnas + "] el contenido es: " + matriz[filas][columnas]);
            }
        }


        System.out.println();
        System.out.println("PUNTO B");
        for (int filas = 2; filas < 10; filas++) { // filas de de 2 a 9
            for (int columnas = 0; columnas < 4; columnas++) { // columnas de 0 a 3
                System.out.println("para la posicion [" + filas + "]" + "[" + columnas + "] el contenido es: " + matriz[filas][columnas]);
                suma_elementos = suma_elementos + matriz[filas][columnas];
            }
        }
        System.out.println("la suma de todo los elementos de filas 2 a 9 , y columas de 0 a 3 son : " + suma_elementos);


        System.out.println();
        System.out.println("PUNTO C");
        for (int columnas = 0; columnas < dimF; columnas++) { //0 a 9
            suma_elementos = 0;
            for (int filas = 0; filas < dimC; filas++) { //0 a 9
                suma_elementos = suma_elementos + matriz[filas][columnas];
            }
            vector[columnas] = suma_elementos;
        }

        for (int i = 0; i < dimF; i++)
            System.out.println(" el total de suma para posicion " + i + " del vector es : " + vector[i]);

        System.out.println();
        System.out.println("PUNTO D");

        num = GeneradorAleatorio.generarInt(10);
        int pos_fila = 0;
        int pos_columna; // me muevo en las columnas
        while ((pos_fila < dimF) && (!encontro)) {
            pos_columna = 0;
            while ((pos_columna < dimC) && (!encontro)) {
                if (num == matriz[pos_fila][pos_columna]) {
                    encontro = true;
                    System.out.println("Se encontro " + num + " en fila " + pos_fila + " y columna " + pos_columna);
                }
                pos_columna++;
            }
            pos_fila++;
        }
        if (!encontro)
            System.out.println("No se encontro " + num);
    }
}
