package engtelecom.poo;

public class Elipse extends Bidimensional {

  private double menor;
  private double maior;
  private double foco;

  public Elipse(double[] inicial, String cor, String corFundo, double menor, double maior, double foco) {
    super(inicial, cor, corFundo);
    this.menor = menor;
    this.maior = maior;
    this.foco = foco;
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
