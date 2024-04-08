#include <fstream>
#include <iostream>

using namespace std;

int main(int argc, char *argv[]) {
    ifstream arq(argv[1]);
    int line = 0, words = 0, caracters = 0, space = -1, word;
    string lines;
    while (getline(arq, lines)) {
        line++;
        space = -1;
        
        do {
            word = lines.find_first_not_of(" ", space + 1);
            if (word == string::npos) break;
            words++;
            space = lines.find_first_of(" ", word + 1);
        } while (space < lines.size() && space != string::npos);

        caracters = caracters + lines.size() +1;
    }

    cout << line << " " << words << " " << caracters << endl;
}