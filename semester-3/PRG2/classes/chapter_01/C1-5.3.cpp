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

int main() {
    string input, aux;
    char separatorCharacter = ' ';
    int outputValue = 0;
    queue<string> line, output1;
    stack<string> output2;

    getline(cin, input);

    separator(input, separatorCharacter, line);

    while (!line.empty()) {
        aux = line.front();
        line.pop();
        output1.push(aux);
        output2.push(aux);
    }

    while (!output1.empty()) {
        if (!(output1.front() == output2.top())) {
            outputValue = 1;
            break;
        } else
            outputValue = 0;

        output1.pop();
        output2.pop();
    }

    if (outputValue == 0)
        cout << "VERDADEIRO" << endl;
    else
        cout << "FALSO" << endl;
}