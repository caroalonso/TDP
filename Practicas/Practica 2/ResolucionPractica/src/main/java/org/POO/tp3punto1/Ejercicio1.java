// 1)
// A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
// tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
// El triángulo debe saber:
// - Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
// - Calcular el área y devolverla (método calcularArea)
// - Calcular el perímetro y devolverlo (método calcularPerimetro)
// B- Realizar un programa que instancie un triángulo, le cargue información leída desde
// teclado e informe en consola el perímetro y el área.
// NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
// los lados y s = a+b+c / 2
// La función raíz cuadrada es Math.sqrt(#)

package org.POO.tp3punto1;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

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


        System.out.println("Area: " + String.format("%.2f", (triangulo.carea())) + "'\nPerimetro: " + String.format("%.2f", triangulo.calcularperimetro()));

    }
}
    

