public class exercise01 {

  public static void main(String[] args) {

    if (args.length > 0) {

      int year = Integer.parseInt(args[0]);

      if (year % 100 == 0) {

        if (year % 400 == 0) {

          System.out.println("O ano informado '" + year + "' é bissexto!");

        } else {

          System.out.println("O ano informado '" + year + "' não é bissexto!");

        }
      } else if (year % 4 == 0) {

        System.out.println("O ano informado '" + year + "' é bissexto!");

      } else {

        System.out.println("O ano informado '" + year + "' não é bissexto!");

      }

    } else {

      System.out.println("Por favor, insira o argumento de linha de comando!");
    }
  }

}
