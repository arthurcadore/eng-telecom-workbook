#include <stdlib.h>

#include <iostream>
#include <string>

using namespace std;

int calcValor(int inputMaior, int inputMenor) {
    int calc_output = 0;

    calc_output = (inputMaior + inputMenor) / 2;

    return calc_output;
}

int main() {
    int minimo = 0, maximo = 99, output = 50, cont = 1, contMenos = 1,
        contMais = 1;

    string input;

    cout << output << endl;
    cin >> input;

    do {
        if (input == "=") {
            break;
        }
        if (input == ">") {
            minimo = output + 1;
            output = calcValor(maximo, minimo);
        } else if (input == "<") {
            maximo = output - 1;
            output = calcValor(maximo, minimo);
        }

        cout << output << endl;
        cin >> input;

        cont++;
    } while (input != "=");

    cout << cont << " tentativas" << endl;

    return 0;
}