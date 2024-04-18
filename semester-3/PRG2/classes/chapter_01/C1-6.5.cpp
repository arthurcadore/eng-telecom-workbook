#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;


int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);
    ifstream arq2(argv[2]);
    
    string input; 
    
    list<string> list1, list2, outputList;

    while (arq >> input) {
        list1.push_back(input);
    }

    while (arq2 >> input) {
        list2.push_back(input);
    }

    for (auto f=list1.begin(); f != list1.end(); f++) {
        bool achou=false;

        for (auto i=list2.begin(); !achou && i != list2.end(); i++) {
             achou = (*f == *i);
        }
        if (!achou) outputList.push_back(*f);
    }

    while(!outputList.empty()){
            cout << outputList.front() << endl;
            outputList.pop_front();
        }
}