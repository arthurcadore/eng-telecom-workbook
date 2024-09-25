#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Implementação de dados de 'Cafeteira' em CSV ",
  subtitle: "Banco de Dados",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "24 de Setembro de 2024",
  doc,
)

= Objetivo

O objetivo desta tarefa é apresentar um sistema de gerenciamento de dados de uma cafeteira, onde o sistema deve ser capaz de armazenar informações de usuários e histórico de cafés em arquivos CSV.

= Desenvolvimento: 

O sistema foi desenvolvido em Java, e é composto por duas funções principais: `escreve` e `le`. A função `escreve` é responsável por escrever uma lista de listas de strings em um arquivo CSV, enquanto a função `le` é responsável por ler um arquivo CSV e retornar uma lista de listas de strings. 

Abaixo está o código .java modificado durante a aula de BDC: 

#sourcecode[```java
// BDC - Homework 1
// Aluno: Arthur Cadore M. Barcella
// Importando as bibliotecas necessárias
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

// Classe Cafeteira
public class Cafeteira {

    /* Método escreve
     * Escreve uma lista de listas de strings em um arquivo CSV
     * @param linhas: lista de listas de strings
     * @param filename: nome do arquivo
     */
    
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

    /* Método le
     * Lê um arquivo CSV e retorna uma lista de listas de strings
     * @param pathname: caminho do arquivo
     * @return linhas: lista de listas de strings
     */

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

    /* Método main
     * Função principal do programa
     * @param args: argumentos da linha de comando
     */
    public static void main(String[] args) {

        System.out.println("Cafeteira System");

        // Inicializando variáveis
        boolean continua = true;
        int opcao = 0;
        int id = 0;

        // Inicializando o scanner
        Scanner in = new Scanner(System.in);

        while(continua) {

            // Menu de opções
            System.out.println("================");
            System.out.println("Digite 1: Para informações de usuário");
            System.out.println("Digite 2: Para histórico de cafés");
            System.out.println("Digite 3: Para informações da cafeteira");
            System.out.println("Digite 4: Para sair");
            System.out.print("Sua opção: ");
            opcao = in.nextInt();

            // Laço de verifição de opções
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
```]

O código acima pode consultar e imprimir os dados de usuários e histórico de cafés armazenados em arquivos CSV, conforme apresentado abaixo: 

#sourcecode[```csv
123,juca,arthur@email
124,maria,maria@email
125,joao,joao@email
```]

