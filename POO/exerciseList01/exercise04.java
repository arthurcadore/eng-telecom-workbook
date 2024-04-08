
import java.util.Scanner;

public class exercise04 {

  static boolean ValidPosition(int i, int j, int lineMax, int ColumnsMax) {
    if (i < 0 || j < 0 || i > lineMax - 1 || j > ColumnsMax - 1) {
      return false;
    }
    return true;
  }

  public static void main(String[] args) {

    // verifica se foi adicionado um argumento de comando.

    // define o scanner "teclado" para captura do texto.
    Scanner teclado = new Scanner(System.in);

    int MatrixSize = 9;

    String[][] Matrix = new String[MatrixSize][MatrixSize];

    // importando Matriz do arquivo para o código.
    int i = 0;
    while (teclado.hasNext()) {
      String linhaCapturada = teclado.nextLine();
      for (int j = 0; j < linhaCapturada.length(); j++) {

        if (linhaCapturada.charAt(j) == '*') {
          Matrix[i][j] = "*";
        } else {
          Matrix[i][j] = "0";
        }
      }
      i++;
    }

    for (int h = 0; h < MatrixSize; h++) {
      for (int j = 0; j < MatrixSize; j++) {

        if (Matrix[h][j] == "*") {
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
