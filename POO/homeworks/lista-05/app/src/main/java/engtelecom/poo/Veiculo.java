package engtelecom.poo;

public abstract class Veiculo implements VeiculoTerrestre {

  public String nome;
  public boolean andando;
  public int velocidadeAtual;

  public void acelerar(int i) {
  };

  public void frear(int i) {
  }

  public boolean isAndando() {
    return andando;
  }

  public int getVelocidadeAtual() {
    return velocidadeAtual;
  };


}
