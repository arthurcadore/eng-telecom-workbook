package engtelecom.poo;

import java.util.ArrayList;

public class App {

    public static void main(String[] args) {

        double[] i = new double[] { 1, 2 };
        double[] f = new double[] { 2, 2 };

        Linha l = new Linha(i, "GRAY", f);

        l.desenhar();

        Circulo c = new Circulo(i, "GRAY", "gray", 10);

        ArrayList<FormaGeometrica> formas = new ArrayList<>();

        formas.add(c);
        formas.add(l);

        formas.forEach(fo -> fo.desenhar());

        for (FormaGeometrica fo : formas) {
            fo.desenhar();
        }

    }
}
