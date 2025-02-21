// 4)
// A- Definir una clase para representar micros.
// Un micro conoce su
// patente,
// destino,
// hora de salida,
// el estado de sus 20 asientos (boolean: true ocupado, false libre)
// y la cantidad de asientos ocupados al momento.
//
// Lea detenidamente a) y b) y luego implemente.
// a) Implemente un constructor que permita iniciar el micro con
// una patente,
// un destino y
// una hora de salida (que se reciben)
// y con sus asientos libres.
//
// b) Implemente métodos para:
// i. devolver/modificar patente, destino y hora de salida // get and set
// ii. devolver la cantidad de asientos ocupados // get diml
// iii. devolver si el micro está lleno  // diml=dimf
// iv. validar un nro. de asiento que se recibe (es decir, devolver si está en rango o no) // 0 a dimf
// v. devolver el estado de un nro. de asiento válido que se recibe // true o false
// vi. ocupar un nro. de asiento válido que se recibe
// vii. liberar un nro. de asiento válido que se recibe
// viii. devolver el nro. del primer asiento libre
//
// B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
// hora de salida “5:00”. Lea 5 nros. de asiento, que corresponden a pedidos de personas.
// Para cada nro. ingresado debe: validar el nro.; en caso que esté libre dicho asiento,
// ocuparlo e informar el éxito de la operación; en caso que esté ocupado, mostrar el nro. del
// primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro.

package org.POO.tp4punto4;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        int num;
        Micro m = new Micro(5); // hora de salida

        System.out.println();
        for (int i = 0; i < 5; i++) {
            num = GeneradorAleatorio.generarInt(20)+1;        // ingresa numero de asiento
            if (m.asiento_existene(num)) {                  // si el numero de asiento es valido ..
                if (!m.devolver_estado_asiento(num)) {    // si el asiento desocupado
                    m.ocupar_asiento(num);               // ocupa asiento
                    System.out.println("El asiento " + num + " fue ocupado con exito");  // informa 
                } else {
                    System.out.println("El asiento " + num + " ya se encuentra ocupado"); // informa
                    if (m.primer() != -1) {                                         // busca asiento desocupado
                        System.out.println("Numero de asiento disponible: " + m.primer());  // informa asiento libre
                    } else {
                        System.out.println("No hay mas asientos disponibles");
                    }
                }
            } else {
                System.out.println("El numero de asiento " + num + " no es un asiento valido ");
            }
        }
        System.out.println("\nCantidad de asientos ocupados: " + m.getDiml());

    }

}
