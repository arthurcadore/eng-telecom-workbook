#include <cctype>
#include <fstream>
#include <iostream>
#include <queue>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream arq(argv[1]);

    string aux;

    queue<string> stringUppercase, stringLowercase;

    while (arq >> aux) {
        if (isupper(aux[0]) != 0)
            stringUppercase.push(aux);
        else
            stringLowercase.push(aux);
    }

    do {
        cout << stringUppercase.front() << endl;
        stringUppercase.pop();
    } while (!(stringUppercase.empty()));

    do {
        cout << stringLowercase.front() << endl;
        stringLowercase.pop();
    } while (!(stringLowercase.empty()));
}