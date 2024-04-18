#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

// #define N 5 // Número de filósofos

#define LEFT (i + N - 1) % N // Filósofo à esquerda de i
#define RIGHT (i + 1) % N // Filósofo à direita de i

sem_t mutex; // Semáforo para exclusão mútua
sem_t s[N]; // Semáforos para garfos
sem_t saleiro; // Semáforo para controle do saleiro

void *filosofo(void *arg) {

    int i = *(int *) arg;
    int contador = 10000;
    while (contador > 0) {
        // printf("Filósofo %d está pensando...\n", i);

        
        sem_wait(&saleiro); // Pegar o saleiro
        sem_wait(&s[LEFT]); // Pegar o garfo à esquerda
        sem_wait(&s[RIGHT]); // Pegar o garfo à direita
        sem_post(&saleiro); // Soltar o saleiro
       

        // printf("            Filósofo %d está comendo...\n", i);
        contador--;
        sem_post(&s[LEFT]); // Soltar o garfo à esquerda
        sem_post(&s[RIGHT]); // Soltar o garfo à direita
    }
}

int main() {
    int i;
    pthread_t tid[N];

    sem_init(&mutex, 0, 1); // Inicializar semáforo de exclusão mútua
    for (i = 0; i < N; i++)
        sem_init(&s[i], 0, 1); // Inicializar semáforos de garfos
    sem_init(&saleiro, 0, N-1); // Inicializar semáforo do saleiro

    for (i = 0; i < N; i++)
        pthread_create(&tid[i], NULL, filosofo, &i); // Criar threads para os filósofos

    for (i = 0; i < N; i++)
        pthread_join(tid[i], NULL); // Esperar as threads terminarem

    return 0;
}