/*
AUTOR: Arthur Cadore Matuella Barcella
DATA: 30/11/21
SINOPSE DO PROGRAMA: Imprimir forma variadas de objetos no terminal.
DADOS DE ENTRADA: InputA, InputB;
DADOS DE SAIDA: Output3.
*/

#include <stdio.h>

int main() {
    int input1 = 0, retangleValueL, retangleValueC, retangleValueL1,
        retangleValueC1, input3, testingvalue = 0, trianglesVariable1 = 0,
        sizeValue, shapesValue, processValue;

    char charEven, charOdd;

    do {
        printf("\nPlease, input the value of printing!");
        printf("\n(1) for retangles");
        printf("\n(2) for squared triangles");
        printf("\n(3) for finishing the program\n");

        scanf("%d", &input1);

        printf("\nThe value inputed correspond to = %d", input1);

        switch (input1) {
            case 1:

                printf("\n\nPlease input the collum value = ");
                scanf("%d", &retangleValueL);

                printf("\nPlease input the lines value = ");
                scanf("%d", &retangleValueC);

                printf("\nInput character of printing (Number or Letter) = ");
                scanf(" %c", &charEven);
                printf("\nThe Even triagles will have this character = %c",
                       charEven);

                for (retangleValueC1 = 1; retangleValueC1 <= retangleValueC;
                     retangleValueC1++) {
                    for (retangleValueL1 = 1; retangleValueL1 <= retangleValueL;
                         retangleValueL1++) {
                        printf("%c", charEven);
                    };

                    printf("\n");
                };

                printf("\nRetangles Printed!\n");

                break;

            case 2:

                do {
                    printf(
                        "\n\nInput the size of individual shapes (Number) = ");

                    scanf("%i", &sizeValue);
                } while (sizeValue < 2);

                printf("\nThe size inputed is = %d\n", sizeValue);

                // Validating the number of triangles that will be printed, need
                // to be
                // bigger than 0.
                do {
                    printf(
                        "\nInput the number of triangles that will be "
                        "printed "
                        "(Number) = ");

                    scanf("%i", &shapesValue);
                } while (shapesValue < 0);
                printf("\nThe number of triagle(s) is = %d\n", shapesValue);

                // Importing the first character of printing (the even
                // triangles)
                printf(
                    "\nInput the first character of printing (Number or "
                    "Letter) = ");
                scanf(" %c", &charEven);
                printf("\nThe Even triagles will have this character = %c",
                       charEven);

                // Importing the first character of printing (the odd triangles)
                printf(
                    "\n\nInput the second character of printing (Number or "
                    "Letter) = ");
                scanf(" %c", &charOdd);
                printf("\nThe Odd triagles will have this character = %c",
                       charOdd);

                // Validating the processvalue number and creating a print loop.
                while (processValue <= shapesValue) {
                    printf("\nPrinting triangle Number = %d\n", processValue);

                    int processVariable1 = 0;

                    char ch;

                    if (processValue % 2 == 0) {
                        ch = charEven;
                    } else {
                        ch = charOdd;
                    }

                    // Printing individual triangles.
                    while (processVariable1 < sizeValue) {
                        int processVariable2 = 0;

                        while (processVariable2 <= processVariable1) {
                            printf("%c", ch);

                            processVariable2++;
                        }

                        printf("\n");

                        processVariable1++;
                    }

                    processValue++;
                }

                printf("\nTriangles Printed!\n");

                break;

            case 3:

                input1 = 4;
                break;
        };

    } while (input1 <= 3);

    printf("\n\nPrograma finalizado!\n\n");

    return 0;
}
