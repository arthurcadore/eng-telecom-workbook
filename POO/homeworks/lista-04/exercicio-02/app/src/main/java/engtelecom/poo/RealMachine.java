package engtelecom.poo;

import java.util.HashMap;

/**
 * Classe que representa uma maquina real, seus atributos e métodos para
 * tratamento máquinas virtuais.
 */
public class RealMachine {

  /**
   * Constante de quantidade máxima de máquinas virtuais pertimidas por maquina
   * real
   */

  private static final int MAX_MACHINE_CAPABILITY = 5;

  /**
   * Atributos correspondentes a classe RealMachine
   */

  private HashMap<String, VirtualMachine> virtualMachineArray;
  private String machineName;
  private int machineMemory;
  private int machineHD;

  /**
   * Cria uma nova instância da classe RealMachine
   * 
   * @param name   Identificador (nome) da máquina real;
   * @param memory Valor de memória correspondente a máquina real
   * @param HD     Valor de HD (armazenamento) correspondente a máquina real
   */

  public RealMachine(String name, int memory, int HD) {

    this.virtualMachineArray = new HashMap<>();
    this.machineName = name;
    this.machineMemory = memory;
    this.machineHD = HD;

  }

  /**
   * Adiciona uma máquina virtual a máquina real já criada;
   * 
   * @param name   Identificador individual de cada máquina virtual a ser
   *               incluida na máquina real, caso tente ser incluida uma
   *               máquina com um identificador já existente, o método irá
   *               retornar false
   * @param memory Valor de memória da máquina virtual (valor minimo é 1,
   *               valor máximo é o disponivel na máquina real correspondente)
   * @param HD     Valor de HD (armazenamento) da máquina virtual (valor
   *               minimo é 1, valor máximo é o disponivel na máquina real)
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não adicinada
   *         true: Executou o método com sucesso, máquina virtual adicionada
   */

  public Boolean addVirtualMachine(String name, int memory, int HD) {

    if (name.length() <= 0 || memory <= 0 || HD <= 0) {
      return false; // "valor de memória/HD/Nome inválido";

    }

    if (memory > this.machineMemory || HD > this.machineHD) {
      return false; // "Valor de memória/HD insuficiente";
    }

    if (this.virtualMachineArray.size() >= MAX_MACHINE_CAPABILITY) {
      return false; // "máquina cheia";
    }

    if (this.virtualMachineArray.get(name) != null) {
      return false; // duplicidade de nome;
    }

    this.machineMemory = this.machineMemory - memory;
    this.machineHD = this.machineHD - HD;

    VirtualMachine newVirtualMachine = new VirtualMachine(name, memory, HD);
    this.virtualMachineArray.put(name, newVirtualMachine);

    return true; // "funcionou";
  }

  /**
   * Remove uma máquina virtual da máquina real correspondente;
   * 
   * @param name Identificador individual da máquina real associada ao
   *             rack, caso seja informado um valor inexistente, o método
   *             irá retornar false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi
   *         removida
   *         true: Executou o método com sucesso, máquina virtual removida
   */

  public Boolean removeVirtualMachine(String name) {

    if (this.virtualMachineArray.size() <= 0) {
      return false; // "Array vazio";
    }

    if (name.length() <= 0) {
      return false; // "sem nome";
    }

    if (this.virtualMachineArray.get(name) != null) {

      VirtualMachine auxVirtualMachine = this.virtualMachineArray.get(name);
      this.machineHD = this.machineHD + auxVirtualMachine.getVirtualMachineHD();
      this.machineMemory = this.machineMemory + auxVirtualMachine.getVirtualMachineMemory();
      this.virtualMachineArray.remove(name);

      return true; // "funcionou";
    }
    return false; // "nome inválido";
  }

  /**
   * Liga uma máquina virtual da máquina real correspondente;
   * 
   * @param name Identificador individual da máquina real associada ao
   *             rack, caso seja informado um valor inexistente, o método
   *             irá retornar false
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi
   *         ligada
   *         true: Executou o método com sucesso, máquina virtual foi ligada
   */

  public Boolean turnOnVirtualMachine(String name) {

    if (this.virtualMachineArray.get(name) != null) {
      VirtualMachine auxMachine = this.virtualMachineArray.get(name);

      return auxMachine.turnOnVirtualMachine();
    }
    return false; // "não funcionou";
  }

  /**
   * Desliga uma máquina virtual da máquina real correspondente;
   * 
   * @param name Identificador individual da máquina real associada ao
   *             rack, caso seja informado um valor inexistente, o método
   *             irá retornar false
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi
   *         desligada
   *         true: Executou o método com sucesso, máquina virtual foi desligada
   */

  public Boolean turnOffVirtualMachine(String name) {

    if (this.virtualMachineArray.get(name) != null) {
      VirtualMachine auxMachine = this.virtualMachineArray.get(name);

      return auxMachine.turnOffVirtualMachine();
    }
    return false; // "não funcionou";
  }

  /**
   * Verifica o estado de uma máquina virtual
   * 
   * @param name Identificador individual da máquina real associada ao
   *             rack, caso seja informado um valor inexistente, o método
   *             irá retornar false
   * 
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, ou a máquina virtual está
   *         desligada
   *         true: máquina virtual está ligada
   */

  public Boolean getVirtualMachineState(String name) {

    if (this.virtualMachineArray.get(name) != null) {
      VirtualMachine auxMachine = this.virtualMachineArray.get(name);

      return auxMachine.isMachineState();
    }
    return false; // "não funcionou";
  }

  public String getMachineName() {
    return machineName;
  }

  public int getMachineMemory() {
    return machineMemory;
  }

  public int getMachineHD() {
    return machineHD;
  }

  public int getVirtualMachineCount() {
    return this.virtualMachineArray.size();
  }

}
