// 3)
// A-
// Definir una clase para representar entrenadores de un club.
// Un entrenador se caracteriza por su
// nombre,
// sueldo básico,
// antigüedad
// y cantidad de campeonatos ganados.
//
// - Defina métodos para obtener/modificar el valor de cada atributo.
// - Defina el método calcularEfectividad que devuelve la efectividad del entrenador, que
// es el promedio de campeonatos ganados por año de antigüedad.
// - Defina el método calcularSueldoACobrar que devuelve el sueldo a cobrar por el entrenador.
//
// El sueldo a cobrar es el sueldo básico agregando un 10% del básico por
// año de antigüedad, y además se adiciona un plus por campeonatos ganados (5000$ si
// ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado entre 5 y 10 campeonatos;
// 50.000$ si ha ganado más de 10 campeonatos).
//
// B- Realizar un programa que instancie un entrenador, cargándole datos leídos desde teclado.
// Informe el sueldo a cobrar y la efectividad del entrenador.

package org.POO.tp3punto3;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3 {

    public static void main(String[] args) {
      GeneradorAleatorio.iniciar();

      String nombre;
      double sueldobasico;
      int antiguedad;
      int campeonatos;

      System.out.println();
      System.out.println("Ingrese nombre: " + (nombre = GeneradorAleatorio.generarString(5)));
      System.out.println("Ingrese sueldo basico : " + String.format("%.2f",(sueldobasico = GeneradorAleatorio.generarInt(100000))));
      System.out.println("Ingrese años de antiguedad : "+ (antiguedad = GeneradorAleatorio.generarInt(6)+1));
      System.out.println("Ingrese cantidad de campeonatos ganados : "+ (campeonatos = GeneradorAleatorio.generarInt(10)));
      System.out.println("");
      
      Entrenador entrenador = new Entrenador(nombre, sueldobasico, antiguedad, campeonatos);
      
      System.out.println("Sueldo a cobrar $ :  " + String.format("%.2f",(entrenador.calcularSueldoACobrar())));
      System.out.println("Efectividad de entrenador :  " + String.format("%.2f",(entrenador.calcularEfectividad())));
            
    }

}
