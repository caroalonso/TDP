//5)
// A- Se dispone de la clase Producto (en la carpeta tema3).
// Un objeto producto puede crearse sin valores iniciales o enviando en el mensaje de creación el “peso en kg” y
// “descripción” (en ese orden).
// Un objeto producto responde a los siguientes mensajes:
//
// -getDescripcion() retorna la descripción (String) del producto
// -getPesoEnKg() retorna el peso en kg (double) del producto
// -setDescripcion(X) modifica la descripción del producto al “String” X
// -setPesoEnKg(X) modifica el peso del producto al “double” X
//
// Usando la clase Producto. Realice las siguientes modificaciones a la clase del ejercicio 2-A.
// Ahora la balanza debe generar un resumen de compra más completo. Agregue a la balanza
// la característica resumen (String) y modifique los métodos como se indica a continuación:
//
// - iniciarCompra para que además inicie el resumen en el String vacío.
// - registrarProducto para que reciba un objeto Producto y su “precio por kg”. La
// operación debe actualizar el monto y cantidad de ítems de la balanza, y concatenar al
// resumen la descripción y el monto a pagar por este producto.
// - getResumenDeCompra para que retorne un String del siguiente estilo: “Naranja 100$ –
// Banana 40$ – Lechuga 50$ – Total a pagar 190 pesos por la compra de 3 productos”
// donde la parte subrayada es el contenido de resumen.
// B- Realice las modificaciones necesarias en el programa principal solicitado en 2-B para
// corroborar el funcionamiento de la balanza.


package org.POO.tp3punto5;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio5 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();

        double precio_por_kilo;
        int kilos;
        String nombre_producto;
        Balanza5 compra = new Balanza5();

        compra.iniciarcompra5();

        System.out.println();
        System.out.println("Ingrese la cantidad de kilos comprados: " + (kilos = GeneradorAleatorio.generarInt(4)));
        while (kilos != 0) {
            System.out.println("Ingrese el precio por kilo del producto " + String.format("%.2f", (precio_por_kilo = GeneradorAleatorio.generarDouble(30))));
            System.out.println("Ingrese nombre del producto: " + (nombre_producto = GeneradorAleatorio.generarString(5)));
            Producto P = new Producto(kilos, nombre_producto);
            compra.registrarProducto5(P, precio_por_kilo);
            System.out.println();
            System.out.println("Ingrese la cantidad de kilos comprados: " + (kilos = GeneradorAleatorio.generarInt(4)));
        }

        System.out.println("\nRESUMEN:");
        System.out.println(compra.getResumenDeCompra());
    }
}

