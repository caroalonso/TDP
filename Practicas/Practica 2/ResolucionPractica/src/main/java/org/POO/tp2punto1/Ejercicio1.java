// La clase persona se encutra ya declarada en carpeta tema02
// Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
// muestre en consola la representación de ese objeto en formato String.

package org.POO.tp2punto1;

import PaqueteLectura.Lector;

public class Ejercicio1 {

    public static void main(String[] args) {

        System.out.println("Ingrese Nombre: ");
        String nombre = Lector.leerString();
        System.out.println("Ingrese DNI: ");
        int dni = Lector.leerInt();
        System.out.println("Ingrese Edad: ");
        int edad = Lector.leerInt();

        Persona persona = new Persona(nombre, dni, edad);
        System.out.println( persona.toString());
    }

}
