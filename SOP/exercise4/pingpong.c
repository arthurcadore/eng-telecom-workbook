/*
  Código: Impressão de "Ping Pong" com duas threads.
  Alunos: Arthur Cadore e Matheus Salazar
*/

// inclusão de bibliotecas
#include <stdio.h>
#include <stdlib.h>
#include <ucontext.h>

// tamanho da pilha de cada tarefa
#define STACKSIZE 32768		

// definição de variáveis globais
ucontext_t cPing, cPong, cMain;

// função de impressão "ping"
void f_ping(void * arg) {

   // variável "i" de controle do laço
   int i;

   // impressão utilizada no inicio da tarefa
   printf("%s iniciada\n", (char *) arg);

   // laço de repetição utilizado para imprimir "ping" e inverter o contexto
   for (i=0; i<4; i++) {
      printf("%s %d\n", (char *) arg, i);
      swapcontext(&cPing, &cPong);
   }

   // impressão utilizada no final da tarefa
   printf("%s FIM\n", (char *) arg);

   // inverte o contexto para a tarefa principal
   swapcontext(&cPing, &cMain);
}

// função de impressão "pong"S
void f_pong(void * arg) {

   // variável "i" de controle do laço
   int i;

   // impressão utilizada no inicio da tarefa
   printf("%s iniciada\n", (char *) arg);

   // laço de repetição utilizado para imprimir "pong" e inverter o contexto
   for (i=0; i<4; i++) {
      printf("%s %d\n", (char *) arg, i);
      swapcontext(&cPong, &cPing);
   }

   // impressão utilizada no final da tarefa
   printf("%s FIM\n", (char *) arg);

   // inverte o contexto para a tarefa principal
   swapcontext(&cPong, &cMain);
}

// função principal
int main(int argc, char *argv[]) {

   // variável "stack" utilizada para alocar a pilha de cada tarefa
   char *stack;
   printf ("Main INICIO\n");

   // criação da tarefa "ping"
   getcontext(&cPing);

   // alocação da pilha para a tarefa "ping"
   stack = malloc(STACKSIZE);

   // verificação de erro na alocação da pilha 
   if(stack) {

      // Atribuição da pilha para a tarefa "Ping"
        cPing.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa "Ping"
        cPing.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa "Ping"
        cPing.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa "Ping"
        cPing.uc_link = 0;
   }
   else {
      perror("Erro na criação da pilha: ");
      exit(1);
   }

   // criação do contexto para a tarefa "ping"
   makecontext(&cPing, (void*)(*f_ping), 1, "\tPing");

   // criação da tarefa "pong"
   getcontext(&cPong);

   // alocação da pilha para a tarefa "pong"
   stack = malloc(STACKSIZE);

   // verificação de erro na alocação da pilha
   if(stack) {
       // Atribuição da pilha para a tarefa Pong
        cPong.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa Pong
        cPong.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa Pong
        cPong.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa Pong
        cPong.uc_link = 0;
   }
   else {
      perror("Erro na criação da pilha: ");
      exit(1);
   }

   // criação do contexto para a tarefa "pong"
   makecontext (&cPong, (void*)(*f_pong), 1, "\tPong");

   // inverte o contexto para a tarefa "ping"
   swapcontext(&cMain, &cPing);
   // inverte o contexto para a tarefa "pong"
   swapcontext(&cMain, &cPong);

   printf("Main FIM\n");

   exit(0);
}

