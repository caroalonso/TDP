
package org.POO.tp4punto1;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public Circulo() {}

    public Circulo(double radio, String colorRelleno, String colorLinea) {
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }


    public double calcularArea() {
        return Math.PI * (this.radio * this.radio); // Area: pi x radio al cuadrado
    }

    public double calcularPerimetro() {
        return 2 * Math.PI * this.radio; // Perimetro: 2 x pi x radio
    }

}
