package engtelecom.poo;

import java.util.Arrays;
import java.util.Random;

/**
 * Classe que representa um robo, seus atributos e alguns métodos para
 * tratamento de movimentação e localização do robo.
 */

public class Robo {

  /**
   * Constantes de movimentação e coordenadas iniciais do robo, define a movimentação minima
   * e máxima do robo, alem de sua posição inicial;
   */

  private static final int MAX_MOVIMENTS = 100;
  private static final int MIN_MOVIMENTS = 0;
  private static final int[] INITIAL_COORDINATE = { 0, 0 };

  /**
   * Demais constantes de direção do robo, definem a direção padrão do robo além de valores para os condicionais de movimentação;
   */
  private static final String DEFAULT_DIRECTION = "norte";
  private static final String NORTH_DIRECTION = "norte";
  private static final String WEST_DIRECTION = "oeste";
  private static final String EAST_DIRECTION = "leste";
  private static final String SOUTH_DIRECTION = "sul";
  private static final String LEFT_DIRECTION = "esquerda";
  private static final String RIGHT_DIRECTION = "direita";

  private static final char RIGHT_CASE = 'D';
  private static final char LEFT_CASE = 'E';
  private static final char MOVIMENT_CASE = 'M';

  /**
   * Atributos correspondentes a classe robo;
   */
  private String roboID;
  private String atualDirection;
  private String previousDirection;
  private char[] explorationMap;
  private int[] exploreArea;
  private int[] atualLocation;
  private int[] previousLocation;
  private int remainingMoviments;
  private int movimentSize;

  /**
   * Cria um novo uma nova instância robo;
   * 
   * @param roboID             Identificador único do robo (cadeia de caracteres);
   * @param exploreSize        Tamanho da aresta de um quadrado (da área que será
   *                           explorada), caso o valor passado como parâmetro
   *                           seja menor ou igual a 0, será assumido por padrão o
   *                           valor 1;
   * @param initialLocation    Coordenada inicial do robo;
   * @param initialDirection   Direção frontal inicial do robo, os valores
   *                           permitidos são "norte", "sul", "leste" e "oeste".
   *                           Qualquer valor diferente será interpretado como
   *                           incorreto e a variavel receberá o valor default
   *                           "norte";
   * @param remainingMoviments Quantidade de movimentos que poderá fazer (limitado
   *                           ao máximo e minimo perimitido pela classe);
   * @param movimentSize       Tamanho de cada movimento;
   */

  public Robo(String roboID, int exploreSize, int[] initialLocation, String initialDirection, int remainingMoviments,
      int movimentSize) {

    // Atribui o valor da string roboID ao robo;
    this.roboID = roboID;

    // verifica se o tamanho a ser explorado é maior que 0;
    this.exploreArea = new int[2];
    if (exploreSize > 0) {
      this.exploreArea[0] = exploreSize;
      this.exploreArea[1] = exploreSize;
    } else {
      this.exploreArea[0] = 1;
      this.exploreArea[1] = 1;
    }

    // verifica se o valor de direção foi passado corretamente, caso não, assume o
    // default;
    if (initialDirection.equals(NORTH_DIRECTION) || initialDirection.equals(SOUTH_DIRECTION)
        || initialDirection.equals(EAST_DIRECTION) || initialDirection.equals(WEST_DIRECTION)) {
      this.atualDirection = initialDirection;
      this.previousDirection = initialDirection;
    } else {
      this.atualDirection = DEFAULT_DIRECTION;
      this.previousDirection = DEFAULT_DIRECTION;
    }

    // verifica se a coordenada passada é valida, caso não seja, utiliza a função
    // random;
    if (initialLocation[0] > INITIAL_COORDINATE[0] && initialLocation[1] > INITIAL_COORDINATE[1]) {
      if (initialLocation[0] < this.exploreArea[0] && initialLocation[1] < this.exploreArea[1]) {
        this.atualLocation = initialLocation;
        this.previousLocation = initialLocation;
      }
    } else {

      Random random = new Random();
      int xRandom = random.nextInt(exploreArea[0]);
      int yRandom = random.nextInt(exploreArea[1]);
      int[] randomCoordinate = { xRandom, yRandom };

      this.atualLocation = randomCoordinate;
      this.previousLocation = randomCoordinate;

      // Caso entre neste laço, a direção obrigatóriamente deve ser a default;
      this.atualDirection = DEFAULT_DIRECTION;
      this.previousDirection = DEFAULT_DIRECTION;

    }

    // verifica se a quantidade de movimentos está dentro do valor limitante, caso
    // esteja acima, atribui o valor de 100, caso esteja abaixo, atribui o valor 0;
    if (remainingMoviments < MAX_MOVIMENTS && remainingMoviments > MIN_MOVIMENTS) {
      this.remainingMoviments = remainingMoviments;
    } else if (remainingMoviments > MAX_MOVIMENTS) {
      this.remainingMoviments = MAX_MOVIMENTS;
    } else {
      this.remainingMoviments = MIN_MOVIMENTS;
    }

    // Verifica se o tamanho de movimentação é maior que área de cobertura, caso
    // seja, assume o tamanho da área de cobertura;
    if (movimentSize < exploreArea[1]) {
      this.movimentSize = movimentSize;
    } else {
      this.movimentSize = exploreArea[1];
    }
  }

  /**
   * Obtem a localização atual do robo;
   * 
   * @return Valor atual da localização do robo (x,y);
   */

  public int[] getAtualLocation() {
    return atualLocation;
  }

  /**
   * Obtem a direção atual do robo;
   * 
   * @return Valor atual da direção do robo ('norte', 'sul', 'leste' ou 'oeste');
   */

  public String getAtualDirection() {
    return atualDirection;
  }

  /**
   * Obtem a localização anterior do robo;
   * 
   * @return Valor anterior da localização do robo (x,y);
   */

  public int[] getPreviousLocation() {
    return previousLocation;
  }

  /**
   * Obtem a direção anterior do robo;
   * 
   * @return Valor anterior da direção do robo ('norte', 'sul', 'leste' ou
   *         'oeste');
   */

  public String getPreviousDirection() {
    return previousDirection;
  }

  /**
   * Obtem o mapa de exploração atual do robo (caso exista);
   * Caso não exista, retornará a string 'MAPA-NAO-CARREGADO';
   * 
   * @return Mapa de exploração do robo;
   */
  public String getExplorationMap() {

    if (this.explorationMap.length != 0) {
    String returnString = new String(this.explorationMap);
    return returnString;
  }
  return "MAPA-NAO-CARREGADO";
}

/**
 * Obtem a quatidade de movimentos faltantes no mapa de exploração
 * 
 * @return quantidade de movimentos faltantes;
 */

public int getRemainingExplore() {
  return this.explorationMap.length;
}

  /**
   * Obtem a quantidade de movimentos restantes do robo;
   * 
   * @return Valor de movimentos restantes do robo;
   */

  public int getRemainingMoviments() {
    return remainingMoviments;
  }

  /**
   * Obtem o identificador único do robo;
   * 
   * @return Valor (String) do identificador único do robo;
   */

  public String getRoboID() {
    return roboID;
  }

  /**
   * Altera a direção frontal do robo;
   * 
   * @param turnDirection Valor de alteração do eixo do robo, são permitidos os
   *                      valores "esquerda" e "direita", caso o valor passado não
   *                      corresponda a esses campos, o robo irá retornar sua
   *                      direção atual;
   * 
   * @return Valor da direção frontal do robo (após o tratamento dado pelo
   *         metodo);
   */
  public String turnAxis(String turnDirection) {

    // verifica se o valor de direção foi passado corretamente, caso não, assume o
    // default;
    if (turnDirection.equals(RIGHT_DIRECTION)) {
      switch (this.atualDirection) {

        case NORTH_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = EAST_DIRECTION;
          break;

        case EAST_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = SOUTH_DIRECTION;
          break;

        case SOUTH_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = WEST_DIRECTION;
          break;

        case WEST_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = NORTH_DIRECTION;
          break;
      }
      this.remainingMoviments--;
    } else if (turnDirection.equals(LEFT_DIRECTION)) {
      switch (this.atualDirection) {

        case NORTH_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = WEST_DIRECTION;
          break;

        case WEST_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = SOUTH_DIRECTION;
          break;

        case SOUTH_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = EAST_DIRECTION;
          break;

        case EAST_DIRECTION:
          this.previousDirection = this.atualDirection;
          this.atualDirection = NORTH_DIRECTION;
          break;
      }
      this.remainingMoviments--;
    }
    
    return this.atualDirection;
  }

  /**
   * Desloca o robo em sua direção frontal;
   * 
   * O deslocamento do robo só ira correr caso seja possivel, isto é, o ponto para
   * onde o robo deve se deslocar esteja dentro da área de movimentação. O tamanho
   * do deslocamento dependerá do valor dado durante a construção do robo;
   * 
   * @return Valor booleano correspondente a aplicação do chamada, verdadeiro para
   *         caso de sucesso na movimentação, falso para o caso de falha na
   *         movimentação;
   */
  public boolean walk() {

    if (this.remainingMoviments > 0) {
    switch (this.atualDirection) {
      case NORTH_DIRECTION:
        if ((this.atualLocation[1] + this.movimentSize) <= this.exploreArea[1]) {
          this.previousLocation[0] = this.atualLocation[0];
          this.previousLocation[1] = this.atualLocation[1];
          this.remainingMoviments--;
          this.atualLocation[1] = (this.atualLocation[1] + this.movimentSize);
          return true;
        }
        break;

      case SOUTH_DIRECTION:
        if ((this.atualLocation[1] - this.movimentSize) >= INITIAL_COORDINATE[1]) {
          this.previousLocation[0] = this.atualLocation[0];
          this.previousLocation[1] = this.atualLocation[1];
          this.remainingMoviments--;
          this.atualLocation[1] = (this.atualLocation[1] - this.movimentSize);
          return true;
        }
        break;

      case WEST_DIRECTION:
        if ((this.atualLocation[0] - this.movimentSize) >= INITIAL_COORDINATE[0]) {
          this.previousLocation[0] = this.atualLocation[0];
          this.previousLocation[1] = this.atualLocation[1];
          this.remainingMoviments--;
          this.atualLocation[0] = (this.atualLocation[0] - this.movimentSize);
          return true;
        }
        break;

      case EAST_DIRECTION:
        if ((this.atualLocation[0] + this.movimentSize) <= this.exploreArea[0]) {
          this.previousLocation[0] = this.atualLocation[0];
          this.previousLocation[1] = this.atualLocation[1];
          this.remainingMoviments--;
          this.atualLocation[0] = (this.atualLocation[0] + this.movimentSize);
          return true;
        }
        break;
    }
    }
    return false;
  }

  /**
   * Carrega o mapa de exploração no robo;
   * 
   * O mapa de exploração é uma cadeia de caracteres (string) onde são permitidos
   * apenas os caracteres ('M, E, D'). Caso outros valores de caracteres sejam
   * passados na chamada da função, será retornado o status 'false';
   * 
   * @param explorationMap String correspondente ao mapa de exploração a ser
   *                       carregado;
   * 
   * @return Valor booleano correspondente a aplicação do chamada, verdadeiro para
   *         caso de sucesso de carregamento, falso para o caso de falha no
   *         carregamento do mapa de exploração;
   */
  public boolean loadExploration(String explorationMap) {

    if (explorationMap.length() <= 0) {
      return false;
    }

    char[] explorationArray = explorationMap.toCharArray();

    for (int index = 0; index < explorationMap.length(); index++) {
      if (!(explorationArray[index] == LEFT_CASE || explorationArray[index] == RIGHT_CASE
          || explorationArray[index] == MOVIMENT_CASE)) {
        return false;
      }
    }

    this.explorationMap = explorationArray;
    return true;
  }

  /**
   * Executa a proxima tarefa no mapa de exploração;
   * 
   * Ao executar este método, a proxima tarefa no mapa de exploração é realizada;
   * Caso não haja mais tarefas pendentes no mapa de exploração, o retorno da
   * chamada será 'false', caso contrário, será 'true';
   * 
   * @returnValor booleano correspondente a aplicação do chamada, verdadeiro para
   *              caso de sucesso de carregamento, falso para o caso de falha no
   *              carregamento do mapa de exploração;
   */

  public boolean runExploration() {

    if (this.explorationMap.length > 0) {
      char[] auxiliarArray;

      switch (explorationMap[0]) {
        case MOVIMENT_CASE:
          this.walk();
          auxiliarArray = Arrays.copyOfRange(this.explorationMap, 1, this.explorationMap.length);
          this.explorationMap = auxiliarArray;
          break;
        case LEFT_CASE:
          this.turnAxis(LEFT_DIRECTION);
          auxiliarArray = Arrays.copyOfRange(this.explorationMap, 1, this.explorationMap.length);
          this.explorationMap = auxiliarArray;
          break;

        case RIGHT_CASE:
          this.turnAxis(RIGHT_DIRECTION);
          auxiliarArray = Arrays.copyOfRange(this.explorationMap, 1, this.explorationMap.length);
          this.explorationMap = auxiliarArray;
          break;
      }
      return true;
    }
    return false;
  }
}
