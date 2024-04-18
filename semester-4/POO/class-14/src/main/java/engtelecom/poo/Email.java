package engtelecom.poo;

import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Email {

  private boolean verifica(String email) {

    if (email != null && email.length() > 0) {
      String expression = "^[\\w\\.-]+@([\\w\\-]+\\.)+[A-Z]{2,4}$";
      Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
      Matcher matcher = pattern.matcher(email);
      return matcher.matches();
    }
    return false;
  }

  private HashMap<String, String> dados;

  public Email() {
    HashMap<String, String> dados = new HashMap<>();
  }

  public boolean add(String r, String e) {

    if (r.length() <= 0) {
      return false;
    }

    if (verifica(e)) {
      this.dados.put(r, e);
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

  public boolean update(String r, String e) {

    if (this.dados.get(r) != null) {

      this.dados.put(r, e);
      return true;
    }

    return true;
  }

  public String toString() {

    return this.dados.toString();
  }

}
