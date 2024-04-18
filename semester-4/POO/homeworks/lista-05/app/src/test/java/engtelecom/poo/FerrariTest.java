package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class FerrariTest {

  @Test
  public void ligarFarolNeblinaTest() {

    Ferrari f = new Ferrari("teste");

    // tenta ligar o farol
    assertTrue(f.ligarFarolNeblina());

    // verifica se o farol ligou
    assertTrue(f.isFarol());

    // tenta desligar o farol
    assertTrue(f.ligarFarolNeblina());

    // verifica se o farol desligou
    assertFalse(f.isFarol());

  }

  @Test
  public void acelerarTest() {

    Ferrari f = new Ferrari("teste");

    // tenta acelerar abaixo de 0;
    f.acelerar(-10);
    assertEquals(0, f.getVelocidadeAtual());

    // tenta acelerar um valor correto qualquer;
    f.acelerar(100);
    assertEquals(100, f.getVelocidadeAtual());

    // tenta acelerar acima do permitido;
    f.acelerar(300);
    assertEquals(200, f.getVelocidadeAtual());

  }

  @Test
  public void frearTest() {

    Ferrari f = new Ferrari("teste");

    // tenta frear um valor correto qualquer;
    f.acelerar(100);
    f.frear(40);
    assertEquals(60, f.getVelocidadeAtual());

    // tenta frear abaixo de 0;
    f.acelerar(200);
    f.frear(1000);

    assertEquals(0, f.getVelocidadeAtual());
  }

  @Test
  public void abrirCapotaTest() {

    Ferrari f = new Ferrari("teste");

    // tenta abrir a capota abaixo de 20Km/h
    f.acelerar(19);
    assertTrue(f.abrirCapota());

    // tenta abrir a capota acima de 20Km/h
    f.acelerar(10);
    assertFalse(f.abrirCapota());

  }

  @Test
  public void fecharCapotaTest() {

    Ferrari f = new Ferrari("teste");

    // tenta abrir a capota abaixo de 20Km/h
    f.acelerar(19);
    assertTrue(f.fecharCapota());

    // tenta abrir a capota acima de 20Km/h
    f.acelerar(10);
    assertFalse(f.fecharCapota());

  }

}
