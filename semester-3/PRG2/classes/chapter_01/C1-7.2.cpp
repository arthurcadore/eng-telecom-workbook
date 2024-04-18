#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;


void unicos(list<string> & l){

list<string> auxList;

while(!l.empty()){
    auxList.push_back(l.front());
    l.remove(l.front());
}

while(!auxList.empty()){
    l.push_back(auxList.front());
    auxList.pop_front();
}

}


int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input;

    list<string> aux;

    while (arq >> input) {
        aux.push_back(input);
    }

    unicos(aux);

}