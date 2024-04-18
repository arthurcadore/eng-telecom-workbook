#include <string.h>

#include <fstream>
#include <iostream>
#include <list>
#include <string>

#include "prglib.h"

using namespace std;

int main() {
  ifstream arq("dados.txt");

  prglib::arvore<string> tree;

  string name;

  while (getline(arq, name)) {
    tree.adiciona(name);
  }

  while (true) {
    string input;
    cout << ">";
    getline(cin, input);

    if (input.empty()) break;

    string end = input;
    end.back()++;

    cout << endl;

    list<string> result;

    tree.obtemIntervalo(result, input, end);

    if (!(result.empty())) {
      result.sort();

      if (result.back() == end) result.pop_back();

      for (auto& output : result) {
        cout << output << " ";
      }
    }
    cout << endl;
  }
}
