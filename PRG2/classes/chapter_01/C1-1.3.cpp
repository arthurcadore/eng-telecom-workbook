#include <stdlib.h>

#include <iostream>
#include <string>

using namespace std;

void valueChange(float calcValue) {
    int cont20000 = 0;
    int cont10000 = 0;
    int cont5000 = 0;
    int cont2000 = 0;
    int cont1000 = 0;
    int cont500 = 0;
    int cont200 = 0;
    int cont100 = 0;
    int cont50 = 0;
    int cont25 = 0;
    int cont10 = 0;
    int cont5 = 0;
    int cont1 = 0;

    while (calcValue >= 20000) {
        cont20000++;
        calcValue -= 20000;
    }
    while (calcValue >= 10000) {
        cont10000++;
        calcValue -= 10000;
    }
    while (calcValue >= 5000) {
        cont5000++;
        calcValue -= 5000;
    }
    while (calcValue >= 2000) {
        cont2000++;
        calcValue -= 2000;
    }
    while (calcValue >= 1000) {
        cont1000++;
        calcValue -= 1000;
    }
    while (calcValue >= 500) {
        cont500++;
        calcValue -= 500;
    }
    while (calcValue >= 200) {
        cont200++;
        calcValue -= 200;
    }
    while (calcValue >= 100) {
        cont100++;
        calcValue -= 100;
    }
    while (calcValue >= 50) {
        cont50++;
        calcValue -= 50;
    }
    while (calcValue >= 25) {
        cont25++;
        calcValue -= 25;
    }
    while (calcValue >= 10) {
        cont10++;
        calcValue -= 10;
    }
    while (calcValue >= 5) {
        cont5++;
        calcValue -= 5;
    }
    while (calcValue >= 1) {
        cont1++;
        calcValue -= 1;
    }
    if (cont20000 > 0)
        cout << "R$ 200:"
             << " " << cont20000 << " ";
    if (cont10000 > 0)
        cout << "R$ 100:"
             << " " << cont10000 << " ";
    if (cont5000 > 0)
        cout << "R$ 50:"
             << " " << cont5000 << " ";
    if (cont2000 > 0)
        cout << "R$ 20:"
             << " " << cont2000 << " ";
    if (cont1000 > 0)
        cout << "R$ 10:"
             << " " << cont1000 << " ";
    if (cont500 > 0)
        cout << "R$ 5:"
             << " " << cont500 << " ";
    if (cont200 > 0)
        cout << "R$ 2:"
             << " " << cont200 << " ";
    if (cont100 > 0)
        cout << "R$ 1:"
             << " " << cont100 << " ";
    if (cont50 > 0)
        cout << "R$ 0,50:"
             << " " << cont50 << " ";
    if (cont25 > 0)
        cout << "R$ 0,25:"
             << " " << cont25 << " ";
    if (cont10 > 0)
        cout << "R$ 0,10:"
             << " " << cont10 << " ";
    if (cont5 > 0)
        cout << "R$ 0,05:"
             << " " << cont5 << " ";
    if (cont1 > 0)
        cout << "R$ 0,01:"
             << " " << cont1 << " ";
}

int main(int argc, char *argv[]) {
    long double value = 0;

    value = atof(argv[1]);

    value = value * 100;
    // cout << endl << value << endl;

    valueChange(value);
}