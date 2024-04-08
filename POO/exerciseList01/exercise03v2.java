import java.util.Random;

public class exercise03v2 {

  public static String[][] MatrixOperator(String[][] Matrix, int MatrixSize, int MineCount, int Case) {

    Random RandomGenerator = new Random();

    for (int i = 0; i < MatrixSize; i++) {
      for (int j = 0; j < MatrixSize; j++) {

        switch (Case) {

          case 1:

            if (RandomGenerator.nextInt(2) == 1) {
              Matrix[i][j] = "*";
              MineCount++;
            } else {
              Matrix[i][j] = " ";
            }

            break;

          case 2:

            if (Matrix[i][j] == "*" && MineCount > 10) {

              if (RandomGenerator.nextInt(2) == 0) {
                Matrix[i][j] = " ";
                MineCount--;
              }
            }

            break;

          case 3:

            break;

        }
        System.out.print(Matrix[i][j]);

      }
      System.out.println("");
    }

    System.out.println(MineCount);

    return Matrix;
  }

  public static void main(String[] args) {

    int MatrixSize = 9;

    String[][] Matrix = new String[9][9];

    int MineCount = 0;

    MatrixOperator(Matrix, MatrixSize, MineCount, 1); // Caso 1, cria a matriz;

    do {
      System.out.println(" =============================================");
      MatrixOperator(Matrix, MatrixSize, MineCount, 2);

    } while (MineCount > 10);

    System.out.println(" =============================================");

    MatrixOperator(Matrix, MatrixSize, MineCount, 3);

  }
}
