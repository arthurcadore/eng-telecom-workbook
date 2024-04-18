// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Make an C function to calculate the standard devitation of two
// values.
// ----------------------------------------------------

#include <math.h>
#include <stdio.h>

int summationU(int summationSeries, float input) {
    int i;

    float summationOuput = 0, output1, output2, outputU;

    for (i = 1; i <= summationSeries; i++) {
        output1 = (float)i * input;

        summationOuput = (float)output1 + summationOuput;
    };

    output2 = (float)1 / summationSeries;

    outputU = (float)output2 * summationOuput;

    return outputU;
}

int summationDevitation(int summationSeries, float input, float u) {
    int i;

    float summationOuput = 0, output1, output2, output3, devitationOuput1,
          devitationOuput;

    for (i = 1; i <= summationSeries; i++) {
        output1 = (float)i * input;
        output2 = output1 - u;
        output3 = output2 * output2;

        summationOuput = (float)output3 + summationOuput;
    };

    output2 = (float)1 / summationSeries;

    devitationOuput1 = (float)output2 * summationOuput;

    devitationOuput = (float)sqrt(devitationOuput1);

    return devitationOuput;
}

int main() {
    int summationSeries;

    float input, u, finalOuput;

    do {
        printf("\nPlese input the summation series value = ");

        scanf("%d", &summationSeries);

    } while (summationSeries <= 0);

    printf("\nPlease input the summation value = ");

    scanf("%f", &input);

    u = summationU(summationSeries, input);

    finalOuput = summationDevitation(summationSeries, input, u);

    printf("\nThe standard devitation is = %f\n\n", finalOuput);

    return 0;
}