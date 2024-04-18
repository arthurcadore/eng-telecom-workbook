#include <iostream>
#include <string>

using namespace std;

int main() {
    int spaceCount = 1, stringCount = 0;
    string stringInput;
    getline(cin, stringInput);

    for (auto& i : stringInput) {
        if (i == ' ') spaceCount++;

        stringCount++;
    }

    if (stringCount == 0)
        cout << "0"
             << " "
             << "0";

    else
        cout << spaceCount << " " << stringCount;
}