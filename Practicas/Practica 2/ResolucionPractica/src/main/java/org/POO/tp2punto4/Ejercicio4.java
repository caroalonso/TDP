//4) Realice un programa que cargue un vector con 10 Strings leídos desde teclado.
// El vector generado tiene un mensaje escondido que se forma a partir de la primera letra de cada
// string. Genere un nuevo string con el mensaje escondido y muéstrelo en consola.
// NOTA: La primer letra de un String se obtiene enviando el mensaje charAt(0) al objeto.
// Ingrese: humo oso lejos ala menos usado nene de ocho ! Debería imprimir: holamundo!

package org.POO.tp2punto4;

import PaqueteLectura.Lector;

public class Ejercicio4 {

    public static void main(String[] args) {

        int dimf = 10;
        String vector[] = new String[dimf];

        for (int i = 0; i < dimf; i++) {
            System.out.println("Ingrese una palabra: ");
            vector[i] = Lector.leerString();
        }
        System.out.println("FRASE OCULTA :");
        for (int i = 0; i < dimf; i++) {
            System.out.print(vector[i].charAt(0));
        }
    }
}
