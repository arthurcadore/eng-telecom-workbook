#include "questao.h"

void reordena(const string& nome_arquivo) {
  ifstream arq(nome_arquivo);

  if (!arq.is_open()) {
    cout << "Arquivo invalido";
  }

  string word;

  prglib::arvore<string> arvore_palavras;

  vector<string> palavras;

  while (arq >> word) {
    palavras.push_back(word);
  }

  random_shuffle(palavras.begin(), palavras.end());

  for (auto& interator : palavras) {
    arvore_palavras.adiciona(interator);
  }

  arvore_palavras.balanceia();

  ofstream arq_output(nome_arquivo);

  for (auto interator = arvore_palavras.preorder_begin();
       interator != arvore_palavras.preorder_end(); interator++) {
    arq_output << *interator << endl;
  }
}