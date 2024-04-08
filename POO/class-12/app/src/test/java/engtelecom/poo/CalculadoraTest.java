package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class CalculadoraTest {

  @Test
  public void testarSoma() {

    Calculadora c = new Calculadora();
    assertEquals(2, c.somar(1, 1));
    assertEquals(3, c.somar(2, 1));
    assertEquals(4, c.somar(2, 2));
    assertEquals(1, c.somar(0, 1));
    assertEquals(0, c.somar(0, 0));

  }

  @Test
  public void testatSubtracao() {

    Calculadora c = new Calculadora();
    assertEquals(-2, c.somar(-1, -1));
    assertEquals(-4, c.somar(-2, -2));
    assertEquals(-4, c.somar(-3, -1));
    assertEquals(-2, c.somar(0, -2));
  }
}
