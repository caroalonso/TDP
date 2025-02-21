package org.POO.tp4punto2;

public class Autor {

    private String nombre;

    private String biografia;
    private String origen;

    public Autor() {}

    public Autor(String nombre, String biografia, String origen) {
        this.nombre = nombre;
        this.biografia = biografia;
        this.origen = origen;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return this.biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return this.origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return ("Autor nombre=" + this.nombre + ", biografia=" + this.biografia + ", origen=" + this.origen);
    }

}


