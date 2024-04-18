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

bool comparation_count(const word_counts & first_integer, const word_counts & second_integer) {
    if (first_integer.count == second_integer.count) {
        return first_integer.word < second_integer.word;
    }
    return first_integer.count > second_integer.count;
} 

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input, second_input;

    second_input = argv[2];

    int words_number = stoi(second_input), count_output = 0;

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

    output.sort(comparation_string);

    for (auto & interator: output) {
        count_output++;
        cout << interator.word << " " << interator.count << endl;

        if(count_output == words_number) break;
  }
}
