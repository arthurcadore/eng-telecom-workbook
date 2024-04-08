#include <iostream>
#include <list> 
#include <string>
#include <unordered_map>
#include <fstream>


using namespace std;

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input;

    unordered_map<string,int> words;

    while (arq >> input) {

        if (words.count(input) == 1) {
         words[input] ++;

        } else {
          words[input] = 1;
        }
  }
    for (auto & output: words) {
    cout << output.first << " " << output.second << endl;
  }
}
