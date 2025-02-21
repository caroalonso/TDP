package org.POO.tp5punto2;

public class Jugador extends Empleado {

    private int partidos;
    private int goles;
    
    public Jugador(int partidos, int goles, String nombre, double sueldo_basico, int antiguedad) {
        super(nombre, sueldo_basico, antiguedad);
        this.partidos = partidos;
        this.goles = goles;
    }
    
    public int getPartidos() {
        return partidos;
    }

    public void setPartidos(int partidos) {
        this.partidos = partidos;
    }

    public int getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }

    @Override
    public double calcularEfectividad() {          // metodo abstracto
        return ((double) this.getGoles() / this.getPartidos());
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux1 = super.diezporciento() + super.getSueldo_basico();

        double aux = ((double) this.getGoles() / this.getPartidos());
        if (aux > 0.5) {
            return (aux1 + this.getSueldo_basico());
        } else {
            return aux1;
        }
    }
    
     
  }

