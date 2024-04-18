import java.util.Scanner;

public class StringSplit {

  public static void main(String[] args) {

    Scanner teclado = new Scanner(System.in);

    String[] vetStrings;
    while (teclado.hasNext()) {

      vetStrings = teclado.nextLine().split(":");

      System.out.println(vetStrings[0].toUpperCase());

    }
  }
}
