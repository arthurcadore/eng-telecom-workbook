// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

// Challange: Verify all square roots in a randon gap, and output the integer
// ones.

// ---------------------------------------------------

#include <math.h>
#include <stdio.h>

int main() {
    // Creating variables for input data, and math operations.

    int inputValue, seriesTestingValue = 0, sqrtValue = 1;

    // Creating and long double variable for testing decimal places in decimal
    // numbers.
    long double outputValue;

    printf("\n Please input the number series for validating!\n ");

    // Testing if the number inputed is bigger than 0.
    do {
        scanf("%d", &inputValue);

        printf("\n The number inputed correspond to = %d\n\n ", inputValue);

    } while (inputValue < 0);

    // Creanting an loop function to test all values between 1 and the input.
    do {
        // Doing the math operation to get the square root value of the input.
        outputValue = (float)sqrt(sqrtValue);

        // testing if the input is integer or not.
        if (ceil(outputValue) == floor(outputValue)) {
            printf(
                "\n-----------------------------------------------------------"
                "\n");

            printf(
                "\n The sqrt number of %d is integer, and correspond to = "
                "%Lf\n",
                sqrtValue, outputValue);

            printf(
                "\n-----------------------------------------------------------"
                "\n");

            seriesTestingValue++;

        } else {
            printf(
                "\n The sqrt number of %d isn't an intiger number, and it "
                "value correspond to = %Lf\n",
                sqrtValue, outputValue);
        };

        sqrtValue++;

    } while (inputValue >= sqrtValue);

    printf("\nWere founded totaty %d integer square roots between 1 and %d!\n",
           seriesTestingValue, inputValue);

    printf("\nOperation finished!\n\n");

    return 0;
}