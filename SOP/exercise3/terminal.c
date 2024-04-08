/*
  Código terminal para Linux 

  Alunos: Arthur Cadore e Matheus Salazar

*/

// inclusão de bibliotecas
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

// definido um tamanho máximo para a string de hostname e comando
int HOST_NAME_MAX = 6400;
int COMANDO_MAX = 100;

int main(int argc, char *argv[], char *envp[])
{
    //pegar processo do pai e armazenar em int:
    int pidPAI = getpid();

    // pegar nome do usuário e armazenar em string:
    char *user = getlogin();

    // pegar nome da máquina e armazenar em string:
    char hostname[HOST_NAME_MAX];
    gethostname(hostname, HOST_NAME_MAX);


// loop infinito
  while(1){

    // imprimir o propmt:
    printf("%s@%s# ", user, hostname);

    // receber comando através de entrada padrão:
       char comando[COMANDO_MAX];
       scanf("%s", comando);

    // verifica se no final da string tem um "&":
    int i = 0;
    int testador = 0;
    while(comando[i] != '\0'){
        i++;
    }
    if(comando[i-1] == '&'){
      testador = 1;
      comando[i-1] = '\0';
    }

    // cria um processo filho:
    int pid = fork();
    int status;

    // se o processo for pai:
    if(!(pid==0)){
      // se o testador for falso, força o processo pai a aguardar o retorno do filho: 
       if(testador==0){
      wait(&status);
    }
    }
     
    // se o processo filho for criado com sucesso:
    if(pid==0){
        execvp(comando, argv);
        perror("exec falhou!");
        exit(0);
    }
  }
}