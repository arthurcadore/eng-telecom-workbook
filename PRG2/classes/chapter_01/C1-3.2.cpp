#include <fstream>
#include <iostream>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream arq(argv[1]);

    string comparator = argv[2], verifyString;

    string linha;
    while (getline(arq, linha)) {
        if (linha.find(comparator) != string::npos) cout << linha << endl;
    }
}