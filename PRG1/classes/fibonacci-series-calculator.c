// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Doing math operations to get fibonacci sequence with "N" series.

// ---------------------------------------------------

#include <stdio.h>

int main() {
    // Creating variables for inputs, outputs and math operation.
    int seriesVaule, outputValue, firstValue = 1, secondValue = 1,
                                  processSeries = 2;

    // Validation of input series value, it needs to be positive.
    do {
        printf("Input how many series the script will calculate\n");

        scanf("%d", &seriesVaule);

        printf("\n\nInputed value of = %d series\n\n", seriesVaule);

    } while (seriesVaule < 0);

    // doing math operation by value attribution on variables even and odd.
    while (processSeries <= seriesVaule) {
        if (processSeries % 2 == 0) {
            firstValue = firstValue + secondValue;
            outputValue = firstValue;

        } else {
            secondValue = firstValue + secondValue;
            outputValue = secondValue;
        }

        printf("Serie N°%d - Fibonacci value = %d\n", processSeries,
               outputValue);
        processSeries++;
    }

    printf("\nFibonacci Series finished!\n");
}
