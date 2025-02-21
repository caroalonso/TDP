//5)
// -A- Definir una clase para representar flotas de micros. Una flota conoce a los micros que
// la componen (a lo sumo 15). Provea un constructor para crear una flota vacía (sin micros).
// Implemente métodos para:
// i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
// ii. agregar a la flota un micro que se recibe.
// iii. buscar en la flota un micro con destino igual a uno que se recibe y retornarlo (en
// caso de no existir dicho micro, retornar null).
//
// B- Realice un programa que cree una flota vacía. Cargue varios micros (sin pasajeros) a la
// flota. Luego, lea un destino e informe si en la flota hay un micro que va a ese destino.

package org.POO.tp4punto5;

import java.util.Scanner;

public class Ejercicio5 {

    public static  class Main {
        public static void main(String[] args) {
            Flota flota = new Flota();

            // Agregar algunos micros a la flota
            flota.agregarMicro(new Micro("ABC123", "Buenos Aires", "08:00"));
            flota.agregarMicro(new Micro("DEF456", "Cordoba", "10:00"));
            flota.agregarMicro(new Micro("GHI789", "Rosario", "12:00"));

            // Pedir un destino y buscar si hay un micro que va allí
            Scanner scanner = new Scanner(System.in);
            System.out.print("Ingrese un destino para buscar un micro: ");
            String destino = scanner.nextLine();

            Micro encontrado = flota.buscarMicroPorDestino(destino);
            if (encontrado != null) {
                System.out.println("Se encontró un micro con destino a " + destino);
            } else {
                System.out.println("No hay micros con destino a " + destino);
            }
            scanner.close();
        }
    }

}
