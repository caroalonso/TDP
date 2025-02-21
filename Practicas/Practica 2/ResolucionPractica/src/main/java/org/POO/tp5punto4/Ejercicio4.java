package org.POO.tp5punto4;

public class Ejercicio4 {

    public static void main(String[] args) {

        VisorFiguras visor = new VisorFiguras();

        Cuadrado   c1 = new Cuadrado(10, "Violeta", "Rosa");
        Rectangulo r = new Rectangulo(20, 10, "Azul", "Celeste");
        Cuadrado   c2 = new Cuadrado(30, "Rojo", "Naranja");

        System.out.println();
        visor.mostrar(c1);  // imprime atributos de clase c1
        visor.mostrar(r);   // imprime atributos de clase r
        visor.mostrar(c2);  // imprime atributos de la clase c2

        System.out.println();
        System.out.println("Cantidad de figuras mostradas: "+ visor.getMostradas());

    }
}

