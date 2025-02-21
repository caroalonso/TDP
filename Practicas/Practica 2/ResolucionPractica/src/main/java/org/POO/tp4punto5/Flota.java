package org.POO.tp4punto5;

import java.util.ArrayList;

public class Flota {

        private ArrayList<Micro> micros;
        private static final int MAX_MICROS = 15;

        // Constructor: crea una flota vacía
        public Flota() {
            this.micros = new ArrayList<>();
        }

        // Devuelve si la flota está completa (tiene 15 micros)
        public boolean estaCompleta() {
            return micros.size() == MAX_MICROS;
        }

        // Agrega un micro a la flota si no está llena
        public void agregarMicro(Micro m) {
            if (!estaCompleta()) {
                micros.add(m);
            } else {
                System.out.println("La flota esta completa. No se puede agregar mas micros.");
            }
        }

        // Busca un micro por destino y lo retorna (o null si no existe)
        public Micro buscarMicroPorDestino(String dest) {
            for (Micro m : micros) {
                if (m.getDestino().equalsIgnoreCase(dest)) {
                    return m;
                }
            }
            return null;
        }
    }


