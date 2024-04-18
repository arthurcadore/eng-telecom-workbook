#include <iostream>
#include <list> 
#include <string>
#include <unordered_map>
#include <fstream>


using namespace std;

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    if(!arq.is_open()) {cout << "Arquivo invalido";
    
    return 0;}

    unordered_map<int,list<string>> table;

    string word;
    while (arq >> word) {

        auto & palavras = table[word.size()];
        palavras.push_back(word);
    }

    list<int> keys; 

    for(auto & par: table){

        keys.push_back(par.first);

    }

    keys.sort();

    for(auto & k: keys){
        for(auto & word: table[k]){
            cout << word << " ";
            }
            cout << endl;
    }

}
