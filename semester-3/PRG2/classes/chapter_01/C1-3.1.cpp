#include <iostream>
#include <string>

using namespace std;

string normaliza(string nome) {
    int space = 0, finalSpace = 0, firstSpace, outputSpace = 0;

    int find = nome.find_first_of(" ");
    int size = nome.size();
    if (find == -1) {
        nome = nome.erase(0, size);
        return nome;
    }
    do {
        space = nome.find_first_of(" ", space + 1);
        finalSpace = nome.find_first_of(" ", space + 1);
    } while (finalSpace != string::npos);

    string secondOuput = nome.substr(0, space);
    if (secondOuput[0] == ' ') secondOuput = secondOuput.substr(1);

    string firstOutput = nome.substr(space);

    string output = firstOutput + ", " + secondOuput;

    outputSpace = output.find_first_not_of(" ");

    string finalOutput = output.substr(outputSpace);

    return finalOutput;
}

int main() {
    string nome = "Matheus Pirez Salazar", output;

    output = normaliza(nome);

    cout << output;
}