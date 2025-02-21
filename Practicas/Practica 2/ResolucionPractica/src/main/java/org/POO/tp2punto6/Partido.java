package org.POO.tp2punto6;

public class Partido {
    private String local;
    private String visitante;
    private int golesLocal;
    private int golesVisitante;

    public Partido() {
    }

    public Partido(String local, String visitante, int unGolLocal, int unGolVisitante) {
        this.local = local;
        this.visitante = visitante;
        this.golesLocal = unGolLocal;
        this.golesVisitante = unGolVisitante;
    }

    public String getLocal() {
        return this.local;
    }

    public String getVisitante() {
        return this.visitante;
    }

    public int getGolesLocal() {
        return this.golesLocal;
    }

    public int getGolesVisitante() {
        return this.golesVisitante;
    }

    public void setLocal(String unEquipo) {
        this.local = unEquipo;
    }

    public void setVisitante(String unEquipo) {
        visitante = unEquipo;
    }

    public void setGolesLocal(int unosGoles) {
        golesLocal = unosGoles;
    }

    public void setGolesVisitante(int unosGoles) {
        this.golesVisitante = unosGoles;
    }

    public boolean hayGanador() {
        return (this.golesLocal != this.golesVisitante);
    }

    public boolean hayEmpate() {
        return (this.golesLocal == this.golesVisitante);
    }

    public String getGanador() {
        if (this.golesLocal > this.golesVisitante)
            return this.local;
        else if (golesLocal < golesVisitante)
            return this.visitante;
        else
            return "empate";
    }

}


