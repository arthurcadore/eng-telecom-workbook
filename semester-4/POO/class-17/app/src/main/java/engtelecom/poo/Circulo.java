package engtelecom.poo;

public class Circulo extends Bidimensional {

  private double raio;

  public Circulo(double[] inicial, String cor, String corFundo, double raio) {
    super(inicial, cor, corFundo);
    this.raio = raio;
  }

  @Override
  public void desenhar() {

    System.out.println("desenhando circulo");
  }

  @Override
  public void getArea() {

    System.out.println("retornando área");
  }

  @Override
  public void getPerimetro() {

    System.out.println("retornando perimetro");
  }

}
