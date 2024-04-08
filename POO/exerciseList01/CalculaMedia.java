public class CalculaMedia {

  public static void main(String[] args) {

    // Verifica se há sete argumentos de linha de comando (caso contrário, não
    // executa o código).Para a atividade, é necessário exatamente este valor de
    // argumentos para o calculo
    if (args.length == 7) {

      double A1 = 0;
      double A2 = 0;
      double E1 = 0;
      double E2 = 0;
      double E3 = 0;
      double E4 = 0;
      double E5 = 0;

      // tenta realizar a conversão de string para double (valores reais)
      // Caso não seja possivel converter para double (input incorreto), é disparado
      // um alerta!

      try {
        A1 = Double.parseDouble(args[0]);
        A2 = Double.parseDouble(args[1]);
        E1 = Double.parseDouble(args[2]);
        E2 = Double.parseDouble(args[3]);
        E3 = Double.parseDouble(args[4]);
        E4 = Double.parseDouble(args[5]);
        E5 = Double.parseDouble(args[6]);

      } catch (Exception e) {
        // Finaliza informando erro.
        System.out.println("Erro de conversão 'string to Double', verifique os números inseridos!");
        System.exit(1);
      }

      // calcula as duas médias parciais que serão utilizadas para compor o conceito
      // final.
      Double ParcialA = (((A1 * 2) + (A2 * 4)) / 6);
      Double ParcialE = (E1 * E2 * E3 * E4 * E5);

      double ParcialESqrt = 0;
      if (ParcialE != 0) {
        ParcialESqrt = (double) Math.pow(ParcialE, (1.0 / 5));
      }

      System.out.println("O conceito final do aluno é: " + ((ParcialA * 0.9) + (ParcialESqrt * 0.1)));

    } else {
      System.out.println("Por favor, insira 5 (cinco) argumentos de linha de comando!");
      System.out.println("A sequencia de inserção deve ser: A1, A2, E1, E2, E3, E4 e E5!");
    }

  }

}