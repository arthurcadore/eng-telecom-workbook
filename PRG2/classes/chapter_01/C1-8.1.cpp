#include <fstream>
#include <iostream>
#include <list>
#include <string>

using namespace std;

int main(int argc, char* argv[]) {
    
    string word1, word2;

    word1 = argv[1];
    word2 = argv[2];

    list<char> list1;
    list<char> list2;

    list1.assign(word1.begin(), word1.end());
    list2.assign(word2.begin(), word2.end());

    list1.sort();
    list2.sort();

    if(list1 == list2) cout << "VERDADEIRO" << endl;
    else cout << "FALSO" << endl;

}