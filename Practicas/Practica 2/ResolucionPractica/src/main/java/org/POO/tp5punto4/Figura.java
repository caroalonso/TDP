package org.POO.tp5punto4;

public abstract class Figura {

    private String colorRelleno;
    private String colorLinea;

    public Figura(String unCR, String unCL) {
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }

    public String toString() {
        return "Area: " + this.calcularArea()
                + " Perimetro : " + this.calcularPerimetro()
                + " Color Relleno: " + getColorRelleno()
                + " Color Linea: " + getColorLinea();
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String unColor) {
        colorRelleno = unColor;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String unColor) {
        colorLinea = unColor;
    }

    public abstract double calcularArea();

    public abstract double calcularPerimetro();

    public void despintar() {
        this.setColorLinea("negro");
        this.setColorRelleno("blanco");
    }
}
