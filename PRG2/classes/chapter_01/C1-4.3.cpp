#include <fstream>
#include <iostream>
#include <queue>

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

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string aux, separatorString;

    separatorString = argv[2];

    char separatorCharacter = separatorString[0];

    queue<string> output;

    while (getline(arq, aux)) {
        separator(aux, separatorCharacter, output);

        while (!output.empty()) {
            cout << output.front() << endl;
            output.pop();
        }
    }
}