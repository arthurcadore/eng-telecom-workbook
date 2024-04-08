// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange:
// ----------------------------------------------------

#include <stdio.h>

int main() {
    int summationSeries, i;

    float input, output = 0, output1;

    do {
        printf("\nPlese input the summation series value = ");

        scanf("%d", &summationSeries);

    } while (summationSeries <= 0);

    printf("\nPlease input the summation value = ");

    scanf("%f", &input);

    for (i = 1; i <= summationSeries; i++) {
        output1 = (float)i * input;

        output = (float)output1 + output;
    }

    printf("\nThe summation value is = %f\n\n", output);

    return 0;
}