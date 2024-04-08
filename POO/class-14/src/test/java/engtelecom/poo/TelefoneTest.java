package engtelecom.poo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

public class TelefoneTest {

  @Test
  public void addTest() {

    Telefone tele1 = new Telefone();

    assertTrue(tele1.add("testeRotulo", "4823192319"));
    assertFalse(tele1.add("testeRotulo", "4923192319"));
    assertFalse(tele1.add("testeRotulo1", ""));
    assertFalse(tele1.add("testeRotulo1", "123554823192319"));
    assertFalse(tele1.add("", "4823192319"));

  }

  @Test
  public void removeTest() {

    Telefone tele1 = new Telefone();

    tele1.add("testeRotulo", "4823192319");
    assertTrue(tele1.remove("testeRotulo"));

    tele1.add("testeRotulo", "4823192319");
    assertFalse(tele1.remove(""));
    assertFalse(tele1.remove("testeRotulo1"));
    assertTrue(tele1.remove("testeRotulo"));
    assertFalse(tele1.remove("testeRotulo"));
  }

  @Test
  public void updateTest() {

    Telefone tele1 = new Telefone();

    tele1.add("testeRotulo", "4823192319");

    assertTrue(tele1.update("testeRotulo", "4823192320"));
    assertFalse(tele1.update("testeRotulo", "123554823192319"));
    assertFalse(tele1.update("", "554823192320"));
    assertFalse(tele1.update("testeRotulo", ""));
    assertFalse(tele1.update("testeRotulo", "4823192320"));
    assertFalse(tele1.update("testeRotulo", ""));

  }

  @Test
  public void toStringTest() {

    Telefone tele1 = new Telefone();

    tele1.add("testeRotulo", "4823192320");
    tele1.add("testeRotulo1", "4823192319");

    assertEquals("testeRotulo: 4823192320\n testeRotulo1: 4823192319", tele1.toString());

  }

}
