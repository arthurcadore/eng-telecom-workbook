package engtelecom.poo;

/**
 * Classe que representa uma maquina virtual, seus atributos e métodos para
 * ligar de desligar máquinas virtuais
 */
public class VirtualMachine {

  /**
   * Atributos correspondentes a classe VirtualMachine
   */

  private String virtuaMachinelName;
  private int virtualMachineHD;
  private int virtualMachineMemory;
  private boolean machineState;

  /**
   * Cria uma nova instância da classe VirtualMachine
   * 
   * @param name   Indentificador (nome) da máquina virtual;
   * @param memory Valor de memória correspondente a máquina virtual
   * @param HD     Valor de HD (armazenamento) correspondente a máquina virtual
   */

  public VirtualMachine(String name, int memory, int HD) {

    this.virtuaMachinelName = name;
    this.virtualMachineHD = HD;
    this.virtualMachineMemory = memory;
    this.machineState = false;
  }

  /**
   * Liga uma máquina virtual
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: erro na execução do método, máquina virtual já está ligada
   *         true: método executado corretamente, máquina virtual ligada
   */

  public Boolean turnOnVirtualMachine() {

    if (this.machineState) {
      return false;
    }
    this.machineState = true;
    return true;
  }

  /**
   * Desliga uma máquina virtual
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: erro na execução do método, máquina virtual já está desligada
   *         true: método executado corretamente, máquina virtual desligada
   */

  public Boolean turnOffVirtualMachine() {

    if (!(this.machineState)) {
      return false;
    }
    this.machineState = false;
    return true;
  }

  /**
   * Retorna o valor da máquina virtual (ligada ou desligada)
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: máquina virtual desligada
   *         true: máquina virtual ligada
   */

  public boolean isMachineState() {
    return machineState;
  }

  public int getVirtualMachineHD() {
    return virtualMachineHD;
  }

  public int getVirtualMachineMemory() {
    return virtualMachineMemory;
  }

  public String getVirtuaMachinelName() {
    return virtuaMachinelName;
  }

}
