/*
  Objetivo: Criar um programa que crie uma fila de mensagens usando a chamada de sistema msgget, o programa deve bifurcar em dois processos, um processo pai e um processo filho, o processo filho deve enviar uma mensagem para a fila de mensagens usando a chamada msgsnd(), e o processo pai deve ler a mensagem da fila de mensagens usando a chamada msgrcv() e exibir na tela.
  Alunos: Arthur Cadore e Matheus Salazar
  Para compilar: g++ message_queue.cpp -lrt -o message_queue
*/

// Inclusão de bibliotecas
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/stat.h> 
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>

#include <mqueue.h>

// #include <iostream>
// #include <list> 
// #include <string>
// #include <unordered_set>
// #include <fstream>

#define QUEUE_NAME "/my_queue"

using namespace std;

// Função principal

int main(int argc, char* argv[]) {

    // Declaração de variáveis
    
    pid_t pid;
    mqd_t queue;
    struct mq_attr attr;
    const int STRSIZE = 14;
    char buffer[STRSIZE] = "Hello World!\n";

    // definição do tamanho máximo da fila de mensagens
    attr.mq_maxmsg = 10;
    attr.mq_msgsize = STRSIZE;
    attr.mq_flags = 0;

    // Criação do processo filho
    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }

    // Processo filho

    if (pid == 0) {
        
        // abre a fila de mensagens se existir, se não existir cria uma: 
          if ((queue = mq_open(QUEUE_NAME, O_RDWR, 0666, &attr)) < 0) {
            perror("mq_open");
            exit(1);
          }

        for(;;){

        // Leitura do teclado

        // printf("Processo Filho: ");
        // fgets(buffer, 100, stdin);

          // envia a mensagem lida do teclado para a fila de mensagens

          if (mq_send(queue, buffer, STRSIZE, 0) < 0) {
              perror("mq_send");
              exit(1);
          }
          
        }

    // Processo pai
    } else {

        // abre a fila de mensagens se existir, se não existir cria uma: 
        if ((queue = mq_open(QUEUE_NAME, O_RDWR | O_CREAT, 0666, &attr)) < 0) {
            perror("mq_open");
            exit(1);
        }

        for(;;){

          // recebe a mensagem da fila de mensagens
          if ((mq_receive(queue, buffer, STRSIZE, 0)) < 0) {
              perror("mq_receive");
              exit(1);
          }

          // Exibe a mensagem na tela
          printf("Processo Pai: %s", buffer);

        }
    }

    return 0;

}
