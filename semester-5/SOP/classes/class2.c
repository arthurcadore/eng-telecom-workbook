// Author: Arthur Cadore (github.com/arthurcadore).

// bibliotecas
#include <stdio.h>
#include <pthread.h>
#include <semaphore.h>

// semáforos para sincronização: 
sem_t sem1, sem2;

// função executada pela thread 1
void* thread1(void* arg) {

    // imprime mensagem de chegada a ponto de sincronização
    printf("Thread 1 chegou ao ponto de sincronização (Rendez-Vous).\n");
    //---------------------------------------------------------------
    
    // semáforo 1 incrementa (libera semáforo 1): Ao liberar o semafaro 1, 
    // a thread 2 que estava aguardando o semáforo 1 é liberada. 
    sem_post(&sem1); 

    // semáforo 2 aguarda (bloqueia semáforo 2): Ao bloquear o semáforo 2,
    // a thread 1 aguarda a liberação do semáforo 2 pela thread 2.
    sem_wait(&sem2); 

    //---------------------------------------------------------------
    // imprime mensagem de saída do ponto de sincronização
    printf("Thread 1 saiu do ponto de sincronização (Rendez-Vous).\n");
    pthread_exit(NULL);
}

// função executada pela thread 2
void* thread2(void* arg) {

    // imprime mensagem de chegada a ponto de sincronização
    printf("Thread 2 chegou ao ponto de sincronização (REndez-Vous) \n");
    //---------------------------------------------------------------

    // semáforo 2 incrementa (libera semáforo 2): Ao liberar o semafaro 2,
    // a thread 1 que estava aguardando o semáforo 2 é liberada.
    sem_post(&sem2); 

    // semáforo 1 aguarda (bloqueia semáforo 1): Ao bloquear o semáforo 1,
    // a thread 2 aguarda a liberação do semáforo 1 pela thread 1.
    sem_wait(&sem1); 

    //---------------------------------------------------------------
    // imprime mensagem de saída do ponto de sincronização
    printf("Thread 2 left Rendez-Vous.\n");

    pthread_exit(NULL);
}

int main() {

  // declaração das threads
    pthread_t process1, process2;

    // inicializa semáforos de sincronização

    // semáforo 1 é inicializado com valor 0, pois a thread 1
    // deve aguardar a thread 2 para liberar o semáforo 1.
    sem_init(&sem1, 0, 0); 

    // semáforo 2 é inicializado com valor 0, pois a thread 2
    // deve aguardar a thread 1 para liberar o semáforo 2.
    sem_init(&sem2, 0, 0); 

    // cria as threads. 
    // parâmetros: 
      // 1. Ponteiro para a thread (process1)
      // 2. Atributos da thread (NULL = padrão)
      // 3. função que a thread deve executar (função thread1)
      // 4. parâmetro da função que a thread deve executar (sem parâmetro)
    pthread_create(&process1, NULL, thread1, NULL);
    pthread_create(&process2, NULL, thread2, NULL);

    // espera as threads terminarem
    pthread_join(process1, NULL);
    pthread_join(process2, NULL);

    return 0;
}


