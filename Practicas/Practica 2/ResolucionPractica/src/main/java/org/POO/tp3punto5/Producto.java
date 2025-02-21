
package org.POO.tp3punto5;

public class Producto {
    private double pesoEnKg;
    private String descripcion;

    public Producto() {}

    public Producto(double unPeso, String unaDescripcion) {
        this.pesoEnKg = unPeso;
        this.descripcion = unaDescripcion;
    }

    public double getPesoEnKg() {
        return this.pesoEnKg;
    }

    public void setPesoEnKg(double unPeso) {
        this.pesoEnKg = unPeso;
    }

    public String getDescripcion() {
        return this.descripcion;
    }

    public void setDescripcion(String unaDescripcion) {
        this.descripcion = unaDescripcion;
    }

}
