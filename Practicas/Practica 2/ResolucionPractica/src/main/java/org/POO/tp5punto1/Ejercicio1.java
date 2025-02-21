// 1)
// A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema5).
// Triángulo debe heredar de Figura todo lo que es común y definir su constructor
//  y sus atributos y métodos propios. Además debe redefinir el método toString.
//
// B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.
//
// C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
// debe modificar: el de cada subclase o el de Figura?
//
// D- Añada el método despintar que establece los colores de la figura a línea “negra” y
// relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?
//
// E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
// representación String de cada uno. Pruebe el funcionamiento del método despintar.

package org.POO.tp5punto1;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {

    public static void main(String[] args) {

        double lado1;
        double lado2;
        double lado3;
        String relleno;
        String lineas;

        System.out.println();
        System.out.println("Ingrese lado uno: " + String.format("%.2f", (lado1 = GeneradorAleatorio.generarDouble(4))));
        System.out.println("Ingrese lado dos: " + String.format("%.2f", (lado2 = GeneradorAleatorio.generarDouble(4))));
        System.out.println("Ingrese lado tres: " + String.format("%.2f", (lado3 = GeneradorAleatorio.generarDouble(4))));
        System.out.println("Ingrese color relleno: " + (relleno = GeneradorAleatorio.generarString(5)));
        System.out.println("Ingrese color linea: " + (lineas = GeneradorAleatorio.generarString(5)));

        Triangulo triangulo = new Triangulo(lado1, lado2, lado3, relleno, lineas);

        //----------------------------------------------------------------------------------

        double radio;
        System.out.println("Ingrese radio : " + String.format("%.2f", (radio = GeneradorAleatorio.generarInt(100))));
        System.out.println("Ingrese color de relleno : " + (relleno = GeneradorAleatorio.generarString(6)));
        System.out.println("Ingrese color de linea : " + (lineas = GeneradorAleatorio.generarString(6)));
        System.out.println();

        Circulo circulo = new Circulo(radio, relleno, lineas);

        //-----------------------------------------------------------------------------------
        System.out.println("Triangulo:");
        System.out.println(triangulo.toString());
        System.out.println("Circulo:");
        System.out.println(circulo.toString());
        System.out.println();

        //-----------------------------------------------------------------------------------
        triangulo.despintar();
        circulo.despintar();

        System.out.println("Triangulo:");
        System.out.println(triangulo.toString());
        System.out.println("Circulo:");
        System.out.println(circulo.toString());

    }

}
