/*
  Objetivo: Crie um programa em C/C++ que crie um segmento de memória compartilhada usando a chamada de sistema shmget().
O programa deve, em seguida, bifurcar em dois processos: um processo pai e um processo filho.
O processo filho deve escrever uma mensagem na memória compartilhada usando a chamada de sistema shmat().
O processo pai deve ler a mensagem da memória compartilhada usando a chamada de sistema shmat().
O processo pai deve então imprimir a mensagem no console.

  Alunos: Arthur Cadore e Matheus Salazar
  Para compilar: g++ -o memory_shared memory_shared.cpp -lrt
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
#include <sys/shm.h>
#include <sys/mman.h>
#include <mqueue.h>
#include <iostream>
#include <list>
#include <string>
#include <unordered_set>
#include <fstream>

using namespace std;

// Função principal

int main(int argc, char* argv[]) {

    // Declaração de variáveis

    pid_t pid;
    int shm_fd;
    char *ptr;
    char *msg = "Hello World!";

    // Criação do processo filho

    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }

    // Processo filho

    if (pid == 0) {
        // Criação do segmento de memória compartilhada
        shm_fd = shm_open("shm", O_CREAT | O_RDWR, 0666);
        ftruncate(shm_fd, 4096);
        ptr = (char *)mmap(0, 4096, PROT_WRITE, MAP_SHARED, shm_fd, 0);
        sprintf(ptr, "%s", msg);
        ptr += strlen(msg);
    }

    // Processo pai

    else {
        wait(NULL);
        shm_fd = shm_open("shm", O_RDONLY, 0666);
        ptr = (char *)mmap(0, 4096, PROT_READ, MAP_SHARED, shm_fd, 0);
        printf("%s", ptr);
        shm_unlink("shm");
    }

    return 0;
}