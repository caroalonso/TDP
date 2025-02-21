//3)
// A- Definir una clase para representar estantes.
// Un estante almacena a lo sumo 20 libros.
// Implemente un constructor que permita iniciar el estante sin libros.
// Provea métodos para:
// (i) devolver la cantidad de libros que almacenados.
// (ii) devolver si el estante está lleno.
// (iii) agregar un libro al estante.
// (iv) devolver el libro con un título particular que se recibe.
//
// B- Realice un programa que instancie un estante.
// Cargue varios libros. A partir del estante,
//busque e informe el autor del libro “Mujercitas”.
//
// C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
// almacenen como máximo N libros? ¿Cómo instanciaría el estante?

package org.POO.tp4punto3;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio3 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        Estante estante = new Estante(); // genera vector de libros vacio

        while (!estante.libros_lleno()) { // mientas no este el vector lleno

            Autor autor = new Autor();
            autor.setNombre(GeneradorAleatorio.generarString(5));
            autor.setBiografia(GeneradorAleatorio.generarString(5));
            autor.setOrigen(GeneradorAleatorio.generarString(5));

            Libro libro = new Libro();
            libro.setAnioEdicion(GeneradorAleatorio.generarInt(2022));
            libro.setEditorial(GeneradorAleatorio.generarString(5));
            libro.setISBN(GeneradorAleatorio.generarString(5));
            libro.setPrecio(GeneradorAleatorio.generarDouble(2));
            libro.setPrimerAutor(autor);
            System.out.println("ingrese titulo de libro");
            libro.setTitulo(Lector.leerString());

            estante.cargar_libro(libro);
        }

        Libro aux = new Libro();
        aux = estante.devuelve_Libro("mujercita");
        System.out.println("libro " + aux.toString());
        if (aux != null) {
            System.out.println(aux.getPrimerAutor());
        }

    }

}
