// 2)
// A-Definir una clase para representar balanzas comerciales
// (para ser utilizadas en verdulerías, carnicerías, etc).
// Una balanza comercial sólo mantiene el monto y la cantidad de items correspondientes a la compra actual
// (es decir, no almacena los ítems de la compra).
// La balanza debe responder a los siguientes mensajes:
//- iniciarCompra(): inicia el monto y la cantidad de ítems para la compra actual.
//- registrarProducto(pesoEnKg, precioPorKg): recibe el “peso en kilos” del ítem comprado y su
// “precio por kilo”, y actualiza el estado de la balanza.
//- getMonto(): retorna el monto a pagar por la compra actual.
//- getResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
// compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra.
//
// B-Realizar un programa que instancie una balanza e inicie una compra.
// Lea desde teclado información de los ítems comprados (peso en kg y precio por kg) hasta ingresar peso 0.
// Registre cada producto en la balanza.
// Al finalizar, informe el resumen de la compra.

package org.POO.tp3punto2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        double precio_por_kilo;
        int kilos;
        Balanza balanza = new Balanza();

        balanza.iniciarcompra();
        System.out.println();
        System.out.println("ingrese la cantidad de kilos comprados: " + (kilos = GeneradorAleatorio.generarInt(3)));
        while (kilos != 0) {
            System.out.println("ingrese el precio por kilo del producto " + String.format("%.2f", (precio_por_kilo = GeneradorAleatorio.generarDouble(30))));
            balanza.registrarProducto(kilos, precio_por_kilo);
            System.out.println("Ingrese la cantidad de kilos comprados: " + (kilos = GeneradorAleatorio.generarInt(3)));
        }
        System.out.println();
        System.out.println(balanza.getResumenDeCompra());
    }

}
