// First class - Eng. Telecom.
// Name: Cadore.AC

// ---------------------------------------------------

// Code for this expression: F = (N!*2)/(M!+1)

// ---------------------------------------------------

#include <stdio.h>

int main() {
    // Variables for input values for math operation
    int input1, input2;

    // creating variables to do math operation
    int fatIN1, fatIN2;

    // creating output variables (type float) for real numbers.
    float output, output1, output2;

    // Testing if "input1" is positive and intire.
    do {
        printf("Input the value of variable 'N'\n");

        scanf("%i", &input1);

    } while (input1 < 0);

    // Testing if "input2" is positive and intire.
    do {
        printf("Input the value of variable 'M'\n");

        scanf("%i", &input2);

    } while (input2 < 0);

    // Math fatoration of "input1"
    for (fatIN1 = 1; input1 > 1; input1 = input1 - 1) {
        fatIN1 = fatIN1 * input1;
    }

    // Math fatoration of "input2"
    for (fatIN2 = 1; input2 > 1; input2 = input2 - 1) {
        fatIN2 = fatIN2 * input2;
    }

    // Math operation of (N!*2)
    output1 = fatIN1 * 2;

    // Math operation of (M!+1)
    output2 = fatIN2 + 1;

    // Math operation of all expression.
    output = (float)output1 / output2;

    // Print the math values caculated before.
    printf("Fatoration value of 'N' = %d\n\nFatoration value of 'M' = %d\n\n",
           fatIN1, fatIN2);

    printf("Output value of {F = (N!*2)/(M!+1)} expression is  = %f\n\n",
           output);

    printf("Operation finished \n");
}
