/*
  Código:  Impressão de "Hello World" com duas threads. 
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
ucontext_t cHello, cWorld, cMain;

// função de impressão "hello"
void f_hello(void *arg)
{
  // variável "i" de controle do laço
    int i;

    // impressão utilizada no inicio da tarefa
    printf("%s Iniciada\n\n", (char *)arg);

    // laço de repetição utilizado para imprimir "hello" e inverter o contexto
    for (i = 0; i < LACOREPETICAO; i++)
    {
        printf("\thello\n");
        swapcontext(&cHello, &cWorld);
    }

    // impressão utilizada no final da tarefa
    printf("%s FIM\n", (char *)arg);

    // inverte o contexto para a tarefa principal
    swapcontext(&cHello, &cMain);
}


// função de impressão "world"
void f_world(void *arg)
{

    //  variável "i" de controle do laço
    int i;
    
    //  impressão utilizada no inicio da tarefa
    printf("\t\t%s Iniciada\n\n", (char *)arg);

    //  laço de repetição utilizado para imprimir "world" e inverter o contexto
    for (i = 0; i < LACOREPETICAO; i++)
    {
        printf("\t\t\tworld\n");
        swapcontext(&cWorld, &cHello);
    }

    // impressão utilizada no final da tarefa
    printf("\t\t%s FIM\n", (char *)arg);

    // inverte o contexto para a tarefa principal
    swapcontext(&cWorld, &cMain);
}

// Função principal do programa
int main(int argc, char *argv[])
{
    // Variável "stack" utilizada para alocar a pilha de cada tarefa
    char *stack;
    printf("Main INICIO\n\n");

    // Criação da tarefa "hello": 
    getcontext(&cHello);

    // Alocação da pilha para a tarefa "hello"
    stack = malloc(STACKSIZE);

    // Verificação de erro na alocação da pilha
    if (stack)
    {
      // Atribuição da pilha para a tarefa "hello"
        cHello.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa "hello"
        cHello.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa "hello"
        cHello.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa "hello"
        cHello.uc_link = 0;
    }
    else
    {
        perror("Erro na criação da pilha: ");
        exit(1);
    }

    // Criação do contexto para a tarefa "hello"
    makecontext(&cHello, (void *)(*f_hello), 1, "\tHello");

    // Criação da tarefa "world": 
    getcontext(&cWorld);

    // Alocação da pilha para a tarefa "world"
    stack = malloc(STACKSIZE);

    // Verificação de erro na alocação da pilha
    if (stack)
    {
      // Atribuição da pilha para a tarefa "world"
        cWorld.uc_stack.ss_sp = stack;
      // Atribuição do tamanho da pilha para a tarefa "world"
        cWorld.uc_stack.ss_size = STACKSIZE;
      // Atribuição de flags para a tarefa "world"
        cWorld.uc_stack.ss_flags = 0;
      // Atribuição do contexto de retorno para a tarefa "world"
        cWorld.uc_link = 0;
    }
    else
    {
        perror("Erro na criação da pilha: ");
        exit(1);
    }

    // Criação do contexto para a tarefa "world"
    makecontext(&cWorld, (void *)(*f_world), 1, "\tWorld");

    // Altera o contexto para a tarefa "hello"
    swapcontext(&cMain, &cHello);
    // Altera o contexto para a tarefa "world"
    swapcontext(&cMain, &cWorld);
    printf("Main FIM\n");
    exit(0);
}