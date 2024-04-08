package engtelecom.poo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Test;

public class VirtualMachineTest {

  @Test
  public void virtualMachineTest() {

    VirtualMachine machine = new VirtualMachine("Virtual1", 100, 100);

    // verifica se os valores dos parâmetros estão corretos.
    assertEquals("Virtual1", machine.getVirtuaMachinelName());
    assertEquals(100, machine.getVirtualMachineMemory());
    assertEquals(100, machine.getVirtualMachineHD());
    assertFalse(machine.isMachineState());
  }

  @Test
  public void turnOnVirtualMachineTest() {

    VirtualMachine machine = new VirtualMachine("Virtual1", 100, 100);

    // verifica se a máquina é ligada corretamente
    assertTrue(machine.turnOnVirtualMachine());

    // testa ligar a máquina com ela já ligada
    assertFalse(machine.turnOnVirtualMachine());
  }

  @Test
  public void turnOffVirtualMachineTest() {

    VirtualMachine machine = new VirtualMachine("Virtual1", 100, 100);

    // tenta desligar a máquina com ela desligada
    assertFalse(machine.turnOffVirtualMachine());

    // verifica se a máquina é corretamente desligada
    assertTrue(machine.turnOnVirtualMachine());
    assertTrue(machine.turnOffVirtualMachine());

    // tenta desligar a máquina novamente
    assertFalse(machine.turnOffVirtualMachine());

  }

}
