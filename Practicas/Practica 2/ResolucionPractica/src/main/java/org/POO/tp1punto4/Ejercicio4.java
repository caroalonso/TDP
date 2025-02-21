// Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso.
// Realice un programa que permita informar la cantidad de personas que concurrieron a
// cada oficina de cada piso.
// Para esto, simule la llegada de personas al edificio de la siguiente manera:
// a cada persona se le pide el nro. de piso y nro. de oficina a la cual quiere concurrir.
// La llegada de personas finaliza al indicar un nro. de piso 9.
// Al finalizar la llegada de personas, informe lo pedido.

package org.POO.tp1punto4;

import PaqueteLectura.Lector;

public class Ejercicio4 {

    public static void main(String[] args) {
        int dimf = 8; // pisos
        int dimc = 4; // oficinas       
        int matriz[][] = new int[dimf][dimc]; // matriz 
        int piso; // pisos
        int ofi;  // columnas

        System.out.println("ingrese un numero de piso del 0 al 9 : (finaliza con carga de piso 9)");
        piso = Lector.leerInt();
        while (piso != 9) {
            System.out.println("ingrese un numero de oficina del 0 al 3 : ");
            ofi = Lector.leerInt();
            matriz[piso][ofi]++; //= matriz[piso][ofi]++; // sumo persona
            System.out.println("ingrese un numero de piso del 0 al 9 : (finaliza con carga de piso 9)");
            piso = Lector.leerInt();
        }

        for (piso = 0; piso < dimf; piso++) {
            for (ofi = 0; ofi < dimc; ofi++)
                System.out.println("Cantidad de personas en el piso " + piso + " y oficina " + ofi + " : " + matriz[piso][ofi]);
        }
    }
}
