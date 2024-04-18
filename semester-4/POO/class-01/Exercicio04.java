public class Exercicio04 {

  public static int fatorial(int numero) {

    int fatorial = 1;

    for (int i = 1; i < numero; i++) {

      fatorial = fatorial + fatorial * i;

    }

    return fatorial;
  }

  public static void main(String[] args) {

    if (args.length > 0) {

      int resultadoSoma = 0;

      for (int i = 0; i < args.length; i++) {

        int numeroArg = Integer.parseInt(args[i]);
        int resultadoArg = fatorial(numeroArg);
        System.out.println("0 valor do fatorial de '" + numeroArg + "' é: " + resultadoArg);

        resultadoSoma += resultadoArg;

      }

      System.out.println("0 valor da soma dos fatoriais é: " + resultadoSoma);

    } else {

      System.out.println("Nenhum argumento de linha de comando foi passado!");
    }

    System.out.println("Fim do programa!");

  }

}
