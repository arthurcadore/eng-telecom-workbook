#include <fstream>
#include <iostream>
#include <queue>

using namespace std;

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);
    string aux;
    queue<string> level[5];

    char priorityLevel;

    while (getline(arq, aux)) {
        priorityLevel = aux[0];

        int auxLevel = priorityLevel - '0';

        level[auxLevel].push(aux);
    };

    for (int i = 0; i < 5; i++) {
        while (!level[i].empty()) {
            cout << level[i].front() << endl;
            level[i].pop();
        }
    }
}