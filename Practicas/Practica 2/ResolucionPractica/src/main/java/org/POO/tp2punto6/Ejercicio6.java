// Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados
// en el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
// nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga informar:
// - La cantidad de partidos que ganó River.
// - El total de goles que realizó Boca jugando de local.
// - El porcentaje de partidos finalizados con empate.

package org.POO.tp2punto6;

import PaqueteLectura.Lector;

public class Ejercicio6 {
public static void main(String[] args) {
    int dimf = 20;
    Partido[] vector = new Partido[dimf];
    int diml = 0;
    int riverGanados = 0;
    int totalGolesBocaLocal = 0;
    int empates = 0;

    System.out.println("ingrese nombre del local: ");
    String local = Lector.leerString();

    while ((diml < dimf) && (!local.equals("ZZZ"))) {
        System.out.println("ingrese nombre del visitante: ");
        String visitante = Lector.leerString();
        System.out.println("ingrese cantidad goles local: ");
        int golesLocal = Lector.leerInt();
        System.out.println("ingrese cantidad goles visitante: ");
        int golesVisitante = Lector.leerInt();

        Partido partido = new Partido(local, visitante, golesLocal, golesVisitante);
        vector[diml] = partido;
        diml++;

        System.out.println("ingrese nombre del local: ");
        local = Lector.leerString();
    }

    for (int i = 0; i < diml; i++) {
        if (vector[i].getGanador().equals("river")) //partidos ganados por river
            riverGanados++;
        if (vector[i].getLocal().equals("boca"))  // goles  hechos por boca
            totalGolesBocaLocal += vector[i].getGolesLocal();
        if (vector[i].hayEmpate())  //si hay empate
            empates++;
    }

    double porcentajeEmpates = (diml > 0) ? ((double) empates / diml) * 100 : 0;
    System.out.println("La cantidad de partidos que gano River: " + riverGanados);
    System.out.println("El total de goles que realizo Boca jugando de local: " + totalGolesBocaLocal);
    System.out.println("El porcentaje de partidos finalizados con empate: " + String.format("%.2f", porcentajeEmpates) + "%");
}

}

