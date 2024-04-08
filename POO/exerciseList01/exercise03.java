import java.util.Random;

public class exercise03 {

  public static void main(String[] args) {

    int MatrixSize = 9;
    int MineMax = 10;
    int MineCount = 0;
    String[][] Matrix = new String[MatrixSize][MatrixSize];

    Random RandomGenerator = new Random();

    for (int i = 0; i < MatrixSize; i++) {
      for (int j = 0; j < MatrixSize; j++) {

        if (RandomGenerator.nextInt(2) == 1) {
          Matrix[i][j] = "*";
          MineCount++;
        } else {
          Matrix[i][j] = ".";
        }
      }
    }

    do {
      for (int i = 0; i < MatrixSize; i++) {
        for (int j = 0; j < MatrixSize; j++) {

          if (Matrix[i][j] == "*" && MineCount > MineMax) {
            if (RandomGenerator.nextInt(2) == 0) {
              Matrix[i][j] = ".";
              MineCount--;
            }
          }
        }
      }
    } while (MineCount > MineMax);

    for (int i = 0; i < MatrixSize; i++) {
      for (int j = 0; j < MatrixSize; j++) {
        System.out.print(Matrix[i][j]);
      }
      System.out.println("");
    }
  }
}
