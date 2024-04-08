package engtelecom.poo;

public class Retangulo extends Bidimensional {

  private double dimensao;

  public Retangulo(double[] inicial, String cor, String corFundo, double dimensao) {
    super(inicial, cor, corFundo);
    this.dimensao = dimensao;
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
