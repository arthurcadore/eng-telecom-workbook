#include <fstream>
#include <iostream>
#include <stack>
#include <string>

using namespace std;

int main(int agrc, char* argv[]) {
    ifstream arq(argv[1]);
    string aux;
    stack<string> pile;

    if (!arq.is_open()) {
        cout << "arquivo invalido" << endl;
    }

    while (getline(arq, aux)) {
        pile.push(aux);
    }

    while (!pile.empty()) {
        cout << pile.top() << endl;
        pile.pop();
    }
}
