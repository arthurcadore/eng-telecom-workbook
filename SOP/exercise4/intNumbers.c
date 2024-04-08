/*
  Código:  Impressão de números inteiros com duas threads.
  Alunos: Arthur Cadore e Matheus Salazar
*/

// inclusão de bibliotecas
#include <stdio.h>
#include <stdlib.h>
#include <ucontext.h>

// tamanho da pilha de cada tarefa
#define STACKSIZE 32768 
// número de repetições de cada tarefa
#define LACOREPETICAO 100

// definição de variáveis globais
ucontext_t cImpar, cPar, cMain;

// função de impressão "impar"
void f_impar(void *arg)
{
    // variável "i" de controle do laço
    int i;
    // impressão utilizada no inicio da tarefa
    printf("%s Iniciada\n", (char *)arg);

    // laço de repetição utilizado para imprimir "impar" e inverter o contexto
    for (i = 1; i <= LACOREPETICAO; i++)
    {
        // verifica se o número é impar
        if (i % 2 == 1)
        {
           // imprime o número
            printf("\t%d\n", i);
        }
        // inverte o contexto
        swapcontext(&cPar, &cImpar);
    }

    // impressão utilizada no final da tarefa
    printf("%s FIM\n", (char *)arg);

    // inverte o contexto para a tarefa principal
    swapcontext(&cPar, &cMain);
}

void f_par(void *arg)
{
    // variável "i" de controle do laço
    int i;
    // impressão utilizada no inicio da tarefa
    printf("\t\t%s Iniciada\n", (char *)arg);

    // laço de repetição utilizado para imprimir "par" e inverter o contexto
    for (i = 1; i <= LACOREPETICAO; i++)
    {
        // verifica se o número é par
        if (i % 2 == 0)
        {
            // imprime o número
            printf("\t\t\t%d\n", i);
        }
        // inverte o contexto
        swapcontext(&cImpar, &cPar);
    }

    // impressão utilizada no final da tarefa
    printf("\t\t%s FIM\n", (char *)arg);

    //  inverte o contexto para a tarefa principal
    swapcontext(&cImpar, &cMain);
}

int main(int argc, char *argv[])
{
    // variável "stack" utilizada para alocar a pilha
    char *stack;
    printf("Main INICIO\n");

    // Criação da tarefa "Impar": 
    getcontext(&cImpar);

    // alocação da pilha para a tarefa "Impar"
    stack = malloc(STACKSIZE);

    //  verifica se a pilha foi alocada
    if (stack)
    {
      // Atribuição da pilha para a tarefa "Impar"
        cImpar.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa "Impar"
        cImpar.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa "Impar"
        cImpar.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa "Impar"
        cImpar.uc_link = 0;
    }
    else
    {
        perror("Erro na criação da pilha: ");
        exit(1);
    }

    // criação do contexto para a tarefa "Impar"
    makecontext(&cImpar, (void *)(*f_par), 1, "\tPar");

    // cria a tarefa "par"
    getcontext(&cPar);

    // alocação da pilha para a tarefa "Par"
    stack = malloc(STACKSIZE);
    if (stack)
    {
      // Atribuição da pilha para a tarefa "Par"
        cPar.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa "Par"
        cPar.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa "Par"
        cPar.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa "Par"
        cPar.uc_link = 0;
    }
    else
    {
        perror("Erro na criação da pilha: ");
        exit(1);
    }

    // criação do contexto para a tarefa "Par"
    makecontext(&cPar, (void *)(*f_impar), 1, "\tImpar");

    // inicia a tarefa "Impar"
    swapcontext(&cMain, &cPar);
    // inicia a tarefa "Par"
    swapcontext(&cMain, &cImpar);
    printf("Main FIM\n");
    exit(0);
}