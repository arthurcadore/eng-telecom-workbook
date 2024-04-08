import java.util.Scanner;

public class ArchiveProcess {

  public static void main(String[] args) {

    // verifica se foi adicionado um argumento de comando.
    if (args.length > 0) {

      // define o scanner "teclado" para captura do texto.
      Scanner teclado = new Scanner(System.in);

      // realiza comparação de duas strings (similar a comparação == em c++)
      if (args[0].equals("filter")) {

        // verifica se foi passado outro argumento de linha de comando, o filtro.
        if (args.length > 1) {

          // entra em loop de coleta verificando se há proximas linhas a coletar
          while (teclado.hasNext()) {

            // variavel auxiliar para receber o conteúdo da proxima linha coletada.
            String linhaCapturada = teclado.nextLine();

            // verifica se a linha recebida contem a substring de filtragem, caso possua é
            // impressa no terminal.
            if (linhaCapturada.contains(args[1])) {

              System.out.println(linhaCapturada);
            }
          }

          // entra neste caso quando não foi informado um argumento de filtragem.
        } else {

          System.out.println("Erro de execução, por favor insira um filtro.");
        }

        // realiza a alteração da string para caixa-alta.
      } else if (args[0].equals("up")) {

        // entra em loop de coleta verificando se há proximas linhas a coletar.
        while (teclado.hasNext()) {

          // imprime as strings recebidas alterando o valor de cada caracter para
          // caixa-alta.
          System.out.println(teclado.nextLine().toUpperCase());

        }

        // realiza a alteração da string para caixa-baixa.
      } else if (args[0].equals("down")) {

        // entra em loop de coleta verificando se há proximas linhas a coletar.
        while (teclado.hasNext()) {

          // imprime as strings recebidas alterando o valor de cada caracter para
          // caixa-baixa.
          System.out.println(teclado.nextLine().toLowerCase());

        }

        // entra neste caso quando o valor do primeiro argumento não é válido.
      } else {

        System.out.println("Erro de execução, argumento inválido.");

      }
      // entra neste caso quando nenhum argumento foi passado.
    } else {

      System.out.println("Erro de execução, por favor insira um argumento.");
    }
  }
}
