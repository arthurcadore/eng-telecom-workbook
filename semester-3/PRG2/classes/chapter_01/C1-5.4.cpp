#include <fstream>
#include <iostream>
#include <queue>
#include <stack>
#include <string>

using namespace std;

string reduz_caminho(const string& caminho) {
    int space = 0;
    string stringSeparator, aux, aux2, outputString, ouputInvalid = "/";
    char separator = '/';
    queue<string> line;
    stack<string> pile, output;

    stringSeparator += separator;

    if(caminho.empty()) return caminho;

    while (space != string::npos) {
        int word = caminho.find_first_not_of(stringSeparator, space);

        if (word == string::npos) break;

        space = caminho.find(separator, word);
        if (space == string::npos) {
            aux = caminho.substr(word);
        } else {
            aux = caminho.substr(word, space - word);
        }
        line.push(aux);
    }

    while (!line.empty()) {
        aux2 = line.front();
        line.pop();

        if (aux2 == ".." && ! pile.empty()) {
		pile.pop();
        } else if (aux2 != "." && aux2 != "..")

                pile.push(aux2);

    }                

    while (!pile.empty()) {
        aux2 = pile.top();
        output.push(aux2);
        output.push("/");
        pile.pop();
    }
     
    if(output.empty()) output.push("/");

    while (!output.empty()) {
        outputString += output.top();
        output.pop();
    }

   return outputString;
}

int main() {
    string input, output;

    getline(cin, input);

    output = reduz_caminho(input);

    cout << output << endl;
}
