#include <fstream>
#include <iostream>
#include <list>

using namespace std;

list<string> separa(const string& input, const string & stringSeparator) {

    int space = 0;

    list<string> line;

    string aux;

    while (space != string::npos) {
        int word = input.find_first_not_of(stringSeparator, space);

        if (word == string::npos) break;

        space = input.find(stringSeparator, word);
        if (space == string::npos) {
            aux = input.substr(word);
        } else {
            aux = input.substr(word, space - word);
        }
        line.push_back(aux);
    }

return line;
}

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string aux, separatorString;

    separatorString = argv[2];

    list<string> output;

    while (getline(arq, aux)) {

        output = separa(aux, separatorString);

        while (!output.empty()) {
            cout << output.front() << endl;
            output.pop_front();
        }
    }
}