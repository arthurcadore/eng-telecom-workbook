import java.util.Scanner;

public class KeepScanner {

  public static void main(String[] args) {

    // definindo o tipo scanner (le tudo oque está recebendo do teclado.)
    Scanner teclado = new Scanner(System.in);

    // metodo hasNext sabe que tem mais linhas sendo fornecidas.
    // equanto houver linhas fornecidas, mantem o while válido.
    while (teclado.hasNext()) {

      // imprime a linha recebida via scanner do teclado.
      System.out.println(teclado.nextLine());

    }
  }
}
