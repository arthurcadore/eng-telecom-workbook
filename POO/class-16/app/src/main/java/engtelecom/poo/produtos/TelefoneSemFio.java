package engtelecom.poo.produtos;

import java.util.Arrays;

public class TelefoneSemFio extends Telefone {

  public TelefoneSemFio(int coding, String sNnumber, String model, String color, Double weight, Double[] dimensions,
      double frequency, int channels, double distOperation) {
    super(coding, sNnumber, model, color, weight, dimensions);
    this.frequency = frequency;
    this.channels = channels;
    this.distOperation = distOperation;
  }

  protected double frequency;
  protected int channels;
  protected double distOperation;

  @Override
  public String toString() {
    return "Telefone [coding=" + coding + ", sNnumber=" + sNnumber + ", model=" + model + ", color=" + color
        + ", weight=" + weight + ", dimensions=" + Arrays.toString(dimensions) + " frequency="
        + frequency + ", channels=" + channels + ", distOperation=" + distOperation
        + "]";
  }

  public void setChannels(int channels) {
    this.channels = channels;
  }

}
