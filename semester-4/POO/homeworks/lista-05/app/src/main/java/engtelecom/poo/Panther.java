package engtelecom.poo;

public class Panther extends Veiculo implements VeiculoAnfibio, TracaoIntegral, Conversivel {

  private static final int SPEED_LIMIT = 140;

  private boolean capota;
  private boolean tracaoIntegral;
  private boolean rodasAbertas;
  private boolean lastroVazio;

  public Panther(String nome) {

    this.nome = nome;
    this.velocidadeAtual = 0;
    this.tracaoIntegral = false;
    this.rodasAbertas = true;
    this.lastroVazio = false;
    this.andando = false;
  }

  @Override
  public boolean abrirCapota() {

    if (this.andando == true) {

      return false;
    }

    this.capota = true;

    return true;
  }

  @Override
  public boolean fecharCapota() {

    if (this.andando == true) {

      return false;
    }

    this.capota = false;

    return true;
  }

  @Override
  public void acelerar(int i) {

    if (i > 0) {

      this.velocidadeAtual = this.velocidadeAtual + i;
      this.lastroVazio = false;

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
  public void esvaziarLastro() {

    // esvazia o lastro do carro
    if (this.andando == false) {
      this.lastroVazio = true;
    }
  }

  @Override
  public boolean ativarDesativarTracao() {

    // verifica se as rodas estão abertas e o carro está em movimento
    if (this.andando == true || this.rodasAbertas == false) {

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

  @Override
  public boolean recolherRodas() {

    // verifica se o lastro está vazio e o carro está em movimento
    if (this.lastroVazio == false || this.andando == true) {
      return false;

    }

    // recolhe as rodas
    this.rodasAbertas = false;

    return true;
  }

  @Override
  public boolean abrirRodas() {

    // enche o lastro do carro
    this.lastroVazio = false;

    // abre as rodas
    this.rodasAbertas = true;

    return true;
  }

  public boolean isTracaoIntegral() {
    return tracaoIntegral;
  }

  public boolean isRodasAbertas() {
    return rodasAbertas;
  }

  public boolean isLastroVazio() {
    return lastroVazio;
  }

  public boolean isCapota() {
    return capota;
  }

}
