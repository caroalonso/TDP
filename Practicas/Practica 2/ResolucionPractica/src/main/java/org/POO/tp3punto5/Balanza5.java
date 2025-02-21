package org.POO.tp3punto5;

public class Balanza5 {

    private double monto;
    private int items;
    private String resumen;

    public Balanza5() {}

    public Balanza5(double monto, int items, String resumen) {
        this.monto = monto;
        this.items = items;
        this.resumen = resumen;
    }

    public double getMonto() {
        return monto;
    }

    public int getItems() {
        return items;
    }


    public void iniciarcompra5() {
        this.monto = 0;
        this.items = 0;
        this.resumen = "";
    }

    public void registrarProducto5(Producto p, double precioPorKg) {
        this.monto = this.monto + (p.getPesoEnKg() * precioPorKg);
        this.items++;
        this.resumen += p.getDescripcion() + " - $ " + String.format("%.2f", ((p.getPesoEnKg() * precioPorKg))) + "\n";
    }

    public String getResumenDeCompra() {
        return (this.resumen + "Total a pagar: $ " + String.format("%.2f", (this.monto)) + " ,por la compra de " + this.items + " productos.");
    }

}
