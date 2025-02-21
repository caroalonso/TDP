
package org.POO.tp5punto1;

public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;


    public Triangulo(double lado1, double lado2, double lado3, String relleno, String linea) {
        super(linea, linea);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public double calcularPerimetro() {
        return this.lado1 + this.lado2 + this.lado3;
    }

    public double calcularArea() {
        double s = (this.calcularPerimetro() / 2);
        return Math.sqrt((s * (s - this.lado1) * (s - this.lado2) * (s - this.lado3)));
    }

    public String toString() {
       return super.toString() + " Lado1: " + this.getLado1()
                + " Lado2: " + this.getLado2()
                + " Lado3: " + this.getLado3();
    }
}
