package engtelecom.poo;

import edu.princeton.cs.algs4.Draw;

/**
 * Classe que representa um relógio, seus atributos, e alguns métodos de
 * tratamento de tempo;
 * 
 * @author Arthur Cadore M. Barcella.
 * 
 */

public class Relogio {

  // Atributos da classe relógio;
  private int coordenadaX;
  private int coordenadaY;
  private int fusoHorario;
  private String nomeRelogio;

  // Método construtor com 2 assinaturas.
  public Relogio(int coordenadaX, int coordenadaY) {
    this.setCoordenadaX(coordenadaX);
    this.setCoordenadaY(coordenadaY);
    this.fusoHorario = -3;
    this.nomeRelogio = "Brasília";
  }

  // Método construtor com 3 assinaturas.
  public Relogio(int coordenadaX, int coordenadaY, int fusoHorario) {
    this.setCoordenadaX(coordenadaX);
    this.setCoordenadaY(coordenadaY);
    this.setFusoHorario(fusoHorario);
    this.nomeRelogio = "Brasília";
  }

  // Método construtor com 4 assinaturas.
  public Relogio(int coordenadaX, int coordenadaY, int fusoHorario, String nomeRelogio) {
    this.setCoordenadaX(coordenadaX);
    this.setCoordenadaY(coordenadaY);
    this.setFusoHorario(fusoHorario);
    this.setNomeRelogio(nomeRelogio);
  }

  // Método set de coordenadas X.
  public boolean setCoordenadaX(int coordenadaX) {
    if (coordenadaX >= 0 && coordenadaX <= 600) {
      this.coordenadaX = coordenadaX;
      return true;
    }
    this.coordenadaX = 300;
    return false;

  }

  // Método set de coordenadas Y.
  public boolean setCoordenadaY(int coordenadaY) {
    if (coordenadaY >= 0 && coordenadaY <= 600) {
      this.coordenadaY = coordenadaY;
      return true;
    }
    this.coordenadaY = 300;
    return false;

  }

  // Método set do fuso horário.
  public boolean setFusoHorario(int fusoHorario) {
    if (fusoHorario >= -12 && fusoHorario <= 12) {
      this.fusoHorario = fusoHorario;
      return true;
    }
    this.fusoHorario = 0;
    return false;

  }

  // Método set do nome do relógio
  public void setNomeRelogio(String nomeRelogio) {
    this.nomeRelogio = nomeRelogio;
  }

  // retorna as coordenadasX
  public int getCoordenadaX() {
    return this.coordenadaX;
  }

  // retorna as coordenadasY
  public int getCoordenadaY() {
    return this.coordenadaY;
  }

  // retorna o fuso horário.
  public int getFusoHorario() {
    return this.fusoHorario;
  }

  // retorna o nome do relógio.
  public String getNomeRelogio() {
    return this.nomeRelogio;
  }

  // função para desenhar cada relógio (individualmente)
  public void desenharRelogio(Draw desenho, int hora, int minuto, int segundo) {

    // verifica se os valores de hora, minuto e segundo estão dentro do aceitavel.
    if ((hora > 24 || hora < 0) || (minuto > 59 || minuto < 0) || (segundo > 59
        ||
        segundo < 0)) {

      hora = 0;
      minuto = 0;
      segundo = 0;
    }

    // imprime o corpo do relógio
    desenho.setPenColor(desenho.LIGHT_GRAY);
    desenho.filledCircle(this.coordenadaX, this.coordenadaY, 120);

    // altera a cor da escrita para preto
    desenho.setPenColor(desenho.BLACK);

    // Imprime o nome do relógio
    desenho.text(this.coordenadaX, (this.coordenadaY + 140), this.nomeRelogio);

    // define o tamanho dos ponteiros
    double r2 = 50;
    double r3 = 45;
    double r4 = 105;
    double r5 = 117;

    // altera a espessura da escrita.
    desenho.setPenRadius(0.01);

    // imprime as marcações de hora (marcações lateriais do relógio)
    for (int i = 0; i < 12; i++) {
      double theta = Math.toRadians(30 * i);
      desenho.line(this.coordenadaX + r5 * Math.sin(theta), this.coordenadaY + r5 * Math.cos(theta),
          this.coordenadaX + r4 * Math.sin(theta),
          this.coordenadaY + r4 * Math.cos(theta));
    }

    // convertendo para variavel double para impressão.
    // para o deslocamento do ponteiro com ângulo
    double pHora = Math.toRadians(30 * (hora + this.fusoHorario));
    double pMinuto = Math.toRadians(6 * minuto);
    double pSegundo = Math.toRadians(6 * segundo);

    // imprimindo o ponteiro da hora.
    desenho.line(this.coordenadaX, this.coordenadaY, this.coordenadaX + r3 * Math.sin(pHora),
        this.coordenadaY + r3 * Math.cos(pHora));

    // imprimindo o ponteior do minuto
    desenho.line(this.coordenadaX, this.coordenadaY, this.coordenadaX + r3 * 2 * Math.sin(pMinuto),
        this.coordenadaY + r3 * 2 * Math.cos(pMinuto));

    // trocando a cor do ponteiro para vermelho.
    desenho.setPenColor(desenho.BLUE);

    // troca a espessura do ponteiro.
    desenho.setPenRadius(0.005);

    // imprimindo o ponteior do segundo
    desenho.line(this.coordenadaX, this.coordenadaY, this.coordenadaX + r2 * 2 * Math.sin(pSegundo),
        this.coordenadaY + r2 * 2 * Math.cos(pSegundo));

  }

}
