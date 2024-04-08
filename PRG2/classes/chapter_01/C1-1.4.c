#include <stdio.h>
#include <string.h>

int calcValor(int inputMaior, int inputMenor) {
    int calc_output = 0;

    calc_output = (inputMaior + inputMenor) / 2;

    return calc_output;
}

int main() {
    int minimo = 1, maximo = 100, output = 50, cont = 1, contMenos = 1,
        contMais = 1;

    char input[2];

    printf("Programa iniciado!\n");

    printf("O número é igual a %d? Se não, é maior ou menor?\n", output);
    scanf("%s", input);

    do {
        if (!strcmp(input, "=")) {
            printf("Valor encontrado, programa finalizado!\n");
            break;
        }
        if (!strcmp(input, "+")) {
            minimo = output + 1;
            output = calcValor(maximo, minimo);

        } else if (!strcmp(input, "-")) {
            maximo = output - 1;
            output = calcValor(maximo, minimo);

        } else {
            printf("\n Entrada inválida, insira o valor novamente!\n");
        }

        printf("O número é igual a %d? Se não, é maior ou menor?\n", output);
        scanf("%s", input);
        cont++;
    } while (strcmp(input, "="));
    printf("Valor encontrado após %d tentativas, programa finalizado!\n", cont);

    return 0;
}