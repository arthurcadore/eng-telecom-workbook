// Author: Arthur Cadore e Matheus P. Salazar

// Programa 1: Leitores e Escritores
// Na aula foi apresentada uma implementação do problema dos Leitores com priorização dos leitores.
// Agora, implemente uma solução em C para o problema dos leitores/escritores com
// priorização para escritores, usando threads e rwlocks POSIX.

// BUILDING
// gcc leitorEscritor.c -o leitorEscritor -lpthread

// RUNNING
// ./readersAndWriters <number of readers> <number of writers>

// Bibliotheques

#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define NUM_LEITORES 3
#define NUM_ESCRITORES 2

// Semáforos
sem_t mutex;          // semáforo binário para proteger a seção crítica
sem_t escritor;       // semáforo para permitir acesso exclusivo aos escritores
int num_leitores = 0; // contador de leitores na seção crítica

void *leitor(void *arg)
{
  while (1)
  {
    // Bloqueia o semáforo mutex para garantir exclusão mútua na leitura do contador de leitores
    sem_wait(&mutex);

    // Incrementa o contador de leitores
    num_leitores++;

    // Se este é o primeiro leitor, bloqueia o semáforo escritor para impedir que escritores acessem a seção crítica
    if (num_leitores == 1)
    {
      sem_wait(&escritor);
    }

    // Libera o semáforo mutex para permitir que outros leitores leiam o contador
    sem_post(&mutex);

    // Realiza a leitura da seção crítica
    printf("Leitor lendo...\n");

    // Bloqueia o semáforo mutex novamente para garantir exclusão mútua na leitura do contador de leitores
    sem_wait(&mutex);

    // Decrementa o contador de leitores
    num_leitores--;

    // Se este é o último leitor, libera o semáforo escritor para permitir que os escritores acessem a seção crítica
    if (num_leitores == 0)
    {
      sem_post(&escritor);
    }

    // Libera o semáforo mutex para permitir que outros leitores leiam o contador
    sem_post(&mutex);

    sleep(5); // Aguarda por 5 segundos antes de tentar acessar novamente a seção crítica
  }
  return NULL;
}

void *escritores(void *arg)
{
  while (1)
  {
    // Bloqueia o semáforo escritor para garantir exclusão mútua na escrita da seção crítica
    sem_wait(&escritor);

    // Realiza a escrita na seção crítica
    printf("        Escritor escrevendo...\n");

    // Libera o semáforo escritor para permitir que outros escritores escrevam na seção crítica
    sem_post(&escritor);

    sleep(3); // Aguarda por 3 segundos antes de tentar acessar novamente a seção crítica
  }
  return NULL;
}

int main()
{
  sem_init(&mutex, 0, 1);
  sem_init(&escritor, 0, 1);

  pthread_t threads[NUM_LEITORES + NUM_ESCRITORES];
  for (int i = 0; i < NUM_LEITORES + NUM_ESCRITORES; i++)
  {
    if (i < NUM_LEITORES)
    {
      pthread_create(&threads[i], NULL, leitor, NULL);
    }
    else
    {
      pthread_create(&threads[i], NULL, escritores, NULL);
    }
  }

  for (int i = 0; i < NUM_LEITORES + NUM_ESCRITORES; i++)
  {
    pthread_join(threads[i], NULL);
  }
  return 0;
}