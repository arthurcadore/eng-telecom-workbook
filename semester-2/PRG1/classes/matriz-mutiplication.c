#include <stdio.h>

void macalc(int ma[3][2], int mb[2][3], int mc[3][3]) {
    int i = 0, j = 0, k = 0;
    int x = 0, y = 0, z = 0;

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            mc[i][j] = 0;
        };
    };

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            for (k = 0; k < 2; k++) {
                mc[i][j] = mc[i][j] + (ma[i][k] * mb[k][j]);

                x = mc[i][j];
                y = ma[i][k];
                z = mb[k][j];

                printf("position   [%d][%d] = [%d] + ([%d] * [%d]) \n", i, j, x,
                       y, z);
            };
        };
    };

    for (i = 0; i < 3; i++) {
        for (j = 0; j < 3; j++) {
            x = mc[i][j];

            printf("position [%d][%d] = %d \n", i, j, x);
        };
    };
};

int main() {
    int ma[3][2] = {{1, 2}, {3, 4}, {5, 6}};

    int mb[2][3] = {{1, 2, 3}, {3, 4, 6}};

    int mc[3][3];

    macalc(ma, mb, mc);

    return 0;
};