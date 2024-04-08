#include <iostream>
#include <list> 
#include <string>
#include <unordered_map>
#include <fstream>


using namespace std;

struct word_counts{

    string word;
    int count; 

};

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input, second_input;

    second_input = argv[2];

    int words_number = stoi(second_input);

    unordered_map<string,int> words;
    list<word_counts> output;

    while (arq >> input) {

        if (words.count(input) == 1) {
         words[input] ++;

        } else {
          words[input] = 1;
        }
    }
    
    for (auto & interator: words) {
        word_counts aux;

        aux.word = interator.first; 
        aux.count = interator.second;
        output.push_back(aux);
    } 

    auto func = [](auto & x1, auto & x2) { return x1.count < x2.count;};

	output.sort(func);

    for (auto & interator: output) {
        count_output++;
        cout << interator.word << " " << interator.count << endl;

        if(count_output == words_number) break;
  }
}
