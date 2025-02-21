
package org.POO.tp4punto3;

public class Libro {
    private String titulo;
    private Autor primerAutor;
    private String editorial;
    private int anioEdicion;
    private String ISBN;
    private double precio;

    public Libro() {}

    public Libro(String titulo, String editorial, int anioEdicion, Autor unPrimerAutor, String unISBN, double precio) {
        this.titulo = titulo;
        this.editorial = editorial;
        this.anioEdicion = anioEdicion;
        this.primerAutor = unPrimerAutor;
        this.ISBN = unISBN;
        this.precio = precio;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public String getEditorial() {
        return this.editorial;
    }

    public int getAñoEdicion() {
        return this.anioEdicion;
    }

    public String getISBN() {
        return this.ISBN;
    }

    public double getPrecio() {
        return this.precio;
    }

    public void setTitulo(String unTitulo) {
        this.titulo = unTitulo;
    }

    public void setEditorial(String unaEditorial) {
        this.editorial = unaEditorial;
    }

    public void setAnioEdicion(int unAño) {
        this.anioEdicion = unAño;
    }

    public void setISBN(String unISBN) {
        this.ISBN = unISBN;
    }

    public void setPrecio(double unPrecio) {
        this.precio = unPrecio;
    }

    public double getPrecioFinal() {
        return this.precio + (this.precio * 0.21);
    }

    public void setPrimerAutor(Autor primerAutor) {
        this.primerAutor = primerAutor;
    }

    public Autor getPrimerAutor() {
        return this.primerAutor;
    }

    @Override
    public String toString() {
        return this.titulo + " por " + this.primerAutor.toString() + " - " + this.anioEdicion + " - " + " ISBN: " + this.ISBN;
    }

}
