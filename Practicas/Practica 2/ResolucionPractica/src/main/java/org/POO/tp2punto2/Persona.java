package org.POO.tp2punto2;

public class Persona {

    private String nombre;
    private int dni;
    private int edad;

    public Persona(String nombre, int dni, int edad) {
        this.nombre=nombre;
        this.dni = dni;
        this.edad = edad;
    }

    public int getDni() {return this.dni;}

    public int getEdad() {
        return this.edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String toString() {
        return "Mi nombre es " + this.nombre + ", mi DNI es " + this.dni + " y tengo " + this.edad + " años.";
    }
}
