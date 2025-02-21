// 1)
// A– Defina constructores para las clases Triángulo, Círculo y Entrenador
// .En los tres casos declare:
// -Un primer constructor que reciba todos los datos necesarios para iniciar el objeto.
// -Un segundo constructor que no posea parámetros ni código(constructor nulo).
//
// B-Incluya en los programas respectivos(de la carpeta tema3)el código necesario para
// instanciar triángulos,círculos y entrenadores usando en cada caso el primer constructor.

package org.POO.tp4punto1;

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
        System.out.println();

        //------------------------------- Fin triagulo------------------------------------------------
        String nombre;
        double sueldobasico;
        int antiguedad;
        int campeonatos;

        System.out.println("Ingrese nombre: " + (nombre = GeneradorAleatorio.generarString(5)));
        System.out.println("Ingrese sueldo basico : " + String.format("%.2f", (sueldobasico = GeneradorAleatorio.generarInt(100000))));
        System.out.println("Ingrese años de antiguedad : " + (antiguedad = GeneradorAleatorio.generarInt(6) + 1));
        System.out.println("Ingrese cantidad de campeonatos ganados : " + (campeonatos = GeneradorAleatorio.generarInt(10)));
        System.out.println();

        Entrenador entrenador = new Entrenador(nombre, sueldobasico, antiguedad, campeonatos);


        //------------------------------- Fin entrenador------------------------------------------------
        double radio;
        String rellenos;
        String linea;

        System.out.println("Ingrese radio : " + String.format("%.2f", (radio = GeneradorAleatorio.generarInt(100))));
        System.out.println("Ingrese color de relleno : " + (rellenos = GeneradorAleatorio.generarString(6)));
        System.out.println("Ingrese color de linea : " + (linea = GeneradorAleatorio.generarString(6)));

        Circulo circulo = new Circulo(radio, rellenos, linea);

        //------------------------------- Fin circulo------------------------------------------------

    }

}
