package engtelecom.poo;

public abstract class FormaGeometrica {

  private double[] inicial;
  private String cor;

  public FormaGeometrica(double[] inicial, String cor) {
    this.inicial = inicial;
    this.cor = cor;
  }

  public abstract void desenhar();

  public double[] getInicial() {
    return inicial;
  }

  public void setInicial(double[] inicial) {
    this.inicial = inicial;
  }

  public String getCor() {
    return cor;
  }

  public void setCor(String cor) {
    this.cor = cor;
  }

}
