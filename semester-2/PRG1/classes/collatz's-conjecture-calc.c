// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Do math operation for bhaskara expression

// ---------------------------------------------------
#include <stdio.h>

int main() {
    int input, seriesValue = 1;

    do {
        printf("\nPlease, input the value for testing = ");
        scanf("%d", &input);

    } while (input <= 0);

    printf("\n-----------------------------------------------------------\n");

    printf("Verifing Collatz Conjecture series for %d!", input);

    printf("\n-----------------------------------------------------------\n");

    do {
        printf("\nThe %d° value of Collatz's Conjecture is = %d\n", seriesValue,
               input);

        if (input % 2 == 0) {
            input = input / 2;

        } else {
            input = (3 * input) + 1;
        }

        seriesValue++;

    } while (input > 1);

    printf("\n-----------------------------------------------------------\n");

    printf("\nOperation finished!\n\n");

    return 0;
}