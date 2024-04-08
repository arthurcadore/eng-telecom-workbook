package engtelecom.poo;

public abstract class Bidimensional extends FormaGeometrica {

  private String corFundo;

  public Bidimensional(double[] inicial, String cor, String corFundo) {
    super(inicial, cor);
    this.corFundo = corFundo;
  }

  public abstract void getArea();

  public abstract void getPerimetro();

}
