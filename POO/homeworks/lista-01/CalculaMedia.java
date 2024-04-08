public class CalculaMedia {

  public static void main(String[] args) {

    // Verifica se há sete argumentos de linha de comando (caso contrário, não
    // executa o código).Para a atividade, é necessário exatamente este valor.
    if (args.length == 7) {

      double A1 = 0;
      double A2 = 0;
      double E1 = 0;
      double E2 = 0;
      double E3 = 0;
      double E4 = 0;
      double E5 = 0;

      // Tenta realizar a conversão de string para double (valores reais)
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
        // Finaliza o programa informando erro de conversão.
        System.out.println("Erro de conversão 'string to Double', verifique os números inseridos!");
        System.exit(1);
      }

      // calcula as duas notas parciais que serão utilizadas para compor o conceito
      // final.
      Double ParcialA = (((A1 * 2) + (A2 * 4)) / 6);
      Double ParcialE = (E1 * E2 * E3 * E4 * E5);

      // verifica se o produto é diferente de 0, caso não seja, não é necessário
      // realizar outra operação
      if (ParcialE != 0) {

        // caso seja diferente de 0, realiza a operação de media geométrica com o
        // produto ja calculado.
        double ParcialESqrt = (double) Math.pow(ParcialE, (1.0 / 5));
        ParcialE = ParcialESqrt;
      }

      // realiza o calculo do conceito final.
      double CF = ((ParcialA * 0.9) + (ParcialE * 0.1));

      // valida a situação do aluno e imprime-a com sua nota.
      if (CF >= 6) {
        System.out.println(CF + " APROVADO");

      } else {
        System.out.println(CF + " REPROVADO");

      }

    } else {
      System.out.println("Por favor, insira 7 (sete) argumentos de linha de comando!");
      System.out.println("A sequencia de inserção deve ser: A1, A2, E1, E2, E3, E4 e E5!");
    }

  }

}