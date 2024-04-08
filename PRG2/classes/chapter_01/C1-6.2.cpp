#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input;

    list<string> auxList;

    while (arq >> input) {
        auxList.push_back(input);
    }

while(!auxList.empty()){
    cout << auxList.front() << endl;
    auxList.remove(auxList.front());
}
}