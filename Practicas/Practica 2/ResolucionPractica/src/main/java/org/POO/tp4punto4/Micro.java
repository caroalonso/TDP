package org.POO.tp4punto4;

public class Micro {

    private final int dimf = 20;
    private int diml;
    private String patente;
    private String destino;
    private int hora_salida;
    private boolean[] vector;
    private int cantocupados;

    public Micro() {}

    public Micro(int hora_salida) {
        this.diml = 0;
        this.patente = "ABC123";
        this.destino = "Mar del ";
        this.hora_salida = hora_salida;
        this.cantocupados = 0;
        this.vector = new boolean[dimf];

        for (int i = 0; i < this.dimf; i++) {
            this.vector[i] = false;
        }
    }

    public int getDimf() {
        return dimf;
    }

    public int getDiml() {
        return diml;
    }

    public void setDiml(int diml) {
        this.diml = diml;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public int getHora_salida() {
        return hora_salida;
    }

    public void setHora_salida(int hora_salida) {
        this.hora_salida = hora_salida;
    }

    public int getCantocupados() {
        return cantocupados;
    }

    public int devolver_ocupados() {
        return this.diml;
    }

    public boolean micro_lleno() {
        return this.dimf == this.diml;
    }

    public boolean asiento_existene(int num_asiento) {
        return (num_asiento >= 0) && (num_asiento <= this.dimf);
    }

    public boolean devolver_estado_asiento(int num_asiento) {
        return this.vector[num_asiento];
    }

    public void ocupar_asiento(int num_asiento) {
        if (!this.vector[num_asiento]) {
            this.vector[num_asiento] = true;
            this.diml++;
        }
    }

    public String desocupar_asiento(int num_asiento) {  // el num de asiento es valido , pero verificar si ya se encuentra desocupado
        String aux = "El asiento " + num_asiento + " ya se encontraba desocupado";
        if (this.vector[num_asiento]) {
            this.vector[num_asiento] = false;
            this.diml--;
            aux = "El asiento " + num_asiento + " fue desocupado con exito";
        }
        return aux;
    }

    public int primer() {
        int pos = 0;
        while ((pos < this.dimf) && (this.vector[pos])) {
            pos++;
        }
        if (pos == this.dimf) {
            return -1;
        } else {
            return pos;
        }
    }

}
