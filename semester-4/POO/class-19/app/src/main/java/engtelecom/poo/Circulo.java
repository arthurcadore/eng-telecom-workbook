package engtelecom.poo;

import edu.princeton.cs.algs4.Draw;

public class Circulo {

  public static final int VERDE = 0;
  public static final int AZUL = 1;
  public static final int AMARELO = 2;
  public static final int VERMELHO = 3;

  private double x;
  private double y;
  private double r;
  private Cores cores;

  public Circulo(double x, double y, double r, Cores cores) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.cores = cores;

  }

  public void desenhar(Draw d) {

    d.setPenColor(cores.cor);
    d.filledCircle(this.x, this.y, this.r);
  }

  public double getX() {
    return x;
  }

  public void setX(double x) {
    this.x = x;
  }

  public double getY() {
    return y;
  }

  public void setY(double y) {
    this.y = y;
  }

  public double getR() {
    return r;
  }

  public void setR(double r) {
    this.r = r;
  }

}
