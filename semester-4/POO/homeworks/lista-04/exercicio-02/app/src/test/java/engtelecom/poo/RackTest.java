package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class RackTest {

  @Test
  public void rackTest() {

    // verifica se a tabela hash do rack foi de fato criada.
    Rack testeRack = new Rack();
    assertEquals(0, testeRack.getMachineCount());

  }

  @Test
  public void addMachineTest() {

    Rack testeRack = new Rack();

    // testa se uma maquina é criada corretamente
    assertTrue(testeRack.addMachine("Teste0", 100, 100));
    assertEquals(1, testeRack.getMachineCount());

    // testa duplicidade de nome
    assertFalse(testeRack.addMachine("Teste0", 100, 100));

    // testa se uma máquina não é criada (parâmetros incorretos)
    assertFalse(testeRack.addMachine("Teste", 0, 0));
    assertFalse(testeRack.addMachine("", 10, 10));

    // testa limite de máquinas
    assertTrue(testeRack.addMachine("Teste1", 100, 100));
    assertTrue(testeRack.addMachine("Teste2", 100, 100));
    assertTrue(testeRack.addMachine("Teste3", 100, 100));
    assertTrue(testeRack.addMachine("Teste4", 100, 100));
    assertFalse(testeRack.addMachine("Teste5", 100, 100));

  }

  @Test
  public void removeMachineTest() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);

    // verifica se a máquina é removida corretamente
    assertTrue(testeRack.removeMachine("Teste0"));
    assertEquals(0, testeRack.getMachineCount());

    // tenta remover com o array vazio
    assertFalse(testeRack.removeMachine("Teste0"));

    testeRack.addMachine("Teste1", 100, 100);

    // tenta remover máquina com nome inexistente
    assertFalse(testeRack.removeMachine("Teste0"));

  }

  @Test
  public void addVirtualMachineTest() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);

    assertTrue(testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100));

    // tenta adicionar de novo a mesma máquina
    assertFalse(testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100));

    // tenta adicionar sem máquina real
    assertFalse(testeRack.addVirtualMachine("Teste1", "Virtual0", 100, 100));

    // tenta adicionar sem nome de máquina virtual
    assertFalse(testeRack.addVirtualMachine("Teste0", "", 100, 100));

  }

  @Test
  public void removeVirtualMachineTest() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);
    testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100);

    // tenta remover em máquina real inexistente
    assertFalse(testeRack.removeVirtualMachine("Teste1", "Virtual0"));

    // tenta remover máquina virtual inexistente
    assertFalse(testeRack.removeVirtualMachine("Teste0", "Virtual1"));

    // verifica se a máquina é removida corretamente
    assertTrue(testeRack.removeVirtualMachine("Teste0", "Virtual0"));

    // tenta remover novamente a máquina;
    assertFalse(testeRack.removeVirtualMachine("Teste0", "Virtual0"));

  }

  @Test
  public void turnOnVirtualMachine() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);
    testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100);

    // verifica se a máquina é corretamente ligada
    assertTrue(testeRack.turnOnVirtualMachine("Teste0", "Virtual0"));

    // tenta ligar a máquina que já está ligada
    assertFalse(testeRack.turnOnVirtualMachine("Teste0", "Virtual0"));

  }

  @Test
  public void turnOffVirtualMachine() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);
    testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100);

    // tenta desligar a máquina com ela desligada
    assertFalse(testeRack.turnOffVirtualMachine("Teste0", "Virtual0"));

    // verifica se a máquina será corretamente desligada
    assertTrue(testeRack.turnOnVirtualMachine("Teste0", "Virtual0"));
    assertTrue(testeRack.turnOffVirtualMachine("Teste0", "Virtual0"));

    // tenta desligar a máquina que já está desligada
    assertFalse(testeRack.turnOffVirtualMachine("Teste0", "Virtual0"));

  }

  @Test
  public void getVirtualMachineStateTest() {

    Rack testeRack = new Rack();

    testeRack.addMachine("Teste0", 100, 100);
    testeRack.addVirtualMachine("Teste0", "Virtual0", 100, 100);

    // verifica o status inicial da máquina (desligado)
    assertFalse(testeRack.getVirtualMachineState("Teste0", "Virtual0"));

    // verifica se a máquina foi corretamente ligada
    assertTrue(testeRack.turnOnVirtualMachine("Teste0", "Virtual0"));
    assertTrue(testeRack.getVirtualMachineState("Teste0", "Virtual0"));

    // verifica se a máquina foi corretamente desligada
    assertTrue(testeRack.turnOffVirtualMachine("Teste0", "Virtual0"));
    assertFalse(testeRack.getVirtualMachineState("Teste0", "Virtual0"));

  }

}
