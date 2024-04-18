#include <prglib.h>

#include <fstream>
#include <iostream>
#include <string>

using namespace std;

int main() {
  ifstream arq("nomes.txt");

  if (!arq.is_open()) {
    cout << "Arquivo invalido";

    return 0;
  }

  prglib::arvore<string> tree;

  string name, input;

  bool result;

  while (getline(arq, name)) {
    tree.adiciona(name);
  }

  while (true) {
    cout << "Consultar>";
    getline(cin, input);

    if (input.empty()) break;

    try {
      tree.obtem(input);

      cout << input << ": EXISTE" << endl;
    } catch (...) {
      cout << input << ": INEXISTENTE" << endl;
    }
  }
}
