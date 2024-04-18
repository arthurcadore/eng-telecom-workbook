import java.util.Random;
import java.util.Scanner;

public class Exercicio06 {

  public static void main(String[] args) {

    Random r = new Random();

    int numeroSorteado = r.nextInt(11);
    numeroSorteado += 1;

    Scanner teclado = new Scanner(System.in);

    int numero;
    do {
      System.out.println("Entre com o número: ");

      numero = teclado.nextInt();

      if (numero != numeroSorteado) {

        System.out.println("Errou, tente novamente: " + numeroSorteado);

      }

    } while (numero == numeroSorteado);

    System.out.println("Parabéns, voce acertou!");

  }
}
