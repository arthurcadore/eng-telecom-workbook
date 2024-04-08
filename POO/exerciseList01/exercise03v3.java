public class exercise03 {

  public static void main(String[] args) {

    // verifica se há um argumentos de linha de comando.
    if (args.length > 0) {

      // coverte o valor passado para inteiro e então o iguala a variavel
      int matSize = Integer.parseInt(args[0]);

      // cria um loop para varrer as linhas da matriz.
      for (int i = 1; i < matSize + 1; i++) {

        // cria um loop para varrer as colunas da respectiva linha da matriz.
        for (int j = 1; j < matSize + 1; j++) {

          // verifica a condição de divisão exigida (j divisivel por i, vice-versa).
          if (j % i == 0 || i % j == 0) {

            // imprime '*' caso seja verdadeira
            System.out.print("*");
          } else {
            // imprime ' ' casos seja falsa
            System.out.print(" ");
          }
        }
        // avança para a proxima linha da matriz.
        System.out.println("");
      }
      // caso não seja passado argumento(s), executa nessa condição.
    } else {
      System.out.println("Por favor, insira um tamanho para a matriz como argumento!");
    }
  }

}
