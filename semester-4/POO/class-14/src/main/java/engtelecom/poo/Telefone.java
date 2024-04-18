package engtelecom.poo;

import java.text.ParseException;
import java.util.HashMap;


import javax.swing.text.MaskFormatter;

public class Telefone {

  private HashMap<String, String> dados;

  private String formatNumber(String numero) {
    String mascara = "+##(##) ####-####";

    try {
      MaskFormatter mask = new MaskFormatter(mascara);
      mask.setValueContainsLiteralCharacters(false);
      mask.setPlaceholderCharacter('_');
      return mask.valueToString(numero);

    } catch (ParseException e) {
      return "";
    }
  }

  public Telefone() {
    HashMap<String, String> dados = new HashMap<>();
  }

  public boolean add(String r, String n) {

    try {
      Double.parseDouble(n);
    } catch (NumberFormatException e) {
      return false;
    }

    if ((r.length() > 0 && n.length() == 10)) {
    this.dados.put(r, n);
    return true;
  }
  return false;
}

  public boolean remove(String r) {

    if (this.dados.get(r) != null) {
      this.dados.remove(r);
      return true;
    }
    return false;
  }

  public boolean update(String r, String n) {

    if (this.dados.get(r) != null) {
      this.dados.put(r, n);
      return true;
    }
    return false;
  }

  @Override
  public String toString() {

    StringBuilder sb = new StringBuilder();

    this.dados.forEach((r, n) -> {
      sb.append(r + ": " + formatNumber(n) + "\n");
    });

    return sb.toString();
  }
}
