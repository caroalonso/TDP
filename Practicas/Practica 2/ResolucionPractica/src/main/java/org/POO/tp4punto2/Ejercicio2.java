// 2)
// A- Modifique la clase Libro (carpeta tema 4) para ahora considerar que el primer autor
// es un objeto instancia de la clase Autor. Implemente la clase Autor, sabiendo que éstos se
// caracterizan por nombre, biografía y origen y que deben permitir devolver/modificar el
// valor de sus atributos y devolver una representación String formada por nombre, biografía y origen.
//
// B- Modifique el programa Demo01Constructores (carpeta tema 4) para instanciar los
// libros con su autor, considerando las modificaciones realizadas. A partir de uno de los
// libros, obtenga e imprima la representación del autor de ese libro.

package org.POO.tp4punto2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        VectorLibros vectorLibros = new VectorLibros(); // genera vector de libros vacio

        while (!vectorLibros.libros_lleno()) { // mientas no este el vector lleno

            Autor autor = new Autor();
            autor.setNombre(GeneradorAleatorio.generarString(5));
            autor.setBiografia(GeneradorAleatorio.generarString(5));
            autor.setOrigen(GeneradorAleatorio.generarString(5));

            Libro libro = new Libro();
            libro.setAnioEdicion(GeneradorAleatorio.generarInt(2022));
            libro.setEditorial(GeneradorAleatorio.generarString(5));
            libro.setISBN(GeneradorAleatorio.generarString(5));
            libro.setPrecio(GeneradorAleatorio.generarDouble(2));
            libro.setTitulo(GeneradorAleatorio.generarString(5));
            libro.setPrimerAutor(autor);

            vectorLibros.cargar_libro(libro);   //???????????
        }

        System.out.println();
        System.out.println(vectorLibros.string_Libro(2));

    }

}
