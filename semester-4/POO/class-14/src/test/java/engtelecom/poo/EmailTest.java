package engtelecom.poo;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import org.junit.Test;

public class EmailTest {

  @Test
  public void addTest() {

    Email email1 = new Email();

    assertTrue(email1.add("testeRotulo", "testeEmail@email.com"));
    assertFalse(email1.add("testeRotulo", "testeEmail@email.com"));
    assertFalse(email1.add("", "testeEmail@email.com"));
    assertFalse(email1.add("testeRotulo1", ""));
    assertFalse(email1.add("testeRotulo1", "teste"));
    assertFalse(email1.add("testeRotulo1", "testeEmail@"));
    assertFalse(email1.add("testeRotulo1", "@.com"));

  }

  @Test
  public void removeTest() {

    Email email1 = new Email();

    email1.add("testeRotulo", "testeEmail@email.com");
    assertTrue(email1.remove("testeRotulo"));

    email1.add("testeRotulo", "testeEmail@email.com");
    assertFalse(email1.remove(""));
    assertFalse(email1.remove("testeRotulo1"));
    assertTrue(email1.remove("testeRotulo"));
    assertFalse(email1.remove("testeRotulo"));
  }

  @Test
  public void updateTest() {

    Email email1 = new Email();

    email1.add("testeRotulo", "testeEmail@email.com");

    assertTrue(email1.update("testeRotulo", "testeEmail1@email.com"));
    assertFalse(email1.update("testeRotulo", "testeEmail@email.com"));
    assertFalse(email1.update("", "testeEmail@email.com"));
    assertFalse(email1.update("testeRotulo", ""));
    assertFalse(email1.update("testeRotulo", "@email.com"));
    assertFalse(email1.update("testeRotulo", "testeEmail@"));
    assertFalse(email1.update("testeRotulo1", "testeEmail@"));

  }

  @Test
  public void toStringTest() {

    Email email1 = new Email();

    email1.add("testeRotulo", "testeEmail@email.com");
    email1.add("testeRotulo1", "testeEmail@email.com1");

    assertEquals("testeRotulo: testeEmail@email.com\n testeRotulo1: testeEmail@email.com", email1.toString());

  }

}
