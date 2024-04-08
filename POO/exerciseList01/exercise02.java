public class exercise02 {

  public static void main(String[] args) {

    if (args.length == 2) {

      int firstNumber = Integer.parseInt(args[0]);

      int secondNumber = Integer.parseInt(args[1]);

      for (int i = firstNumber; i < secondNumber; i++) {

        if (!(i % 2 == 0)) {

          System.out
              .println("O número '" + i + "' é impar e está entre '" + firstNumber + "' e '" + secondNumber + "'.");

        }
      }
    } else {

      System.out.println("Por favor, insira dois argumentos de linha de comnado!");
    }
  }
}
