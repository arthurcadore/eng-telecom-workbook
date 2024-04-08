// Autor: Arthur Cadore (github.com/arthurcadore)
// Classe: Sistemas Operacionais

// Compilar: gcc test1.c -o test1 -lpthread

// Bibliotecas:
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

// número de processos
#define N 5 

// semáforo para exclusão mútua
sem_t mutex; 

// semáforo para sincronização
sem_t barreira; 

// contador de processos que chegaram à barreira
int count = 0; 

// função executada por cada processo
void *processo(void *identificador) {

     // limpa o mutex;
    sem_init(&mutex, 0, 1);

    // limpa a barreira;
    sem_init(&barreira, 0, 0);

   
    // obtém o identificador de cada processo. 
    int id = *(int*)identificador;

    // imprime o identificador do processo
    printf("Processo %d chegou à barreira.\n", id);
    
    // Início da exclusão mútua
    sem_wait(&mutex); 

    // Espera todos os processos chegarem à barreira
    // para liberar todos os processos.
    count++;
    if (count == N) {

        // libera todos os processos que estão esperando
        // Quando o último processo chegar à barreira. 
        sem_post(&barreira); 
        count==0;
    }

    // fim da exclusão mútua
    sem_post(&mutex); 
    
    // espera pelo último processo
    // para liberar os outros processos
    sem_wait(&barreira); 
    sem_post(&barreira);
    
    // imprime o identificador do processo, após liberar 
    // todos os processos
    printf("Processo %d passou pela barreira.\n", id);
    
}

int main() {

    // vetor de threads, sendo que N é o valor de processos a serem criados
    pthread_t threads[N];

    // vetor de identificadores
    int ids[N];

    // variável auxiliar
    int i;
    
    // inicializa os semáforos

    // mutex = 1, pois o primeiro processo que chegar à barreira deve ser liberado.
    sem_init(&mutex, 0, 1);

    // barreira = 0, pois nenhum processo deve ser liberado.
    // O último processo que chegar à barreira deve liberar todos os processos.
    sem_init(&barreira, 0, 0);
    
    // cria as threads
    // cada thread executa a função processo
    // e recebe como parâmetro o identificador do processo
    while(1){
    for (i = 0; i < N; i++) {

        // atribui o identificador do processo ao vetor de identificadores
        ids[i] = i;

        // cria a thread

        // Parâmetros na criação da thread:
        // 1. Ponteiro para a thread (threads[i])
        // 2. Atributos da thread (NULL = padrão)
        // 3. função que a thread deve executar (função processo)
        // 4. parâmetro da função que a thread deve executar (identificador do processo)

        if (pthread_create(&threads[i], NULL, processo, &ids[i])) {
            printf("Erro ao criar a thread %d.\n", i);
            exit(EXIT_FAILURE);
        }
    }
    }
    // espera as threads terminarem: 
    for (i = 0; i < N; i++) {
        if (pthread_join(threads[i], NULL)) {
            printf("Erro ao esperar pela thread %d.\n", i);
            exit(EXIT_FAILURE);
        }
    }    
    return 0;
}