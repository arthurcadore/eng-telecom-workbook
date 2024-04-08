package engtelecom.poo;

public class Contador {

  private double valorAtual;

  public Contador(double inicial) {

    this.valorAtual = inicial;

  }

  public void addValue() {
    this.valorAtual++;
  }

  public String toString() {

    return "Valdor do contador: " + valorAtual;
  }

}
