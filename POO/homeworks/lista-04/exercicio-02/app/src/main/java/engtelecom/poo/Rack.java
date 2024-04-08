package engtelecom.poo;

import java.util.HashMap;

/**
 * Classe que representa um Rack, seus atributos e métodos para adicionar ou
 * retirar máquinas do rack.
 */

public class Rack {

  /**
   * Constante de quantidade máxima de máquinas pertimidas por Rack
   */

  private static final int MAX_RACK_CAPABILITY = 5;

  /**
   * Atributo correspondente a classe Rack
   */

  private HashMap<String, RealMachine> machineArray;

  /**
   * Cria uma nova instância Rack
   */

  public Rack() {

    this.machineArray = new HashMap<>();
  }

  /**
   * Adiciona uma máquina real ao Rack
   * 
   * @param name   Identificador individual de cada máquina real a ser incluida no
   *               rack, caso tente ser incluida uma máquina com um identificador
   *               já existente, o método irá retornar false
   * @param memory Valor de memória da máquina real que será incluida no rack
   *               (valor minimo é 1)
   * @param HD     Valor de HD (Armazenamento) da máquina real que será incluida
   *               no rack (valor minimo é 1)
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina não foi adicionada ao rack
   *         true: Executou o método com sucesso, máquina adicionada ao rack
   */

  public Boolean addMachine(String name, int memory, int HD) {

    if (this.machineArray.size() >= MAX_RACK_CAPABILITY) {
      return false; // "rack cheio";
    }

    if (name.length() <= 0 || memory <= 0 || HD <= 0) {
      return false; // "não funcionou, parâmetros incorretos";
    }

    if (this.machineArray.get(name) != null) {
      return false; // duplicidade de nome;
    }

    RealMachine newMachine = new RealMachine(name, memory, HD);
    this.machineArray.put(name, newMachine);

    return true; // "funcionou";
  }

  /**
   * Remove uma máquina real do Rack
   * 
   * @param name Identificador individual de cada máquina real associada ao rack,
   *             caso seja informado um valor inexistente, o método irá retornar
   *             false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina não foi removida do rack
   *         true: Executou o método com sucesso, máquina removida do rack
   */

  public Boolean removeMachine(String name) {

    if (this.machineArray.size() <= 0) {
      return false; // "array vazio";
    }

    if (name.length() <= 0) {
      return false; // "sem nome na remoção";
    }

    if (this.machineArray.get(name) != null) {
      this.machineArray.remove(name);
      return true; // "funcionou";
    }
    return false; // "nome incorreto";
  }

  /**
   * Adiciona uma máquina virtual a máquina real já criada
   * 
   * @param RealName    Identificador individual de cada máquina real associada ao
   *                    rack,caso seja informado um valor inexistente, o método
   *                    irá retornar false
   * @param VirtualName Identificador individual de cada máquina virtual a ser
   *                    incluida na máquina real, caso tente ser incluida uma
   *                    máquina com um identificador já existente, o método irá
   *                    retornar false
   * @param memory      Valor de memória da máquina virtual (valor minimo é 1,
   *                    valor máximo é o disponivel na máquina real)
   * @param HD          Valor de HD (armazenamento) da máquina virtual (valor
   *                    minimo é 1, valor máximo é o disponivel na máquina real)
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não adicionada
   *         true: Executou o método com sucesso, máquina virtual adicionada
   */

  public Boolean addVirtualMachine(String RealName, String VirtualName, int memory, int HD) {

    if (this.machineArray.get(RealName) != null) {
      RealMachine auxMachine = this.machineArray.get(RealName);
      return auxMachine.addVirtualMachine(VirtualName, memory, HD);
    }
    return false;
  }

  /**
   * Remove uma máquina virtual da máquina real já criada;
   * 
   * @param RealName    Identificador individual da máquina real associada ao
   *                    rack, caso seja informado um valor inexistente, o método
   *                    irá retornar false
   * @param VirtualName Identificador individual da máquina virtual associada a
   *                    máquina real, caso seja informado um valor inexistente, o
   *                    método irá retornar false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi removida
   *         true: Executou o método com sucesso, máquina virtual removida
   */

  public Boolean removeVirtualMachine(String RealName, String VirtualName) {

    if (this.machineArray.get(RealName) != null) {
      RealMachine auxMachine = this.machineArray.get(RealName);
      return auxMachine.removeVirtualMachine(VirtualName);
    }
    return false;
  }

  /**
   * Liga uma máquina virtual
   * 
   * @param RealName    Identificador individual da máquina real associada ao
   *                    rack, caso seja informado um valor inexistente, o método
   *                    irá retornar false
   * @param VirtualName Identificador individual da máquina virtual associada a
   *                    máquina real, caso seja informado um valor inexistente, o
   *                    método irá retornar false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi ligada
   *         true: Executou o método com sucesso, máquina virtual foi ligada
   */

  public Boolean turnOnVirtualMachine(String RealName, String VirtualName) {

    if (this.machineArray.get(RealName) != null) {
      RealMachine auxMachine = this.machineArray.get(RealName);
      return auxMachine.turnOnVirtualMachine(VirtualName);
    }
    return false;
  }

  /**
   * Desliga uma máquina virtual
   * 
   * @param RealName    Identificador individual da máquina real associada ao
   *                    rack, caso seja informado um valor inexistente, o método
   *                    irá retornar false
   * @param VirtualName Identificador individual da máquina virtual associada a
   *                    máquina real, caso seja informado um valor inexistente, o
   *                    método irá retornar false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: Erro na execução do metodo, máquina virtual não foi desligada
   *         true: Executou o método com sucesso, máquina virtual foi desligada
   */

  public Boolean turnOffVirtualMachine(String RealName, String VirtualName) {

    if (this.machineArray.get(RealName) != null) {
      RealMachine auxMachine = this.machineArray.get(RealName);
      return auxMachine.turnOffVirtualMachine(VirtualName);
    }
    return false;
  }

  /**
   * Verifica o estado de uma máquina virtual
   * 
   * @param RealName    Identificador individual da máquina real associada ao
   *                    rack, caso seja informado um valor inexistente, o método
   *                    irá retornar false
   * @param VirtualName Identificador individual da máquina virtual associada a
   *                    máquina real, caso seja informado um valor inexistente, o
   *                    método irá retornar false
   * @return Valor de retorno do método, sendo dois possiveis valores:
   * 
   *         false: máquina está desligada ou erro na execução do método
   *         true: máquina está ligada
   */

  public Boolean getVirtualMachineState(String RealName, String VirtualName) {

    if (this.machineArray.get(RealName) != null) {
      RealMachine auxMachine = this.machineArray.get(RealName);
      return auxMachine.getVirtualMachineState(VirtualName);
    }
    return false;
  }

  /**
   * Informa a quantidade de máquinas reais associadas ao rack
   * 
   * @return retorna a quantidade de máquinas associadas ao rack
   */

  public int getMachineCount() {
    return this.machineArray.size();
  }

}
