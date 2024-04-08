
import java.util.Scanner;

public class Exercicio02 {

  public static int fatorial(int numero) {

    int fatorial = 1;

    for (int i = 1; i < numero; i++) {

      fatorial = fatorial + fatorial * i;

    }

    return fatorial;
  }

  public static void main(String[] args) {

    if (args.length == 2) {

      int numero1 = Integer.parseInt(args[0]);
      int i = fatorial(numero1);

      int numero2 = Integer.parseInt(args[1]);
      int j = fatorial(numero2);

      System.out.println("0 valor do fatorial de '" + numero1 + "' é: " + i);

      System.out.println("0 valor do fatorial de '" + numero2 + "' é: " + j);

      int resultadoSoma = (i + j);

      System.out.println("0 valor da soma dos fatoriais é: " + resultadoSoma);

    } else {

      System.out.println("Por favor, insira dois argumentos de linha de comando!");
    }

    System.out.println("Fim do programa!");

  }

}
