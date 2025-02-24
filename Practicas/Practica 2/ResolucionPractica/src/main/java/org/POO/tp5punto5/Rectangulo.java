package org.POO.tp5punto5;

public class Rectangulo extends Figura {
    private double base;
    private double altura;

    public Rectangulo(double base, double altura, String unColorR, String unColorL) {
        super(unColorR, unColorL);
        setBase(base);
        setAltura(altura);
    }

    public double getBase() {
        return base;
    }

    public void setBase(double unaBase) {
        base = unaBase;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double unaAltura) {
        altura = unaAltura;
    }

    @Override
    public double calcularArea() {
        return (getBase() * getAltura());
    }

    @Override
    public double calcularPerimetro() {
        return (2 * getBase() + 2 * getAltura());
    }

    public String toString() {
        return super.toString() + " Base: " + getBase() + " Altura: " + getAltura();
    }
}
