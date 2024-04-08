package engtelecom.poo;

public class Carro {

  private double velocidade;

  // private double velocidadeMaxima = 100;

  private String modelo;

  public Carro(double velocidade, String modelo) {
    this.modelo = modelo;
    this.velocidade = velocidade;

  }

  // public Carro() {
  // this.modelo = "fusca";
  // this.velocidade = 10;

  // }

  public double getVelocidade() {
    return velocidade;
  }

  public void setVelocidade(double velocidade) {
    this.velocidade = velocidade;
  }

  public String getModelo() {
    return modelo;
  }

  public void setModelo(String modelo) {
    this.modelo = modelo;
  }

  public String toString() {

    return "Carro " + this.modelo + ", velocidade: " + this.velocidade;
  }

  // public void acelerar(double intensidade) {

  // if (intensidade > 0) {
  // double velocidadeAtual = this.velocidade + intensidade;

  // if (velocidadeAtual > velocidadeMaxima) {
  // this.velocidade = velocidadeMaxima;
  // } else {
  // this.velocidade = velocidadeAtual;
  // }
  // }

  // }

  // public String obterModelo() {

  // return this.modelo;

  // }

  // public double obterVelocidade() {

  // return this.velocidade;
  // }
}
