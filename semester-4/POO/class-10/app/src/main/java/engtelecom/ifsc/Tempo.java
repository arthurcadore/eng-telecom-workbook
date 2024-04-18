package engtelecom.ifsc;

/**
 * Classe para representar um relógio, com tempo definido em horas, minutos e
 * segundos;
 * 
 * @author Arthur Cadore M. Barcella.
 * 
 */

public class Tempo {

  private int hora;
  private int minuto;
  private int segundo;

  /**
   * Cria um relógio com o valor de hora, minuto e segundo zerados;
   * 
   */

  public Tempo() {
    this(0, 0, 0);
  }

  /**
   * Cria um relógio com o valor de hora definivel, e minuto e segundo zerados;
   * 
   * @param hora Valor de hora a ser armazenado no relógio (permitidos os valores
   *             entre 0 e 23), caso o valor não seja permitido, será definido
   *             como zero;
   */
  public Tempo(int hora) {
    this(hora, 0, 0);
  }

  /**
   * Cria um relógio com o valor de hora, minuto definivel, e segundo zerados;
   * 
   * @param hora   Valor de hora a ser armazenado no relógio (permitidos os
   *               valores entre 0 e 23), caso o valor não seja permitido, será
   *               definido como zero;
   * 
   * @param minuto
   */

  public Tempo(int hora, int minuto) {
    this(hora, minuto, 0);
  }

  public Tempo(int hora, int minuto, int segundo) {
    setHora(hora);
    setMinuto(minuto);
    setSegundo(segundo);
  }

  public String toString() {
    return String.format("%02d:%02d:%02d", this.hora, this.minuto, this.segundo);
  }

  public boolean setHora(int novaHora) {
    if (novaHora <= 23 && novaHora >= 0) {
      this.hora = novaHora;
      return true;
    }
    this.hora = 0;
    return false;
  }

  public boolean setMinuto(int novoMinuto) {
    if (novoMinuto <= 59 && novoMinuto >= 0) {
      this.hora = novoMinuto;
      return true;
    }
    this.minuto = 0;
    return false;
  }

  public boolean setSegundo(int novoSegundo) {
    if (novoSegundo <= 59 && novoSegundo >= 0) {
      this.hora = novoSegundo;
      return true;
    }
    this.segundo = 0;
    return false;
  }

  public long conversorSegundos() {
    long tempoConvertido = (((this.hora * 3600) + (this.minuto * 60)) + this.segundo);
    return tempoConvertido;
  }

  public long subtratorTempo(Tempo novotempo) {
    return (novotempo.conversorSegundos() - this.conversorSegundos());
  }

}
