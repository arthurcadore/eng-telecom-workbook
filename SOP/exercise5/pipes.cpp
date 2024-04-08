/*
  Objetivo: Criar um programa capaz de realizar a comunicação entre processos usando pipes, escrevendo uma string que será enviada entre os processos e lida por um dos processos, que por sua vez, será enviada para o outro processo, que por sua vez, será lida e exibida na tela.
  Alunos: Arthur Cadore e Matheus Salazar
    Para compilar: g++ -o pipes pipes.cpp
*/


// Inclusão de bibliotecas
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>


#include <iostream>
#include <list> 
#include <string>
#include <unordered_set>
#include <fstream>

using namespace std;

// Função principal

int main(int argc, char* argv[]) {

    // Declaração de variáveis

    int fd[2];
    pid_t pid;

    // Criação do pipe

    if (pipe(fd) < 0) {
        perror("pipe");
        exit(1);
    }

    // Criação do processo filho

    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }

    // Processo filho

    if (!(pid == 0)) {
        // Fecha a extremidade de escrita do pipe

        close(fd[1]);

        // Declaração de variáveis

        char buffer[100];
        int n;

        // Leitura do pipe

        n = read(fd[0], buffer, 100);
        buffer[n] = '\0';

        // Exibição do conteúdo lido

        printf("Processo Pai: %s", buffer);

        // Fecha a extremidade de leitura do pipe

        close(fd[0]);


    // Processo pai
    } else if(pid == 0){

        // Fecha a extremidade de leitura do pipe

        close(fd[0]);

        // Declaração de variáveis

        char buffer[100];

        // Leitura do teclado

        printf("Processo Filho: ");
        fgets(buffer, 100, stdin);

        // Escrita no pipe

        write(fd[1], buffer, strlen(buffer));

        // Fecha a extremidade de escrita do pipe

        close(fd[1]);

        // Espera o processo filho terminar

        wait(NULL);
    }

    return 0;

}