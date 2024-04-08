import java.util.Random;
import java.util.Scanner;

import javax.sound.sampled.SourceDataLine;

public class Exercicio05 {

  public static void main(String[] args) {

    Random r = new Random();

    int numeroSorteado = r.nextInt(10);

    Scanner teclado = new Scanner(System.in);

    System.out.println("Entre com o número (de 1 a 10): ");

    int numero = teclado.nextInt();

    if (numero == numeroSorteado) {

      System.out.println("Parabéns, voce acertou!");
    } else {

      System.out.println("Errou, o número era: " + numeroSorteado);

    }

  }

}
