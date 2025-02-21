package org.POO.tp5punto5;

public class VisorFigurasModificado {

    private int dimf = 5;
    private int diml = 0;
    private Figura[] vector;

    public VisorFigurasModificado() {

        vector = new Figura[this.getDimf()];

        for (int i = 0; i < this.getDimf(); i++) {
            this.vector[i] = null;
        }
    }

    public void guardar(Figura f) {
        if (diml < dimf) {
            this.vector[diml] = f;
            diml++;
        }
    }

    public boolean quedaEspacio() {
        if (this.diml == this.dimf)
            return false;
        return true;
    }

    public void mostrar() {
        for (int i = 0; i < this.getDiml(); i++) {
            System.out.println(this.vector[i]);
        }
    }

    public int getDimf() {
        return this.dimf;
    }

    public int getDiml() {
        return this.diml;
    }

}
