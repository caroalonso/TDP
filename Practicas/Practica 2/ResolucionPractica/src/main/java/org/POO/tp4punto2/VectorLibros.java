package org.POO.tp4punto2;

public class VectorLibros {

    private final int dimf = 3;
    private int diml;
    private Libro[] vector; // vector de libros (tipo corchetes nombre)

    public VectorLibros() {
        this.diml = 0;   // dimencion logica en cero
        this.vector = new Libro[this.dimf];

        for (int i = 0; i < this.dimf; i++) {  // inicio vector de libros vacio.
            this.vector[i] = null;
        }
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getDimf() {
        return dimf;
    }

    public boolean libros_lleno() {
        return this.getDimf() == this.getDiml();  // si se llena el vector.
    }

    public void cargar_libro(Libro libro) {  // carga un libro si hay espacio en el vector
        if (this.vector[this.diml] == null && this.diml < this.dimf) {
            this.vector[this.diml] = libro;
            this.diml++;
        }
    }

    public String string_Libro(int indice) {
        return this.vector[indice].toString();
    }
}
