#include <iostream>
#include <string>

using namespace std;

int main(int argc, char *argv[]) {
    string string;
    getline(cin, string);

    int p1, p2;
    for (p1 = 0, p2 = string.size() - 1; p1 < p2; p1++, p2--) {
        char c = string[p1];
        string[p1] = string[p2];
        string[p2] = c;
    }

    cout << string << endl;
}