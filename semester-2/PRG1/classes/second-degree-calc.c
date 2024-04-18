// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Do math operation for bhaskara expression

// ---------------------------------------------------
#include <math.h>
#include <stdio.h>

int main() {
    // Creating variables for input, and doing some math operations
    int inputA, inputB, inputC, inputBExponation, deltaValue;

    // Creating an long double value for square root operation
    long double sqrtDeltaValue;

    // Creating float variables for output (need to be float)
    float outputA, outputB, outputA1, outputB1;

    // Inputing value of variable A
    printf("\nPlease input the value of 'A'!\n");
    scanf("%d", &inputA);
    printf("\nThe value inputed of 'A' is = %d\n", inputA);

    // Inputing value of variable B
    printf("\nPlease input the value of 'B'!\n");
    scanf("%d", &inputB);
    printf("\nThe value inputed of 'B' is = %d\n", inputB);

    // Inputing value of variable C
    printf("\nPlease input the value of 'C'!\n");
    scanf("%d", &inputC);
    printf("\nThe value inputed of 'C' is = %d\n", inputC);

    // Doing squared operation for B value
    inputBExponation = (inputB * inputB);

    // Calculating delta value
    deltaValue = (inputBExponation - 4 * inputA * inputC);

    // Validating if Delta is positive, it need to be for be real.
    if (deltaValue >= 0) {
        // Calculating the square root of delta.
        sqrtDeltaValue = (float)sqrt(deltaValue);

        printf(
            "\n-----------------------------------------------------------"
            "\n");

        printf("\n The value of Delta correspond to = %d\n", deltaValue);

        printf("\n The square root value of Delta correspond to = %Lf\n",
               sqrtDeltaValue);

        // Calculating  the first output of bhaskara
        outputA1 = (float)(sqrtDeltaValue - inputB);

        // Calculating  the second output of bhaskara
        outputB1 = (float)-(sqrtDeltaValue + inputB);

        // Printing the outputs of both bhaskara values.
        outputA = (float)outputA1 / (2 * inputA);
        printf(
            "\n-----------------------------------------------------------"
            "\n");
        printf("\n The value of X' correspond to = %f\n", outputA);

        outputB = (float)outputB1 / (2 * inputA);

        printf("\n The value of X'' correspond to = %f\n", outputB);
        printf(
            "\n-----------------------------------------------------------"
            "\n");

        // Printing error in terminal when the value of delta is smaller than 0.
    } else {
        printf(
            "\n-----------------------------------------------------------"
            "\n");
        printf(
            "\nThe value of delta is '%d', it's impossible get the square root "
            "of this number!\n",
            deltaValue);

        printf(
            "\n-----------------------------------------------------------"
            "\n");
    }

    printf("\nOperation finished!\n\n");

    return 0;
}
