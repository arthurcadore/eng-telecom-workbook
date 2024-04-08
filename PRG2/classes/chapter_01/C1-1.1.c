#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void comparacao(int bar, int ter) {
    if ((bar == 3) && (ter == 3)) printf("Tempo bom, ventos quentes e secos\n");
    if ((bar == 3) && (ter == 2))
        printf("Tempo bom, ventos de leste frescos\n");
    if ((bar == 3) && (ter == 1))
        printf("Tempo bom, ventos de sul a sudeste\n");
    if ((bar == 2) && (ter == 3))
        printf("Tempo mudando para bom, ventos de leste\n");
    if ((bar == 2) && (ter == 2)) printf("Tempo incerto, ventos variaveis\n");
    if ((bar == 2) && (ter == 1))
        printf("Chuva provavel, ventos de sul a sudeste\n");
    if ((bar == 1) && (ter == 3))
        printf("Tempo instavel, aproximacao de frente\n");
    if ((bar == 1) && (ter == 2))
        printf("Frente quente com chuvas provaveis\n");
    if ((bar == 1) && (ter == 1))
        printf("Chuvas abundantes e ventos de sul a sudeste fortes\n");
}

int main() {
    int retornoBar, retornoTer;

    char barometro[20], termometro[20];

    do {
        printf("Por favor, insira o valor do barômetro:  \n");
        scanf("%s", barometro);

        if (!strcmp(barometro, "baixando"))
            retornoBar = 1;

        else if (!strcmp(barometro, "estacionario"))
            retornoBar = 2;

        else if (!strcmp(barometro, "subindo"))
            retornoBar = 3;

        else {
            retornoBar = 4;
            printf("\n Entrada inválida, insira o valor novamente!\n");
        }

    } while (retornoBar == 4);

    do {
        printf("Por favor, insira o valor do termometro:  \n");
        scanf("%s", termometro);

        if (!strcmp(termometro, "baixando"))
            retornoBar = 1;

        else if (!strcmp(termometro, "estacionario"))
            retornoBar = 2;

        else if (!strcmp(termometro, "subindo"))
            retornoBar = 3;

        else {
            retornoBar = 4;
            printf("\n Entrada inválida, insira o valor novamente!\n");
        }

    } while (retornoBar == 4);

    comparacao(retornoBar, retornoTer);

    return 0;
}