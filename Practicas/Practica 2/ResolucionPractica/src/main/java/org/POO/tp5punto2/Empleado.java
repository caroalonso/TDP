
package org.POO.tp5punto2;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;

    public Empleado(String nombre, double sueldoBasico, int antiguedad) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo_basico() {
        return this.sueldoBasico;
    }

    public void setSueldo_basico(double sueldo_basico) {
        this.sueldoBasico = sueldo_basico;
    }

    public int getAntiguedad() {
        return this.antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public double diezporciento() {
        return ((((10 * this.getSueldo_basico()) / 100) + this.getSueldo_basico()) * this.getAntiguedad());
    }

    public String toString() {
        return "Empleado nombre: " + nombre + " sueldobasico: " + sueldoBasico + " antiguedad: " + antiguedad;
    }

    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
