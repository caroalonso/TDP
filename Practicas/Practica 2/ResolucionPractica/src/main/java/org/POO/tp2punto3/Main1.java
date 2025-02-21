package org.POO.tp2punto3;

public class Main1 {
    public static void main(String[] args) {
        String saludo1 = new String("hola");
        String saludo2 = new String("hola");

        System.out.println(saludo1 == saludo2);
        System.out.println(saludo1 != saludo2);
        System.out.println(saludo1.equals(saludo2));
    }
}

// Responda:
// A.¿Qué imprimen los siguientes programas?
// B.¿Qué efecto tiene la asignación utilizada con objetos?
// C.¿Qué efecto tiene la comparación con == y != utilizada con objetos?
// D.¿Qué retorna el mensaje equals cuando se le envía a un String?

// Respuestas:

// A. false,true,true

// B.Cuando usas new String("hola"), estás creando dos objetos
// distintos en la memoria heap, incluso si el contenido es el mismo.
// Esto es diferente de usar "hola" directamente, lo que aprovecharía
// el String Pool de Java para reutilizar instancias.

// C. == y != comparan referencias de objetos, no su contenido.
// saludo1 == saludo2 es false porque son dos objetos distintos en la memoria.
// saludo1 != saludo2 es true porque las referencias son diferentes.
// Si hubieras usado String saludo1 = "hola"; String saludo2 = "hola";
// la comparación con == daría true porque ambos apuntarían al mismo objeto en el String Pool.

// D.El método equals en String compara el contenido de la cadena, no su referencia.
//Si dos String tienen el mismo contenido, equals retorna true.
//Si el contenido es diferente, retorna false.