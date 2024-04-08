// Course: Telecom engineering
// Name: Cadore-AC
// Note: For compilation of this code in gcc compiler, we need to add "-lm" in
// the command line, for example: gcc basicMathOperator.c -lm

// ---------------------------------------------------

// Challange: Code to get all simple results for two variables.

// ----------------------------------------------------
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int main()

{
    // Creating variables to input data, and doing math operations.
    int input1, input2, mathOperator;

    // Creating a float variable for output, it need to be float for
    // non-integire numbers.
    float expressionOutput;

    // Input the values to calculate:
    printf("\nPlease, input the first value to calculate...\n");
    scanf("%d", &input1);
    printf("\nThe firts value inputed is = %d\n", input1);

    printf("\nPlease, input the second value to calculate...\n");
    scanf("%d", &input2);
    printf("\nThe second value inputed is = %d\n", input2);

    // Input the operation value, for choice the operation.
    printf("\nPlease, input the operator character \n");
    printf("(1) for addition \n");
    printf("(2) for subtraction \n");
    printf("(3) for multiplication \n");
    printf("(4) for division \n");
    printf("(5) for exponential of both values inputed \n");
    printf("(6) for square root of both values inputed \n");

    scanf("%d", &mathOperator);
    printf("\nThe operator value is = %d\n", mathOperator);

    // testing with operator the user has choiced, and do the operation.
    if (mathOperator == 1) {
        expressionOutput = input1 + input2;
        printf("\nThe addition value of both variables correspond to = %f\n",
               expressionOutput);
    }

    else if (mathOperator == 2) {
        expressionOutput = input1 - input2;
        printf("\nThe subtraction value of both variables correspond to = %f\n",
               expressionOutput);
    }

    else if (mathOperator == 3) {
        expressionOutput = input1 * input2;
        printf(
            "\nThe multiplication value of both variables correspond to = %f\n",
            expressionOutput);
    }

    else if (mathOperator == 4) {
        expressionOutput = (float)input1 / input2;
        printf("\nThe division value of both variables correspond to = %f\n",
               expressionOutput);
    }

    else if (mathOperator == 5) {
        expressionOutput = input1 * input1;

        printf("\nThe exponential of the first value correspond to = %f\n",
               expressionOutput);

        expressionOutput = input2 * input2;

        printf("\nThe exponential of the second value correspond to = %f\n",
               expressionOutput);
    }

    else if (mathOperator == 6) {
        expressionOutput = sqrt(input1);

        printf("\nThe square root of the first value correspond to = %f\n",
               expressionOutput);

        expressionOutput = sqrt(input2);

        printf("\nThe square root of the second value correspond to = %f\n",
               expressionOutput);
    }

    else {
        printf("\nOperator is Invalid, please write it again!\n");
    }

    printf("\nOperation finished!\n");

    return 0;
}
