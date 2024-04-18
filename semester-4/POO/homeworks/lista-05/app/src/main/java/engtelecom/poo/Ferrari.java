package engtelecom.poo;

public class Ferrari extends Veiculo implements Conversivel {

  private static final int SPEED_LIMIT = 200;

  private boolean farol;
  private boolean capota;

  public Ferrari(String nome) {

    this.nome = nome;
    this.farol = false;
    this.capota = false;
    this.velocidadeAtual = 0;
    this.andando = false;
  }

  public boolean ligarFarolNeblina() {

    // Altera o estado do farol do carro;
    if (farol) {
      this.farol = false;
    } else {
      this.farol = true;
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
  public boolean abrirCapota() {

    if (this.velocidadeAtual >= 20) {

      return false;
    }

    this.capota = true;

    return true;
  }

  @Override
  public boolean fecharCapota() {

    if (this.velocidadeAtual >= 20) {

      return false;
    }

    this.capota = false;

    return true;
  }

  public boolean isFarol() {
    return farol;
  }

  public boolean isCapota() {
    return capota;
  }

}
