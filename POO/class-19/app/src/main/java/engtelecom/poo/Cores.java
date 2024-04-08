package engtelecom.poo;

import java.awt.Color;

public enum Cores {

  PRETO(Color.BLACK), VERDE(Color.GREEN), AZUL(Color.BLUE);

  public final Color cor;

  Cores(Color novaCor) {

    this.cor = novaCor;
  }

}
