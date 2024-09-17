import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Cafeteira {


    public static void escreve(List<List<String>> linhas, String filename) {
        try {
            FileWriter arquivo = new FileWriter(filename, true);
            for (List<String> elem : linhas) {
                arquivo.append(String.join(",", elem));
                arquivo.append("\n");
            }
            // imprimir o conteúdo da lista no terminal: 
            for (List<String> elem : linhas) {
                System.out.println(String.join(",", elem));
            }
            arquivo.flush();
            arquivo.close();

        } catch(IOException e) {
            e.printStackTrace();;
        }
    }

    public static ArrayList<ArrayList<String>> le(String pathname) {
        ArrayList<ArrayList<String>> linhas = new ArrayList<ArrayList<String>>(0);
        try {
            File entrada = new File(pathname);
            Scanner linha = new Scanner(entrada);

            while (linha.hasNext()) {
                String[] registro = linha.nextLine().split(",");

                ArrayList<String> list = new ArrayList<>(Arrays.asList(registro));
                linhas.add(list);
            }
        } catch(FileNotFoundException e) {
            e.printStackTrace();;
        }

        return linhas;
    }

    public static void main(String[] args) {
        System.out.println("Cafeteira System");

        boolean continua = true;
        int opcao = 0;
        int id = 0;

        Scanner in = new Scanner(System.in);

      //  List<List<String>> linhas = new ArrayList<>();
      //  linhas.add(Arrays.asList("123", "juca", "arthur@email"));
      //  escreve(linhas, "/app/usuarios.csv");

        while(continua) {
            System.out.println("================");
            System.out.println("Digite 1: Para informações de usuário");
            System.out.println("Digite 2: Para histórico de cafés");
            System.out.println("Digite 3: Para informações da cafeteira");
            System.out.println("Digite 4: Para sair");
            System.out.print("Sua opção: ");
            opcao = in.nextInt();

            if(opcao == 1) {
                System.out.print("Entre com o id do usuário: ");
                id = in.nextInt();
                System.out.println("\tId " + id + " selecionado para informações de usuário");
                
                ArrayList<ArrayList<String>>  linhas = le("usuarios.csv");
                // imprime todas as linhas do arquivo: 
                for (ArrayList<String> elem : linhas) {
                    System.out.println(String.join(",", elem));
                }

            }else if(opcao == 2) {
                System.out.print("Entre com o id do usuário: ");
                id = in.nextInt();
                System.out.println("\tId " + id + " selecionado para histórico de cafés");

                ArrayList<ArrayList<String>>  linhas = le("usuarios.csv");
                // imprime todas as linhas do arquivo: 
                for (ArrayList<String> elem : linhas) {
                    System.out.println(String.join(",", elem));
                }
            }else if(opcao == 3) {
                System.out.println("Informações da cafeteira:");
                System.out.println("\tÓtima cafeteira");
            }else if(opcao == 4) {
                continua = false;
            }
        }
    }
}