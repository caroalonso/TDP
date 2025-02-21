package org.POO.tp3punto3;

public class Entrenador {

    private String nombre;
    private double sueldobasico;
    private int antiguedad;
    private int campeonatos;

    public Entrenador() {
    }

    public Entrenador(String nombre, double sueldobasico, int antiguedad, int campeonatos) {
        this.nombre = nombre;
        this.sueldobasico = sueldobasico;
        this.antiguedad = antiguedad;
        this.campeonatos = campeonatos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldobasico() {
        return sueldobasico;
    }

    public void setSueldobasico(double sueldobasico) {
        this.sueldobasico = sueldobasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    //--------------------------------metodos
    public double calcularEfectividad() {
        //promedio de campeonatos ganados ... x año de antiguedad
        return  this.campeonatos/this.antiguedad; //??????
    }

    public double calcularSueldoACobrar() {

        double aux = ((((10 * this.sueldobasico) / 100) + this.sueldobasico) * this.antiguedad);
        if ((this.campeonatos >= 1) && (this.campeonatos <= 4)) {
            aux = (aux + 5000);
        } else {
            if ((this.campeonatos >= 5) && (this.campeonatos <= 10)) {
                aux = (aux + 30000);
            } else {
                if (this.campeonatos > 10) {
                    aux = (aux + 50000);
                }
            }
        }
        return aux;
    }
}
