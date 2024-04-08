// Course: Telecom engineering
// Name: Cadore-AC

// ---------------------------------------------------

#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define matrixSize 10
#define maxShot 30
#define maxName 30

#define free 0
#define firstBoat 1
#define secondBoat 2
#define tirdBoat 3

int warZone[matrixSize][matrixSize];
int shotCount = 0;
int finalScore = 0;
int Xposition;
int Yposition;

char name[maxName];

// ------------------------------------------------------------------------------

void matrixCleaner() {
    int i = 0, j = 0, x;

    for (i = 0; i < matrixSize; i++) {
        for (j = 0; j < matrixSize; j++) {
            warZone[i][j] = free;
        }
    }
}

// ------------------------------------------------------------------------------

void randomSlot() {
    do {
        Xposition = rand() % matrixSize;
        Yposition = rand() % matrixSize;
    } while (warZone[Xposition][Yposition] != free);
}

// ------------------------------------------------------------------------------

void tirdBoatPositionation() {
    int j;

    for (j = 0; j < 5; j++) {
        randomSlot();
        warZone[Xposition][Yposition] = tirdBoat;
    };
}

// ------------------------------------------------------------------------------

void secondBoatPositionation() {
    int j;

    for (j = 0; j < 5; j++) {
        randomSlot();
        warZone[Xposition][Yposition] = secondBoat;
    };
}

// ------------------------------------------------------------------------------

void firstBoatPositionation() {
    randomSlot();
    warZone[Xposition][Yposition] = firstBoat;
}

// ------------------------------------------------------------------------------

void BoatPositionation() {
    srand(time(NULL));

    firstBoatPositionation();
    secondBoatPositionation();
    tirdBoatPositionation();
}

// ------------------------------------------------------------------------------

void linePrinter(int line) {
    int j;

    printf(" ");
    for (j = 0; j < matrixSize; j++) {
        printf(" | %2d", warZone[line][j]);
    }
    printf(" |\n ");
    printf("    +----+----+----+----+----+----+----+----+----+----+\n");
}

// ------------------------------------------------------------------------------

void coverdlinePrinter(int line) {
    int j;

    printf(" ");
    for (j = 0; j < matrixSize; j++) {
        if (warZone[line][j] >= 0 && warZone[line][j] <= 3) {
            printf(" |   ");
        } else {
            printf(" | %2d", warZone[line][j]);
        }
    }
    printf(" |\n ");
    printf("    +----+----+----+----+----+----+----+----+----+----+\n");
}

// ------------------------------------------------------------------------------

void matrixWholePrinter() {
    int i;
    printf("\n\n");
    printf("        0    1    2    3    4    5    6    7    8    9  \n");
    printf(" ");
    printf("    +----+----+----+----+----+----+----+----+----+----+\n");
    for (i = 0; i < matrixSize; i++) {
        printf(" %d ", i);
        linePrinter(i);
    }
}

// ------------------------------------------------------------------------------

void coverdMatrixPrinter() {
    int i;
    printf("\n\n");
    printf("        0    1    2    3    4    5    6    7    8    9  \n");
    printf(" ");
    printf("    +----+----+----+----+----+----+----+----+----+----+\n");
    for (i = 0; i < matrixSize; i++) {
        printf(" %d ", i);
        coverdlinePrinter(i);
    }
}

// ------------------------------------------------------------------------------

int shot() {
    coverdMatrixPrinter();
    // matrixWholePrinter();
    int shotX, shotY;

    printf("\n");
    do {
        do {
            printf("Please input the horizontal for shot (0-9) =  ");
            scanf("%d", &shotY);

        } while (shotY < 0);
    } while (shotY > 9);

    do {
        do {
            printf("Please input the longitudinal for shot (0-9) =  ");
            scanf("%d", &shotX);

        } while (shotX < 0);
    } while (shotX > 9);

    if (warZone[shotX][shotY] == 0) {
        shotCount++;

        warZone[shotX][shotY] = 10;

        printf("\nIt not was this time, please, try again!");

    } else if (warZone[shotX][shotY] == 1) {
        shotCount++;
        finalScore = finalScore + 10;

        warZone[shotX][shotY] = 10;

        printf("\nYou have destroyed the aircraft carrier!");

    } else if (warZone[shotX][shotY] == 2) {
        shotCount++;
        finalScore = finalScore + 3;

        warZone[shotX][shotY] = 10;

        printf("\nYou have destroyed one frigate!");

    } else if (warZone[shotX][shotY] == 3) {
        shotCount++;
        finalScore = finalScore + 5;

        warZone[shotX][shotY] = 10;

        printf("\nYou have destroyed one submarine!");

    } else if (warZone[shotX][shotY] == 10) {
        printf(
            "\nYou have already shoted into this slot, please select "
            "another "
            "one!");
    };

    printf("\n\n ShotCount = %d", shotCount);

    printf("\n\n Score = %d", finalScore);

    if (finalScore == 50) {
        return 1;
    } else if (shotCount == 30) {
        return 2;
    } else {
        return 0;
    };
}

// ------------------------------------------------------------------------------

int main() {
    int situation;
    matrixCleaner();
    BoatPositionation();

    char PlayerName[maxName];

    printf("\n\nPlease input your name: ");
    scanf("%s", PlayerName);

    printf("\nHi %s, let's play Naval Battle!", PlayerName);

    printf("\n--------------------------------------------------------");
    printf("\n--------------------------------------------------------");

    do {
        situation = shot();

    } while (situation == 0);

    printf("\n--------------------------------------------------------");
    printf("\n--------------------------------------------------------");
    printf("\n\n Game Finished!\n");
    printf("\n--------------------------------------------------------");
    printf("\n Player: %s", PlayerName);
    printf("\n Shot Count: %d", shotCount);
    printf("\n Final Score: %d", finalScore);
    printf("\n--------------------------------------------------------");
    return 0;
}