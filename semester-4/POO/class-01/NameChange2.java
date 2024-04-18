import java.time.LocalDate;
import java.util.Scanner;

public class NameChange2 {

  public static void main(String[] args) {
    
    // System.out.println("Olá mundo");

    String nome;
    int anoNascimento; 
    int anoAtual = LocalDate.now().getYear();


    System.out.println("Entre com  o seu nome: ");

    Scanner teclado = new Scanner(System.in);

    nome = teclado.nextLine();

    System.out.println("Ano que você nasceu: ");
    anoNascimento = teclado.nextInt();

    // System.out.println("Ano que você está: ");
    // anoAtual = teclado.nextInt();

    int resultado = anoAtual - anoNascimento;

    System.out.println(nome + ", possui " + resultado + " anos.");


  }

}