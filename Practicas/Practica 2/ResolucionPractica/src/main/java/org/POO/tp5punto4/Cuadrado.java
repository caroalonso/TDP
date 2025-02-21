package org.POO.tp5punto4;

public class Cuadrado extends Figura {
    private double lado;

    public Cuadrado(double unLado, String unColorR, String unColorL) {
        super(unColorR, unColorL);
        this.lado=unLado;
    }

    public double getLado() {
        return lado;
    }

    public void setLado(double unLado) {
        lado = unLado;
    }

    @Override
    public double calcularArea() {
        return (getLado() * getLado());
    }

    @Override
    public double calcularPerimetro() {
        return (getLado() * 4);
    }

    public String toString() {
        return super.toString() + " Lado: " + getLado();
    }

}
