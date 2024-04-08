// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Caculating matriz 3x3 with sarrus rule.

// ---------------------------------------------------

#include <stdio.h>

int main() {
    // Creating variables for input values.
    int input11, input12, input13, input14;
    int input21, input22, input23, input24;
    int input31, input32, input33, input34;

    // Variables for math operation
    int validatingMatriz;

    int detX, detXA, detXB;
    int detX1, detX1A, detX1B;
    int detX2, detX2A, detX2B;
    int detX3, detX3A, detX3B;

    // Variables (type float) for output, need to be float for decimal numbers.
    float outX1, outX2, outX3;

    // Validating if the values inputed are correct
    do {
        // Scanning terminal values.
        printf("\n Please Input the value of 'X¹¹' = ");
        scanf("%d", &input11);

        printf("\n Please Input the value of 'X¹²' = ");
        scanf("%d", &input12);

        printf("\n Please Input the value of 'X¹³' = ");
        scanf("%d", &input13);

        printf("\n Please Input the value of 'X¹⁴' = ");
        scanf("%d", &input14);

        printf("\n Please Input the value of 'X²¹' = ");
        scanf("%d", &input21);

        printf("\n Please Input the value of 'X²²' = ");
        scanf("%d", &input22);

        printf("\n Please Input the value of 'X²³' = ");
        scanf("%d", &input23);

        printf("\n Please Input the value of 'X²⁴' = ");
        scanf("%d", &input24);

        printf("\n Please Input the value of 'X³¹' = ");
        scanf("%d", &input31);

        printf("\n Please Input the value of 'X³²' = ");
        scanf("%d", &input32);

        printf("\n Please Input the value of 'X³³' = ");
        scanf("%d", &input33);

        printf("\n Please Input the value of 'X³⁴' = ");
        scanf("%d", &input34);

        printf(
            "\n-----------------------------------------------------------"
            "\n");

        printf("\n Please verify if the matriz input are correct: \n\n");

        // Printing matriz in terminal to verify if the input is correct.

        printf("| %d | %d | %d | = %d |\n", input11, input12, input13, input14);
        printf("| %d | %d | %d | = %d |\n", input21, input22, input23, input24);
        printf("| %d | %d | %d | = %d |\n", input31, input32, input33, input34);

        printf("\n If the matriz is correct input (1), else, input (2) = ");

        scanf("%d", &validatingMatriz);

    } while (validatingMatriz == 2);

    // Doing determinant operations.

    detXA = (input11 * input22 * input33) + (input12 * input23 * input31) +
            (input13 * input21 * input32);

    detXB = -(input13 * input22 * input31) - (input11 * input23 * input32) -
            (input12 * input21 * input33);

    detX1A = (input14 * input22 * input33) + (input12 * input23 * input34) +
             (input13 * input24 * input32);

    detX1B = -(input13 * input22 * input34) - (input14 * input23 * input32) -
             (input12 * input24 * input33);

    detX2A = (input11 * input24 * input33) + (input14 * input23 * input31) +
             (input13 * input21 * input34);

    detX2B = -(input13 * input24 * input31) - (input11 * input23 * input34) -
             (input14 * input21 * input33);

    detX3A = (input11 * input22 * input34) + (input12 * input24 * input31) +
             (input14 * input21 * input32);

    detX3B = -(input14 * input22 * input31) - (input11 * input24 * input32) -
             (input12 * input21 * input34);

    detX = (detXA + detXB);
    detX1 = (detX1A + detX1B);
    detX2 = (detX2A + detX2B);
    detX3 = (detX3A + detX3B);

    printf("\n-----------------------------------------------------------");

    printf("\n General Determinant = %d \n", detX);

    printf("\n Determinant of X1 = %d \n", detX1);

    printf("\n Determinant of X2 = %d \n", detX2);

    printf("\n Determinant of X3 = %d \n", detX3);

    printf("-----------------------------------------------------------");

    // Calculating x1 and x2 and printing the outputs:

    outX1 = (float)detX1 / detX;
    outX2 = (float)detX2 / detX;
    outX3 = (float)detX3 / detX;

    printf("\n Vaule of X1 = %f \n", outX1);

    printf("\n Vaule of X2 = %f \n", outX2);

    printf("\n Vaule of X3 = %f \n", outX3);

    printf("-----------------------------------------------------------");

    printf("\n\nOperation finished!\n\n");

    return 0;
}