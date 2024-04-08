package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class PantherTest {

  @Test
  public void acelerarTest() {

    Panther p = new Panther("teste");

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

    Panther p = new Panther("teste");

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
  public void abrirCapotaTest() {

    Panther p = new Panther("teste");

    // tenta abrir a capota com o carro parado
    assertTrue(p.abrirCapota());

    // tenta abrir a capota com o carro andando
    p.acelerar(10);
    assertFalse(p.abrirCapota());

    // tenta abrir a capota após parar o carro;
    p.frear(10);
    assertTrue(p.abrirCapota());
  }

  @Test
  public void fecharCapotaTest() {

    Panther p = new Panther("teste");

    // tenta fechar a capota com o carro parado
    assertTrue(p.fecharCapota());

    // tenta fechar a capota com o carro andando
    p.acelerar(10);
    assertFalse(p.fecharCapota());

    // tenta fechar a capota após parar o carro;
    p.frear(10);
    assertTrue(p.fecharCapota());
  }

  @Test
  public void esvaziarLastroTest() {

    Panther p = new Panther("teste");

    // tenta esvaziar o lastro com o carro parado
    p.esvaziarLastro();
    assertTrue(p.isLastroVazio());

    // tenta esvaziar o lastro com ele andando
    p.acelerar(10);
    p.esvaziarLastro();
    assertFalse(p.isLastroVazio());

    // tenta esvaziar o lastro após parar o carro;
    p.frear(10);
    p.esvaziarLastro();
    assertTrue(p.isLastroVazio());
  }

  @Test
  public void abrirRodasTest() {

    Panther p = new Panther("teste");

    // testa se conesegue abrir as rodas corretamente;

    p.abrirRodas();
    assertTrue(p.isRodasAbertas());
    assertFalse(p.isLastroVazio());

  }

  @Test
  public void recolherRodasTest() {

    Panther p = new Panther("teste");

    p.acelerar(10);

    // tenta recolher as rodas com o carro andando e lastro cheio
    assertFalse(p.recolherRodas());

    // tenta recolher as rodas com o carro parado e lastro cheio
    p.frear(10);
    assertFalse(p.recolherRodas());

    // tenta corretamente recolher as rodas;
    p.esvaziarLastro();
    assertTrue(p.recolherRodas());

  }

  @Test
  public void tracaoIntegralTest() {

    Panther p = new Panther("teste");

    p.acelerar(10);

    // tenta ativar a tração com o carro andando e rodas abertas
    assertFalse(p.ativarDesativarTracao());

    // tenta ativar a tração com o carro parado e rodas abertas
    p.frear(10);
    assertTrue(p.abrirRodas());
    assertFalse(p.isAndando());
    assertTrue(p.ativarDesativarTracao());

    // tenta ativar a tração com as rodas fechadas;
    p.esvaziarLastro();
    p.recolherRodas();
    assertFalse(p.ativarDesativarTracao());

  }

}
