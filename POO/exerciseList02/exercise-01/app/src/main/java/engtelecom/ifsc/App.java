package engtelecom.ifsc;

import edu.princeton.cs.algs4.Draw;

public class App {
    
    public static void main(String[] args) {
        
    Draw d = new Draw();
    d.clear(d.LIGHT_GRAY);
    d.setPenColor(d.BLUE);
    d.square(0.8, 0.2, 0.1);
    d.setPenRadius(0.05);
    d.filledSquare(0.2, 0.8, 0.1);
    d.point(0.1, 0.1);
    d.point(0.9, 0.9);
    d.setPenColor(d.RED);
    d.line(0.9, 0.5, 0.5, 0.8);
    d.circle(0.7, 0.65, 0.25);
    d.text(0.7,0.75, "Ctrl C"); d.text(0.7,0.55, "Ctrl V");
    d.setPenColor(d.WHITE);
    d.filledCircle(0.3, 0.3, 0.2);
    d.setPenColor(d.BLACK);
    double r2 = 0.08; double r3 = 0.05; double r4 = 0.17; double r5 = 0.19;
    d.setPenRadius(0.01);
    for (int i = 0; i < 12; i++) {
    double theta = Math.toRadians(30 * i);

    // https://brasilescola.uol.com.br/matematica/simetria-no-circulo-trigonometrico.html

    d.line(0.3 + r5*Math.sin(theta), 0.3 + r5*Math.cos(theta), 0.3 + r4*Math.sin(theta), 0.3 + r4*Math.cos(theta));
    }
    int horas = 7; int minutos = 30; int segundos = 15;
    double h = Math.toRadians(30 * horas);
    double m = Math.toRadians(6 * minutos); double s = Math.toRadians(6 * segundos);

    // 360 graus / 12 horas = 30 graus

    d.line(0.3, 0.3, 0.3 + r3 * Math.sin(h), 0.3 + r3 * Math.cos(h));

    //360 graus / 60 minutos = 6 graus

    d.line(0.3, 0.3, 0.3 + r3*2 * Math.sin(m), 0.3 + r3*2 * Math.cos(m));
    d.setPenColor(d.RED);d.setPenRadius(0.005);
    d.line(0.3, 0.3, 0.3 + r2*2 * Math.sin(s), 0.3 + r2*2 * Math.cos(s));

    }
}
