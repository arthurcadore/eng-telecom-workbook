package engtelecom.poo;

public class Pampa extends Veiculo implements TracaoIntegral {

  private static final int SPEED_LIMIT = 140;

  private boolean cacamba;
  private boolean tracaoIntegral;

  public Pampa(String nome) {

    this.nome = nome;
    this.cacamba = false;
    this.tracaoIntegral = false;
    this.velocidadeAtual = 0;
    this.andando = false;
  }

  public boolean abrirCacamba() {

    if (this.andando == true) {

      return false;
    }

    // Altera o estado da cacamba do carro;
    if (cacamba) {
      this.cacamba = false;
    } else {
      this.cacamba = true;
    }

    return true;
  }

  @Override
  public void acelerar(int i) {

    if (i > 0) {

      this.velocidadeAtual = this.velocidadeAtual + i;
    }

    if (velocidadeAtual > SPEED_LIMIT) {

      this.velocidadeAtual = SPEED_LIMIT;
    }

    if (this.velocidadeAtual != 0) {

      this.andando = true;
    }

  }

  @Override
  public void frear(int i) {

    if (i > 0) {

      this.velocidadeAtual = this.velocidadeAtual - i;
    }

    if (velocidadeAtual < 0) {

      this.velocidadeAtual = 0;
    }

    if (this.velocidadeAtual == 0) {

      this.andando = false;
    }

  }

  @Override
  public boolean ativarDesativarTracao() {

    if (this.andando == true) {

      return false;
    }

    // Altera o estado da tracaoIntegral do carro;
    if (tracaoIntegral) {
      this.tracaoIntegral = false;
    } else {
      this.tracaoIntegral = true;
    }

    return true;
  }

  public boolean isCacamba() {
    return cacamba;
  }

  public boolean isTracaoIntegral() {
    return tracaoIntegral;
  }

}
