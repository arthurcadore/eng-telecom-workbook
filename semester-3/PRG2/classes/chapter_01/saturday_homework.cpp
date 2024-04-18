#include <fstream>
#include <iostream>
#include <queue>
#include <stack>
#include <string>

using namespace std;

void separator(const string& input, char separator, queue<string>& line) {
    int space = 0;
    string stringSeparator, aux;

    stringSeparator += separator;

    while (space != string::npos) {
        int word = input.find_first_not_of(stringSeparator, space);

        if (word == string::npos) break;

        space = input.find(separator, word);
        if (space == string::npos) {
            aux = input.substr(word);
        } else {
            aux = input.substr(word, space - word);
        }
        line.push(aux);
    }
}

int main(int agrc, char* argv[]) {
    int count = 0, vectorSize = (agrc - 2);
    char separatatorCharacter = ',';

    ifstream arq(argv[1]);
    string aux, aux2;
    queue<string> line, lineAux1, lineAux2;

    // cout << "vector Size = " << vectorSize << endl << endl;

    while (getline(arq, aux)) {
        separator(aux, separatatorCharacter, line);

        while (!line.empty()) {
            aux2 = line.front();
            lineAux1.push(aux2);
            lineAux2.push(aux2);
            line.pop();
        }

        for (int i = 0; i < lineAux1.size(); i++) {
        }
    }
}
