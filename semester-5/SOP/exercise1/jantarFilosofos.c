// Author: Arthur Cadore e Matheus P. Salazar

// Programa 2: Jantar dos Filósofos

// Escreva um programa implementando o jantar dos filósofos, para um número N genérico de
// filósofos.

// Em seguida, avalie o desempenho das soluções do saleiro (Seção 12.4) e de quebra da
// espera circular (Seção 13.4.1), em função do número de filósofos (varie entre 5 e 1.000
// filósofos). 

// Como critério de desempenho, pode ser usado o percentual de filósofos que conseguem
// comer por segundo.

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

// #define N 8 // número de filósofos e de garfos

sem_t garfo[N]; // semáforos dos garfos

int interador = 10000; // número de filósofos que ainda não comeram;

void medita(int i)
{
    // printf("XXX");
}

void come(int i)
{
    //  printf("XXX\n");

}

void *filosofo(void *arg)
{
    int id = *(int *)arg; // pega o id do filósofo
    int comedor = interador;
    while (comedor > 0)             // loop infinito
    {
        int tentativas = 0;                 // contador de tentativas
        int max_tentativas = 10;            // número máximo de tentativas
        int tempo_maximo = 1;               // tempo máximo de espera entre tentativas (em segundos)

        while (tentativas < max_tentativas) // enquanto não excedeu o número máximo de tentativas
        {
            if (sem_trywait(&garfo[id]) == 0) // tenta pegar o garfo da direita
            {
                if (sem_trywait(&garfo[(id + 1) % N]) == 0) // tenta pegar o garfo da esquerda
                {
                    // se conseguiu pegar os dois garfos, come
                    come(id);
                    sem_post(&garfo[id]);           // solta o garfo da direita
                    sem_post(&garfo[(id + 1) % N]); // solta o garfo da esquerda
                    comedor--;
                    break;
                }
                else // se não conseguiu pegar o garfo da esquerda, solta o garfo da direita
                {
                    sem_post(&garfo[id]);
                }
            }
            tentativas++;                     // incrementa o contador de tentativas
            // sleep(rand() % tempo_maximo + 1); // espera um tempo aleatório antes de tentar novamente

        }
        // se excedeu o número máximo de tentativas, desiste e volta a meditar
        medita(id);
        // printf("comedor == %d\n", co);
    }
}

int main()
{
    pthread_t t[N]; // threads dos filósofos
    int ids[N];     // ids dos filósofos
    for (int i = 0; i < N; i++)
    {
        sem_init(&garfo[i], 0, 1);                      // inicializa o semáforo do garfo com valor 1 (disponível)
        ids[i] = i;                                     // define o id do filósofo
        pthread_create(&t[i], NULL, filosofo, &ids[i]); // cria a thread do filósofo
    }
    for (int i = 0; i < N; i++)
    {
        pthread_join(t[i], NULL); // aguarda as threads terminarem
    }
    return 0;
}