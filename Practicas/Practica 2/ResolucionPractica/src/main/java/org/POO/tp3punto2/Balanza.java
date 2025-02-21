
package org.POO.tp3punto2;

public class Balanza {
    private double monto;
    private int items;

    public Balanza() {}

    public Balanza(double monto, int items) {
        this.monto = monto;
        this.items = items;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getItems() {
        return items;
    }

    public void setItems(int items) {
        this.items = items;
    }

    public void iniciarcompra() {
        this.monto = 0;
        this.items = 0;
    }

    public void registrarProducto(int pesoEnKg, double precioPorKg) {
        this.setMonto(this.getMonto() + (pesoEnKg * precioPorKg));
        this.items++;
    }

    public String getResumenDeCompra() {
        return ("Total a pagar: $ " + String.format("%.2f", (this.monto)) + " ,por la compra de " + this.items + " productos.");
    }

}
