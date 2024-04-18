#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main() {
    char string[] = "   esse     e     um    duplo   espaco  ";

    int i, j = 1, h = 0, x, z;

    for (int i = 0; i <= strlen(string); i++) {
        x = isspace(string[i]);  // se não for espaço retorna 0;
        z = isspace(string[j]);

        if (x == 0 || z == 0) {
            printf("%c", string[i]);
        };

        j++;
    }
    return 0;
}