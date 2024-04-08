
import java.util.Scanner;

public class LeitorMatriz {

  // Esta é utilizada para tentar acessar as posições adjacentes de cada célula
  // Função para verificar se a posição da matriz é valida.
  static boolean ValidPosition(int i, int j, int lineMax, int ColumnsMax) {
    if (i < 0 || j < 0 || i > lineMax - 1 || j > ColumnsMax - 1) {
      return false;
    }
    return true;
  }

  public static void main(String[] args) {

    // Define o tamano da matriz que será lida.
    int MatrixSize = 9;

    // define o scanner "teclado" para captura do texto.
    Scanner teclado = new Scanner(System.in);

    // cria a matriz para armazenar os valores recebidos via captura de arquivo
    String[][] Matrix = new String[MatrixSize][MatrixSize];

    // Impora a Matriz do arquivo para o código.
    int i = 0;
    while (teclado.hasNext()) {
      String linhaCapturada = teclado.nextLine();

      // Captura o valor de cada coluna da linha.
      for (int j = 0; j < linhaCapturada.length(); j++) {

        // verifica se o valor é correspondente a uma mina
        if (linhaCapturada.charAt(j) == '*') {
          Matrix[i][j] = "*";
        } else {
          Matrix[i][j] = "0";
        }
      }
      // avança uma linha.
      i++;
    }

    // entra em loop de verificação das posições (varre toda a matriz).
    for (int h = 0; h < MatrixSize; h++) {
      for (int j = 0; j < MatrixSize; j++) {

        // verifica se há uma mina na posição atual.
        if (Matrix[h][j] == "*") {

          // caso haja uma mina, verifica se a posição adjacente é valida.
          // caso a posição adjacente seja válida, incrementa uma unidade a posição
          // adjacente (desde que não seja outra mina).

          // Exitem 8 posições adjacentes, dessa maneira, são 8 verificações:

          if (ValidPosition(h - 1, j - 1, MatrixSize, MatrixSize) && Matrix[h - 1][j - 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h - 1][j - 1]);
            numeroArg++;
            Matrix[h - 1][j - 1] = Integer.toString(numeroArg);

          }
          if (ValidPosition(h, j - 1, MatrixSize, MatrixSize) && Matrix[h][j - 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h][j - 1]);
            numeroArg++;
            Matrix[h][j - 1] = Integer.toString(numeroArg);
          }
          if (ValidPosition(h + 1, j - 1, MatrixSize, MatrixSize) && Matrix[h + 1][j - 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h + 1][j - 1]);
            numeroArg++;
            Matrix[h + 1][j - 1] = Integer.toString(numeroArg);

          }
          if (ValidPosition(h - 1, j, MatrixSize, MatrixSize) && Matrix[h - 1][j] != "*") {
            Matrix[h - 1][j] = "1";

            int numeroArg = Integer.parseInt(Matrix[h - 1][j]);
            numeroArg++;
            Matrix[h - 1][j] = Integer.toString(numeroArg);

          }
          if (ValidPosition(h + 1, j, MatrixSize, MatrixSize) && Matrix[h + 1][j] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h + 1][j]);
            numeroArg++;
            Matrix[h + 1][j] = Integer.toString(numeroArg);
          }
          if (ValidPosition(h - 1, j + 1, MatrixSize, MatrixSize) && Matrix[h - 1][j + 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h - 1][j + 1]);
            numeroArg++;
            Matrix[h - 1][j + 1] = Integer.toString(numeroArg);

          }
          if (ValidPosition(h, j + 1, MatrixSize, MatrixSize) && Matrix[h][j + 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h][j + 1]);
            numeroArg++;
            Matrix[h][j + 1] = Integer.toString(numeroArg);

          }
          if (ValidPosition(h + 1, j + 1, MatrixSize, MatrixSize) && Matrix[h + 1][j + 1] != "*") {

            int numeroArg = Integer.parseInt(Matrix[h + 1][j + 1]);
            numeroArg++;
            Matrix[h + 1][j + 1] = Integer.toString(numeroArg);
          }
        }

      }

    }

    // após incrementar todos os valores, imprime novamente a matriz.
    // para as posições que não foram incrementadas, imprime "."
    for (int k = 0; k < MatrixSize; k++) {
      for (int l = 0; l < MatrixSize; l++) {
        if (Matrix[k][l].equals("0")) {
          System.out.print(".");
        } else {
          System.out.print(Matrix[k][l]);
        }
      }
      System.out.println("");
    }

  }

}