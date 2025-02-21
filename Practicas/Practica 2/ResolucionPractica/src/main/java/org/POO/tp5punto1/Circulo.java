
package org.POO.tp5punto1;

public class Circulo extends Figura {
    private double radio;

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        super(colorLinea, colorLinea);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String toString() {
        return super.toString() + "Radio: " + this.getRadio();
    }

    public double calcularArea() {
        return Math.PI * (this.radio * this.radio); // Area: pi x radio al cuadrado
    }

    public double calcularPerimetro() {
        return 2 * Math.PI * this.radio; // Perimetro: 2 x pi x radio
    }

}
