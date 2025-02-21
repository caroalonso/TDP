package org.POO.tp4punto3;

public class Estante {

    private final int dimf = 3; // SON 20
    private int diml;
    private Libro[] vector; // vector de libros (tipo corchetes nombre)

//------------------------------------------------------------------ CONSTRUCTOR
    public Estante() {
        this.diml = 0;   // dimencion logica en cero
        this.vector= new Libro[this.dimf];
        
        for (int i = 0; i < this.dimf; i++) {  // inicio vector de libros vacio.
            this.vector[i]= null;
        }
    }
//------------------------------------------------------------------ SET AND GET

    public int getDiml() {  //(i) devolver la cantidad de libros que almacenados.
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public int getDimf() {
        return dimf;
    }
//-----------------------------------------------------------------------METODOS    

    public boolean libros_lleno() {
        return this.getDimf() == this.getDiml();  // (ii) devolver si el estante está lleno.
    }

    public void cargar_libro(Libro libro) {  // (iii) agregar un libro al estante.
        if (this.diml < this.dimf) {
            this.vector[this.diml] = libro; 
            this.diml++;
        }
    }

    public Libro devuelve_Libro(String titulo) { //(iv) devolver el libro con un título particular que se recibe.
        boolean cumple = false;
        Libro aux =null;
        int pos = 0;
        while ((pos < this.diml) && (!cumple)) {
            if (this.vector[pos].getTitulo().equals(titulo)) {
                cumple = true;
                aux = this.vector[pos];
            } else {
                pos++;
            }
        }
        return aux;
    }
}
