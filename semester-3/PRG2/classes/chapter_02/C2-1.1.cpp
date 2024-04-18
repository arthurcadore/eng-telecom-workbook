#include <iostream>
#include <list> 
#include <string>
#include <unordered_set>
#include <fstream>


using namespace std;

void cleaner(list<string> & list_cleaning){

  unordered_set<string> cleaner_set;

  for (auto & x: list_cleaning) {
    cleaner_set.insert(x);
  }

  list_cleaning.clear();

  for (auto & x: cleaner_set) {
    list_cleaning.push_back(x);
  }

}

int main(int argc, char* argv[]) {
    ifstream arq(argv[1]);

    string input;

    list<string> words;

    while (arq >> input) {
       words.push_back(input);
  }
    cleaner(words);
    words.sort();

    for (auto & output: words) {
    cout << output << endl;
  }
}
