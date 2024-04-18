#include <cctype>
#include <iostream>
#include <string>

using namespace std;

int main() {
    string inputedString;

    getline(cin, inputedString);

    for (auto& i : inputedString) {
        char c = toupper(i);

        cout << c;
    }
}