package org.POO.tp5punto2;

public class Entrenador extends Empleado {

    private int campeonatos;

    public Entrenador(String nombre, double sueldobasico, int antiguedad, int campeonatos) {
        super(nombre,sueldobasico,antiguedad);
        this.campeonatos = campeonatos;
    }

    public int getCampeonatos() {
        return this.campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    @Override
    public double calcularEfectividad() {
        //promedio de campeonatos ganados ... x año de antiguedad
        return this.campeonatos / this.getAntiguedad(); //??????
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = ((((10 * this.getSueldo_basico()) / 100) + this.getSueldo_basico()) * this.getAntiguedad());
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
