package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class PampaTest {

  @Test
  public void acelerarTest() {

    Pampa p = new Pampa("teste");

    // tenta acelerar abaixo de 0;
    p.acelerar(-10);
    assertEquals(0, p.getVelocidadeAtual());

    // tenta acelerar um valor correto qualquer;
    p.acelerar(100);
    assertEquals(100, p.getVelocidadeAtual());

    // tenta acelerar acima do permitido;
    p.acelerar(300);
    assertEquals(140, p.getVelocidadeAtual());

  }

  @Test
  public void frearTest() {

    Pampa p = new Pampa("teste");

    // tenta frear um valor correto qualquer;
    p.acelerar(100);
    p.frear(40);
    assertEquals(60, p.getVelocidadeAtual());

    // tenta frear abaixo de 0;
    p.acelerar(200);
    p.frear(1000);

    assertEquals(0, p.getVelocidadeAtual());
  }

  @Test
  public void abrirCacambaTest() {

    Pampa p = new Pampa("teste");

    // tenta abrir a caçamba com o carro parado
    assertTrue(p.abrirCacamba());

    // tenta abrir a caçamba com o carro andando
    p.acelerar(10);
    assertFalse(p.abrirCacamba());

    // tenta abrir a caçamba após parar o carro;
    p.frear(10);
    assertTrue(p.abrirCacamba());
  }

  @Test
  public void ativarDesativarTracaoTest() {

    Pampa p = new Pampa("teste");

    // tenta ativar a tração do carro com ele parado
    assertTrue(p.ativarDesativarTracao());

    // tenta ativar a tração do carro com ele andando
    p.acelerar(10);
    assertFalse(p.ativarDesativarTracao());

    // tenta ativar a tração do carro após para-lo
    p.frear(10);
    assertTrue(p.ativarDesativarTracao());
  }

}
