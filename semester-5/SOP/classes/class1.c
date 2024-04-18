// Autor: Arthur Cadore



// Escreva o código das threads de controle, usando semáforos para garantir que os robôs se movam sempre na sequência Bart => Lisa => Maggie => Lisa => Bart => Lisa => Maggie => (sequencia), um robô de cada vez. 
// Use a chamada wait() para esperar que o robô termine o movimento.
// Use a chamada signal() para liberar o próximo robô para se mover.
// Use a chamada lock() para garantir que apenas um robô se mova por vez.


// Bibliotecas

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>

// Variáveis globais

sem_t semaforoLisa;
sem_t semaforoBart;
sem_t semaforoMaggie;

void *move_bart(void *arg) {
    sem_wait(&semaforoBart);
    printf("movimento Bart\n");
    sem_post(&semaforoLisa);
    return NULL;
}

void *move_lisa(void *arg) {
    sem_wait(&semaforoLisa);

    int escalonado = 0;

    printf("movimento Lisa\n");

    if(escalonado == 0){
        sem_post(&semaforoMaggie);
        escalonado = 1;
    }
    else{
        sem_post(&semaforoBart);
        escalonado = 0;
    }
    return NULL;
}

void *move_maggie(void *arg) {
    sem_wait(&semaforoMaggie);
    printf("movimento Maggie\n");
    sem_post(&semaforoLisa);
    return NULL;
}

int main (int argc, char *argv[]) {

    sem_init(&semaforoLisa, 0, 0);
    sem_init(&semaforoBart, 0, 1);
    sem_init(&semaforoMaggie, 0, 0);

    pthread_t thread_bart;
    pthread_t thread_lisa;
    pthread_t thread_maggie;

    pthread_create(&thread_bart, NULL, move_bart, NULL);
    pthread_create(&thread_lisa, NULL, move_lisa, NULL);
    pthread_create(&thread_maggie, NULL, move_maggie, NULL);

    while(1){
    pthread_join(thread_bart, NULL);
    pthread_join(thread_lisa, NULL);
    pthread_join(thread_maggie, NULL);
    }
    return 0;
}



