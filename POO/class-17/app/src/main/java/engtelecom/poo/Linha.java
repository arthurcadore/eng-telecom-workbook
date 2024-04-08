package engtelecom.poo;

public class Linha extends FormaGeometrica {

  private double[] fim;

  public Linha(double[] inicial, String cor, double[] fim) {
    super(inicial, cor);
    this.fim = fim;
  }

  @Override
  public void desenhar() {

    System.out.println("desenhando linha");
  }
}
