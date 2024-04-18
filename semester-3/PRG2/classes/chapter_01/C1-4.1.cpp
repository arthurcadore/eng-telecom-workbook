#include <iostream>
#include <queue>

using namespace std;

int main() {
    string input;
    queue<string> clients;

    do {
        cout << ">" << endl;
        getline(cin, input);

        if (input == "?") {
            cout << clients.front() << endl;
            clients.pop();

        } else if (input != "sair") {
            clients.push(input);
            cout << clients.size() - 1 << " ";
        }
    } while (input != "sair");
}
