package engtelecom.ifsc;

public class Linha {

  public static final int ESPESSURA_MAX = 10;
  public static final int ESPESSURA_MIN = 0;

  // posição 0 é o X;

  private int[] coordenadaIncial;
  private int[] coordenadaFinal;

  private int cor;
  private int espessura; // valor máximo 10;

  public Linha(int[] coordenadaIncial, int[] coordenadaFinal, int cor, int espessura) {

    this.coordenadaIncial = coordenadaIncial;
    this.coordenadaFinal = coordenadaFinal;
    this.cor = cor;
    this.espessura = espessura;

  }

  public int maior(Linha outra) {

    // Não está finalizado, apenas uma demonstração de uso da sintaxe;

    if (this.coordenadaFinal[0] > outra.coordenadaFinal[0]) {

      return 0;
    }
    return -1;
  }

  public void setEspessura(int espessura) {

    if (espessura <= ESPESSURA_MAX) {
      this.espessura = espessura;
    } else if (espessura > ESPESSURA_MAX) {
      this.espessura = ESPESSURA_MIN;
    }

    if (espessura >= ESPESSURA_MIN) {
      this.espessura = espessura;
    } else if (espessura < ESPESSURA_MIN) {
      this.espessura = ESPESSURA_MIN;
    }
  }

}
