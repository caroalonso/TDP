// B- Realice un programa que instancie el visor, guarde dos cuadrados y un rectángulo en el
// visor y por último haga que el visor muestre sus figuras almacenadas.

package org.POO.tp5punto5;

public class Ejercicio5 {

    public static void main(String[] args) {

        VisorFigurasModificado vectorfiguras = new VisorFigurasModificado();

        Cuadrado c1 = new Cuadrado(2.5, "Amarillo", "Naranja");
        Cuadrado c2 = new Cuadrado(8.5, "Verde", "violeta");
        Rectangulo re = new Rectangulo(5.5, 7.6, "Blanco", "Negro");

        if (vectorfiguras.quedaEspacio()) {
            vectorfiguras.guardar(c1);
            if (vectorfiguras.quedaEspacio()) {
                vectorfiguras.guardar(c2);
                if (vectorfiguras.quedaEspacio()) {
                    vectorfiguras.guardar(re);
                }
            }
        }
        System.out.println();
        vectorfiguras.mostrar();
    }
}
