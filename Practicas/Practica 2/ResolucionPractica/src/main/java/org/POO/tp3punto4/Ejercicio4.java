//4)
// A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
// (double), el color de relleno (String) y el color de línea (String). El círculo debe saber:
//
// - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
// - Calcular el área y devolverla (método calcularArea)
// - Calcular el perímetro y devolverlo (método calcularPerimetro)
//
// B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
// informe en consola el perímetro y el área.
//
// NOTA: la constante PI es Math.PI

package org.POO.tp3punto4;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        double radio;
        String relleno;
        String linea;

        System.out.println();
        System.out.println("Ingrese radio : " + String.format("%.2f", (radio = GeneradorAleatorio.generarInt(100))));
        System.out.println("Ingrese color de relleno : " + (relleno = GeneradorAleatorio.generarString(6)));
        System.out.println("Ingrese color de linea : " + (linea = GeneradorAleatorio.generarString(6)));
        System.out.println();

        Cirulo cirulo = new Cirulo(radio, relleno, linea);

        System.out.println("Perimetro: " + String.format("%.2f", (cirulo.calcularPerimetro())));
        System.out.println("Area : " + String.format("%.2f", (cirulo.calcularArea())));

    }

}
