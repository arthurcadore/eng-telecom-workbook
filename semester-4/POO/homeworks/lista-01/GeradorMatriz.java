import java.util.Random;

public class GeradorMatriz {

  public static void main(String[] args) {

    // define os parâmetros (principais) que serão utilizadas no programa.
    int MatrixSize = 9;
    int MineMax = 10;
    int MineCount = 0;

    // cria uma matriz para armazenar os valores gerados através "random"
    String[][] Matrix = new String[MatrixSize][MatrixSize];
    Random RandomGenerator = new Random();

    // Loop para criar a matriz, o loop consiste em gerar uma matriz binária.
    do {
      for (int i = 0; i < MatrixSize; i++) {
        for (int j = 0; j < MatrixSize; j++) {

          // Ao receber '1' é armazenada uma mina na posição correspondente.
          // Isso permite que as minas sejam espalhadas por todo o campo, tendo 50% de
          // chance em cada célula.
          if (RandomGenerator.nextInt(2) == 1) {
            Matrix[i][j] = "*";
            MineCount++;
          } else {
            Matrix[i][j] = ".";
          }
        }
      }
      // O loop de criação irá garantir que pelo menos 10 minas sejam criadas.
      // Por mais que a chance criação seja de 50% em 81 posições.
    } while (MineCount < 10);

    // Após a criação, as minas minas sobrando (caso exitam) são retiradas, através
    // do uso novamente da função "random".
    do {
      for (int i = 0; i < MatrixSize; i++) {
        for (int j = 0; j < MatrixSize; j++) {

          // Verifica se a celula contem uma mina e se a contagem de minas ainda é maior
          // que o limite.
          if (Matrix[i][j] == "*" && MineCount > MineMax) {

            // utiliza novamente a função random, tornando a ordem das minas ainda mais
            // aleatória
            if (RandomGenerator.nextInt(2) == 0) {
              Matrix[i][j] = ".";
              MineCount--;
            }
          }
        }
      }

      // A função ficará em loop até que a quantidade correta de minas esteja presente
      // no campo
    } while (MineCount > MineMax);

    // realiza a impressão da mina.
    for (int i = 0; i < MatrixSize; i++) {
      for (int j = 0; j < MatrixSize; j++) {
        System.out.print(Matrix[i][j]);
      }
      System.out.println("");
    }
  }
}
