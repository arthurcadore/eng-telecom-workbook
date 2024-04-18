package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class RealMachineTest {

  @Test
  public void realMachineTest() {

    RealMachine machine = new RealMachine("Teste0", 100, 200);

    // verifica se os valores dos parâmetros estão corretos.
    assertEquals(100, machine.getMachineMemory());
    assertEquals(200, machine.getMachineHD());
    assertEquals("Teste0", machine.getMachineName());
    assertEquals(0, machine.getVirtualMachineCount());

  }

  @Test
  public void addVirtualMachineTest() {

    RealMachine machine = new RealMachine("Teste0", 1000, 1000);

    // verifica a adição correta de uma máquina virtual
    assertTrue(machine.addVirtualMachine("Virtual1", 100, 100));

    // verifica se os parâmetro da máquina foram alterados.
    assertEquals(900, machine.getMachineHD());
    assertEquals(900, machine.getMachineMemory());
    assertEquals(1, machine.getVirtualMachineCount());

    // testa duplicidade de nomes
    assertFalse(machine.addVirtualMachine("Virtual1", 100, 100));

    // testa limite de HD/Memória
    assertFalse(machine.addVirtualMachine("Virtual2", 1000, 100));
    assertFalse(machine.addVirtualMachine("Virtual3", 100, 1000));

    // testa parâmetros faltantes
    assertFalse(machine.addVirtualMachine("", 100, 100));
    assertFalse(machine.addVirtualMachine("Virtual4", 0, 100));
    assertFalse(machine.addVirtualMachine("Virtual5", 100, 0));

    // testa limite de máquinas virtuais
    assertTrue(machine.addVirtualMachine("Virtual6", 100, 100));
    assertTrue(machine.addVirtualMachine("Virtual7", 100, 100));
    assertTrue(machine.addVirtualMachine("Virtual8", 100, 100));
    assertTrue(machine.addVirtualMachine("Virtual9", 100, 100));
    assertFalse(machine.addVirtualMachine("Virtual10", 100, 100));

  }

  @Test
  public void removeVirtualMachineTest() {

    RealMachine machine = new RealMachine("Teste0", 1000, 1000);

    // testa a remoção com a tabela vazia
    assertFalse(machine.removeVirtualMachine("Virtual1"));

    machine.addVirtualMachine("Virtual1", 100, 100);

    // testa a remoção de uma máquina sem nome
    assertFalse(machine.removeVirtualMachine(""));

    // testa a remoção de uma máquina que não existe
    assertFalse(machine.removeVirtualMachine("Virtual2"));

    // testa a remoção de uma máquina que existe
    assertTrue(machine.removeVirtualMachine("Virtual1"));

  }

  @Test
  public void turnOnVirtualMachineTest() {

    RealMachine machine = new RealMachine("Teste0", 1000, 1000);
    machine.addVirtualMachine("Virtual1", 100, 100);

    // verifica se a maquina "Virtual 1" está desligada
    assertFalse(machine.getVirtualMachineState("Virtual1"));

    // verifica se a máquina "Virtual 1" foi ligada
    assertTrue(machine.turnOnVirtualMachine("Virtual1"));
    assertTrue(machine.getVirtualMachineState("Virtual1"));

    // testa ligar a máquina que está ligada
    assertFalse(machine.turnOnVirtualMachine("Virtual1"));
    assertTrue(machine.getVirtualMachineState("Virtual1"));

  }

  @Test
  public void turnOffVirtualMachineTest() {

    RealMachine machine = new RealMachine("Teste0", 1000, 1000);
    machine.addVirtualMachine("Virtual1", 100, 100);

    // verifica se a maquina "Virtual 1" está desligada
    assertFalse(machine.getVirtualMachineState("Virtual1"));

    machine.turnOnVirtualMachine("Virtual1");

    // verifica se a máquina "Virtual 1" foi desligada
    assertTrue(machine.turnOffVirtualMachine("Virtual1"));
    assertFalse(machine.getVirtualMachineState("Virtual1"));

    // testa desligar a máquina que está desligada
    assertFalse(machine.turnOffVirtualMachine("Virtual1"));
    assertFalse(machine.getVirtualMachineState("Virtual1"));

  }

  @Test
  public void getVirtualMachineCountTest() {

    RealMachine machine = new RealMachine("Teste0", 1000, 1000);

    // teste do contador de maquinas virtuais
    machine.addVirtualMachine("Virtual1", 100, 100);
    assertEquals(1, machine.getVirtualMachineCount());
    machine.addVirtualMachine("Virtual2", 100, 100);
    assertEquals(2, machine.getVirtualMachineCount());
    machine.addVirtualMachine("Virtual3", 100, 100);
    assertEquals(3, machine.getVirtualMachineCount());
    machine.addVirtualMachine("Virtual4", 100, 100);
    assertEquals(4, machine.getVirtualMachineCount());

    // testa a contagem de maquinas virtuais ao chegar no limite
    machine.addVirtualMachine("Virtual5", 100, 100);
    assertEquals(5, machine.getVirtualMachineCount());
    machine.addVirtualMachine("Virtual6", 100, 100);
    assertEquals(5, machine.getVirtualMachineCount());

    // testa o decremento do contador.
    machine.removeVirtualMachine("Virtual5");
    assertEquals(4, machine.getVirtualMachineCount());

  }

}
