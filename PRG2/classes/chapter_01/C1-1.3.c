#include <stdio.h>

void calctroco(float compra, float pagamento) {
    float comprain, pagamentoin, valorInverso, devolucao;

    comprain = compra * 100;

    pagamentoin = pagamento * 100;

    valorInverso = pagamentoin - comprain;

    devolucao = valorInverso / 100;

    printf("Valor de devolução = %f\n", devolucao);

    while (valorInverso >= 20000) {
        printf("Devolver nota de 200\n");
        valorInverso -= 20000;
    }
    while (valorInverso >= 10000) {
        printf("Devolver nota de 100\n");
        valorInverso -= 10000;
    }
    while (valorInverso >= 5000) {
        printf("Devolver nota de 50\n");
        valorInverso -= 5000;
    }
    while (valorInverso >= 2000) {
        printf("Devolver nota de 20\n");
        valorInverso -= 2000;
    }
    while (valorInverso >= 1000) {
        printf("Devolver nota de 10\n");
        valorInverso -= 1000;
    }
    while (valorInverso >= 500) {
        printf("Devolver nota de 5\n");
        valorInverso -= 500;
    }
    while (valorInverso >= 200) {
        printf("Devolver nota de 2\n");
        valorInverso -= 200;
    }
    while (valorInverso >= 100) {
        printf("Devolver moeda de 1\n");
        valorInverso -= 100;
    }
    while (valorInverso >= 50) {
        printf("Devolver moeda de 50c\n");
        valorInverso -= 50;
    }
    while (valorInverso >= 25) {
        printf("Devolver moeda de 25c\n");
        valorInverso -= 25;
    }
    while (valorInverso >= 10) {
        printf("Devolver moeda de 10c\n");
        valorInverso -= 10;
    }
    while (valorInverso >= 5) {
        printf("Devolver moeda de 5c\n");
        valorInverso -= 5;
    }
    while (valorInverso >= 1) {
        printf("Devolver moeda de 1c\n");
        valorInverso -= 1;
    }
}

int main() {
    float pagamento, compra;

    do {
        printf("\n\n Por favor, digite o valor da compra: ");
        scanf("%f", &compra);

    } while (compra < 0);

    do {
        printf("\n\n Por favor, digite o valor do pagamento: ");
        scanf("%f", &pagamento);

    } while (pagamento < 0);

    if (pagamento > compra) calctroco(compra, pagamento);

    return 0;
}