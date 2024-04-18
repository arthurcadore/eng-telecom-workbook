// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Input an randon number, and verify if that is prime number or
// not.

// ----------------------------------------------------

#include <stdio.h>

int main() {
    // Creating variables, mathOperator need to be 2, because the first value
    // that will be tested is 2.
    int input, mathOperator = 2, Output;

    // Validating if the number is correctly inputed to do the operations.
    do {
        printf("Plese input the number value!\n");

        scanf("%d", &input);

        printf("\n\nThe number inputed correspond to = %d \n\n", input);

    } while (input < 0);

    // Testing all numbers between 2 and the number iputed to test with number
    // can devide it.
    do {
        printf("Starting test with = %d!\n", mathOperator);

        if (input % mathOperator == 0) {
            if (input == mathOperator) {
                printf(
                    "\n\nYes, your number is a prime number, it only can be "
                    "devided by 1 and %d!\n\n",
                    mathOperator);

            } else {
                printf(
                    "\n\nThe value inputed ins't a prime number, it can be "
                    "devided by %d!\n\n",
                    mathOperator);
            }

            break;

        } else {
            printf("Test Failed with = %d!\n", mathOperator);
        }

        mathOperator++;

    } while (mathOperator <= input);

    printf("\nOperation finished!\n");
}