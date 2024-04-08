#include "cria_classe.h"

classe cria_classe(const string& linha_csv) {
  auto string_separada = string_to_vector(linha_csv, ",");

  classe nova_classe;

  nova_classe.nome = string_separada[0];
  nova_classe.prioridade = stoi(string_separada[1]);
  nova_classe.max_espera = stoi(string_separada[2]);
  nova_classe.descricao = string_separada[3];
  nova_classe.contador_senhas = 0;

  return nova_classe;
}
