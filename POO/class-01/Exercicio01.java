import java.util.Scanner;

public class Exercicio01 {

  public static void main(String[] args) {

    System.out.println("Entre com  o numero: ");

    Scanner teclado = new Scanner(System.in);

    int numero = teclado.nextInt();

    int fatorial = 1;

    for (int i = 1; i < numero; i++) {

      fatorial = fatorial + fatorial * i;

    }

    System.out.println("Valor do fatorial é:" + fatorial);

    System.out.println("Fim do programa");

  }

}
