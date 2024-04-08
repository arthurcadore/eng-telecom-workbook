#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input;

    list<string> list1;

    while (getline(arq, input)) {
        list1.push_back(input);
    }
    
    list1.sort();
    list1.unique();

    while (!list1.empty()) {
        cout << list1.front() << endl;
        list1.pop_front();
    }

}