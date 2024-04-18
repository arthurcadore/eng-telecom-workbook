package engtelecom.poo.produtos;

import java.util.Arrays;

public class Telefone {

  protected int coding;
  protected String sNnumber;
  protected String model;
  protected String color;
  protected Double weight;
  protected Double[] dimensions;

  public Telefone(int coding, String sNnumber, String model, String color, Double weight, Double[] dimensions) {
    this.coding = coding;
    this.sNnumber = sNnumber;
    this.model = model;
    this.color = color;
    this.weight = weight;
    this.dimensions = dimensions;
  }

  @Override
  public String toString() {
    return "Telefone [coding=" + coding + ", sNnumber=" + sNnumber + ", model=" + model + ", color=" + color
        + ", weight=" + weight + ", dimensions=" + Arrays.toString(dimensions) + "]";
  }

  public String tocar() {

    return "trim trim";
  }

}
