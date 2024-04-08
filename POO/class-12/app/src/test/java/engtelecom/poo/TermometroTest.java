package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class TermometroTest {

  @Test
  public void testarTemperaturasKelvin() {

    // tenho Kelvin, para celsius:
    Termometro t1 = new Termometro(10, 20, 'K');
    t1.setTemperaturaAtual(10);
    double tempfinal1 = (t1.getTemperaturaAtual() - (273.15));
    assertEquals(tempfinal1, t1.obterTemperatura('C'));

    // tenho Kelvin, para kelvin:
    Termometro t2 = new Termometro(100, 200, 'K');
    t2.setTemperaturaAtual(10);
    assertEquals(t2.getTemperaturaAtual(), t2.obterTemperatura('K'));

    // tenho Kelvin, para Fahrenheit:
    Termometro t3 = new Termometro(10, 20, 'K');
    t3.setTemperaturaAtual(10);

    double tempfinal3 = ((1.8 * (t3.getTemperaturaAtual() - 273.15)) + 32);
    assertEquals(tempfinal3, t3.obterTemperatura('F'));
  }

  @Test
  public void testarTemperaturasCelsius() {

    // tenho celsius, para kelvin:
    Termometro t1 = new Termometro(10, 20, 'C');
    t1.setTemperaturaAtual(10);
    double tempfinal1 = (t1.getTemperaturaAtual() + (273.15));
    assertEquals(tempfinal1, t1.obterTemperatura('K'));

    // tenho celsius, para celsius:
    Termometro t2 = new Termometro(100, 200, 'C');
    t2.setTemperaturaAtual(10);
    assertEquals(t2.getTemperaturaAtual(), t2.obterTemperatura('C'));

    // tenho celsius, para Fahrenheit:
    Termometro t3 = new Termometro(10, 20, 'C');
    t3.setTemperaturaAtual(10);
    double tempfinal3 = ((1.8 * (t3.getTemperaturaAtual())) + 32);
    assertEquals(tempfinal3, t3.obterTemperatura('F'));
  }

  @Test
  public void testarTemperaturasFahrenheit() {

    // tenho Fahrenheit, para kelvin:
    Termometro t1 = new Termometro(10, 20, 'F');
    t1.setTemperaturaAtual(10);
    double tempfinal1 = ((double) (5 / 9) * (t1.getTemperaturaAtual() + 459.67));
    assertEquals(tempfinal1, t1.obterTemperatura('K'));

    // tenho Fahrenheit, para Fahrenheit:
    Termometro t2 = new Termometro(100, 200, 'F');
    t2.setTemperaturaAtual(10);
    assertEquals(t2.getTemperaturaAtual(), t2.obterTemperatura('F'));

    // tenho Fahrenheit, para Celsius:
    Termometro t3 = new Termometro(10, 20, 'F');
    t3.setTemperaturaAtual(10);
    double tempfinal3 = (1.8 * (t3.getTemperaturaAtual() - 32));
    assertEquals(tempfinal3, t3.obterTemperatura('C'));
  }

  @Test
  public void testarDiferenca() {

    // de Kelvin para Fahrenheit:
    Termometro t1 = new Termometro(10, 20, 'K');
    Termometro t2 = new Termometro(15, 30, 'F');
    t1.setTemperaturaAtual(123);
    t2.setTemperaturaAtual(321);

    double tempConvertida = t1.obterTemperatura('F');
    assertEquals((tempConvertida - t2.getTemperaturaAtual()), t1.diferencaTemp(t2, 'F'));

    // De Fahrenheit para Celsius:
    Termometro t3 = new Termometro(10, 20, 'F');
    Termometro t4 = new Termometro(15, 30, 'C');
    t3.setTemperaturaAtual(123);
    t4.setTemperaturaAtual(321);

    double tempConvertida2 = t3.obterTemperatura('C');
    assertEquals((tempConvertida2 - t4.getTemperaturaAtual()), t3.diferencaTemp(t4, 'C'));

    // De Celsius para Kelvin:
    Termometro t5 = new Termometro(10, 20, 'C');
    Termometro t6 = new Termometro(15, 30, 'K');
    t5.setTemperaturaAtual(123);
    t6.setTemperaturaAtual(321);

    double tempConvertida3 = t5.obterTemperatura('K');
    assertEquals((tempConvertida3 - t6.getTemperaturaAtual()), t5.diferencaTemp(t6, 'K'));

  }

}
