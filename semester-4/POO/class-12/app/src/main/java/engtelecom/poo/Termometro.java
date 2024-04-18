package engtelecom.poo;

/**
 * Classe que representa um termometro, seus atributos, e alguns métodos de
 * tratamento de temperatura;
 * 
 * @author Arthur Cadore M. Barcella.
 * 
 */

public class Termometro {

  private double temperaturaAtual;
  private double temperaturaMin;
  private double temperaturaMax;
  private char escala;

  /**
   * Cria um termometro com escala padrão (Celsius), e temperatura atual igual a
   * zero;
   *
   * @param temperaturaMin Valor minimo de temperatura que o termometro poderá
   *                       receber;
   * 
   * @param temperaturaMax Valor máximo de temperatura que o termometor poderá
   *                       receber;
   * 
   */

  public Termometro(double temperaturaMin, double temperaturaMax) {
    this.temperaturaAtual = 0;
    this.temperaturaMin = temperaturaMin;
    this.temperaturaMax = temperaturaMax;
    this.escala = 'C';
  }

  /**
   * Cria um termometro com escala definivel (padrão Celsius), e temperatura atual
   * igual a zero (na escala definida);
   * 
   * As escalas permitidas são:
   * 
   * C = Celsius;
   * K = Kelvin;
   * F = Fahrenheit
   * 
   * Caso a escala passada na construção do objeto esteja incorreta, será assumido
   * o padrão (Celsius);
   * 
   * @param temperaturaMin Valor minimo de temperatura que o termometro poderá
   *                       receber;
   * 
   * @param temperaturaMax Valor máximo de temperatura que o termometor poderá
   *                       receber;
   * 
   * @param escala         Escala a ser utilizada pelo termometro (padrão
   *                       Celsius);
   */

  public Termometro(double temperaturaMin, double temperaturaMax, char escala) {
    this.temperaturaAtual = 0;
    this.temperaturaMin = temperaturaMin;
    this.temperaturaMax = temperaturaMax;

    if (escala == 'C' || escala == 'K' || escala == 'F') {
      this.escala = escala;
    } else {
      this.escala = 'C';
    }

  }

  /**
   * 
   * Altera a temperatura do termometro (na escala do termometro);
   * 
   * @param temperaturaAtual Valor de temperatura a ser inserido no termometro;
   * 
   * @return Caso o valor de temperatura seja inválido (maior que o máximo ou
   *         menor que o minimo), retornará falso;
   */

  public boolean setTemperaturaAtual(double temperaturaAtual) {
    if (temperaturaAtual >= this.temperaturaMin && temperaturaAtual <= this.temperaturaMax) {
      this.temperaturaAtual = temperaturaAtual;
      return true;
    }
    return false;
  }

  /**
   * Obtem a temperatura do termometro (na escala do termometro;);
   * 
   * @return Valor da temperatura atual do termometro;
   */

  public double getTemperaturaAtual() {
    return this.temperaturaAtual;
  }

  /**
   * Obtem a escala do termometro;
   * 
   * @return Escala sendo utilizada pelo termometro
   */

  public char getEscala() {
    return escala;
  }

  /**
   * 
   * Obtem a temperatura do termometro convertida para qualquer escala permitida;
   * 
   * As escalas permitidas são:
   * 
   * C = Celsius;
   * K = Kelvin;
   * F = Fahrenheit
   * 
   * Qualquer outro valor de escala irá retornar erro;
   * 
   * @param escala Escala em que a temperatura será convertida;
   *
   * @return Valor de temperatura do termometro na escala passada;
   */

  public double obterTemperatura(char escala) {
    if (escala == 'C') {
      if (this.escala == 'C') {
        return this.temperaturaAtual;

      } else if (this.escala == 'K') {
        return (this.temperaturaAtual - 273.15);

      } else {
        return (1.8 * (this.temperaturaAtual - 32));
      }

    } else if (escala == 'K') {
      if (this.escala == 'C') {
        return (this.temperaturaAtual + 273.15);

      } else if (this.escala == 'K') {
        return this.temperaturaAtual;

      } else {
        return (((double) (5 / 9)) * (this.temperaturaAtual + 459.67));
      }

    } else if (escala == 'F') {
      if (this.escala == 'C') {
        return ((1.8 * (this.temperaturaAtual)) + 32);

      } else if (this.escala == 'K') {
        return ((1.8 * (this.temperaturaAtual - 273.15)) + 32);

      } else {
        return this.temperaturaAtual;
      }

    } else {
      // deverá retornar erro;
      return -1000000;
    }
  }

  /**
   * Compara o valor de temperatura entre termometros;
   * 
   * As escalas permitidas para comparação são:
   * 
   * C = Celsius;
   * K = Kelvin;
   * F = Fahrenheit
   * 
   * Qualquer outro valor de escala irá retornar erro;
   * 
   * @param outroTermometro Outro termometro que será utilizado para a comparação
   *                        dos valores de temperatura;
   * 
   * @param escala          Escala a ser utilizada para comparação entre
   *                        temometros, a temperatura dos dois temometros serão
   *                        convertidas para essa escala;
   * 
   * @return Retorna a temperatura na escala definida;
   */

  public double diferencaTemp(Termometro outroTermometro, char escala) {
    double atualTemperatura = this.obterTemperatura(escala);
    double outraTemperatura = outroTermometro.obterTemperatura(escala);
    return atualTemperatura - outraTemperatura;
  }
}
