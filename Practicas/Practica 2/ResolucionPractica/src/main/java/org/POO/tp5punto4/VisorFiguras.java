package org.POO.tp5punto4;

public class VisorFiguras {

    private int mostradas;

    public VisorFiguras() {
        mostradas = 0;
    }

    public void mostrar(Figura f) {
        System.out.println(f.toString());
        mostradas++;
    }

    public int getMostradas() {

        return this.mostradas;
    }
    
}

