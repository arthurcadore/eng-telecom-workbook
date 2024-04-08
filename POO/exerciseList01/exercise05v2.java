public class exercise04v2 {

  public static void main(String[] args) {

    // verifica se há um argumentos de linha de comando.
    if (args.length > 0) {

      // Armazena o argumento de linha de comando em uma string de referência.
      String registrationString = args[0];

      Long registrationNumber = Long.parseLong(registrationString);

      // verifica se a string de referência possui o tamanho esperado.
      if (registrationString.length() == 10) {

        // ==================================================================

        // define variáveis para loop de cálculo.
        long somatory = 0;
        int Mutiplicator = 10;

        // varre as posições da matricula realizando o somatório.
        for (int i = 0; i < registrationString.length() - 1; i++) {

          // coleta o dígito correspondente a posição através de substring.
          String dString = registrationString.substring(i, (i + 1));

          // converte o dígito para inteiro e realiza o somatório do ciclo.
          int dNUmber = Integer.parseInt(dString);
          somatory += (dNUmber * Mutiplicator);

          // decrementa o fator mutiplicador a cada ciclo.
          Mutiplicator--;
        }

        // Realiza a multiplicação de 10x conforme a formula.
        somatory = somatory * 10;

        // Realiza a coleta do dígito verificador na matricula passada.
        String VerifyString = registrationString.substring(9, 10);
        Long VerifyNumber = Long.parseLong(VerifyString);

        // compara o verificador calculado com o obtido da matricula.
        if (somatory % 11 == VerifyNumber) {
          System.out.println("A matricula é verdadeira (verificador está correto)!");

          // caso a comparação entre os verificadores esteja incorreta, executa esta
          // condindição.
        } else {

          System.out.println("A matricula é falsa (verificador está incorreto):");
          System.out.println("");
          System.out.println("Digito verificador coletado: " + VerifyNumber);
          System.out.println("Digito verificador calculado: " + (somatory % 11));

        }

        // ==================================================================

        // Caso esteja faltando/sobrando digitos na matricula, executa esta condição.
      } else {
        System.out.println("Comprimento da matricula incorreto, verifique o número novamente!");
      }

      // caso não seja passado argumento(s), executa nessa condição.
    } else {
      System.out.println("Por favor, insira um argumento de linha de comando!");
    }

  }
}
