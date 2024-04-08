package engtelecom.poo;

public class Motor {

  private int kilometragem;
  private int torque;
  private int rmp;

  private final int RMP_MAX;

  public Motor(int max_rmp) {
    this.kilometragem = 0;
    this.torque = 0;
    this.rmp = 0;
    this.RMP_MAX = max_rmp;
  }

  public int aumentarRPM(int intensidade) {

    return 1;
  }

}
