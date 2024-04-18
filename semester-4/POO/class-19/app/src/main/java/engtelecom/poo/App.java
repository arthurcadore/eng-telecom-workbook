
package engtelecom.poo;

import edu.princeton.cs.algs4.Draw;
import edu.princeton.cs.algs4.DrawListener;
import engtelecom.caixa.Caixa;

public class App implements DrawListener {

    private Draw desenho;

    public App() {

        this.desenho = new Draw();
        this.desenho.setXscale(0, 800);
        this.desenho.setYscale(0, 800);
        this.desenho.enableDoubleBuffering();
        this.desenho.addListener(this);

    }

    public void desenharTela() {

        Circulo c = new Circulo(400, 400, 100, Cores.AZUL);

        this.desenho.clear();

        c.desenhar(this.desenho);

        this.desenho.show();

        Caixa<String> c2 = new Caixa<>();
        String s = "Olá mundo";

        c2.set(s);

        String outra = c2.getDado();

        System.out.println(outra);
    }

    public static void main(String[] args) {

        App app = new App();
        app.desenharTela();

    }

    @Override
    public void mousePressed(double x, double y) {

        Circulo c1 = new Circulo(x, y, 10, Cores.AZUL);

        c1.desenhar(this.desenho);
        this.desenho.show();

        // TODO Auto-generated method stub

    }

    @Override
    public void mouseDragged(double x, double y) {

        Circulo c1 = new Circulo(x, y, 10, Cores.VERDE);

        c1.desenhar(this.desenho);
        this.desenho.show();
    }

    @Override
    public void mouseReleased(double x, double y) {
        // TODO Auto-generated method stub

    }

    @Override
    public void mouseClicked(double x, double y) {
        // TODO Auto-generated method stub

    }

    @Override
    public void keyTyped(char c) {
        // TODO Auto-generated method stub

    }

    @Override
    public void keyPressed(int keycode) {
        // TODO Auto-generated method stub

    }

    @Override
    public void keyReleased(int keycode) {
        // TODO Auto-generated method stub

    }
}
