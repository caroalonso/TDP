package org.POO.tp2punto3;

public class Main2 {
    public static void main(String[] args) {

        Persona p1 = new Persona();
        p1.setNombre("Pablo Sotile");
        p1.setDNI(11200413);
        p1.setEdad(40);

        Persona p2 = new Persona();
        p2.setNombre("Julio Toledo");
        p2.setDNI(22433516);
        p2.setEdad(51);

        p1 = p2;
        p1.setEdad( p1.getEdad() + 1 );
        System.out.println(p2.toString());
        System.out.println(p1.toString());
        System.out.println( (p1 == p2) );
    }
}

// Responda:
// A.¿Qué imprimen los siguientes programas?
// B.¿Qué efecto tiene la asignación utilizada con objetos?
// C.¿Qué efecto tiene la comparación con == y != utilizada con objetos?
// D.¿Qué retorna el mensaje equals cuando se le envía a un String?

// Respuestas:
// A. Mi nombre es Julio Toledo, mi DNI es 22433516 y tengo 52 años.
//    Mi nombre es Julio Toledo, mi DNI es 22433516 y tengo 52 años.
//    true

// B. No se copia el contenido, sino que p1 ahora apunta al mismo objeto que p2.
// El objeto original de p1 se pierde si no hay otra referencia que lo conserve.
// Cualquier cambio en p1 también afecta a p2, ya que ambos comparten la misma instancia.

// C. == y != comparan referencias de memoria, no el contenido del objeto.
// En este caso, p1 == p2 da true porque después de p1 = p2, ambas referencias
// apuntan al mismo objeto.

// D. El método equals en String compara el contenido de las cadenas:
// Si tienen el mismo contenido, devuelve true.
// Si son diferentes, devuelve false.