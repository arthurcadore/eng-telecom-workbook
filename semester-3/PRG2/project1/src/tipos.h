#ifndef TIPOS_H
#define TIPOS_H

#include <string>

#include "time.h"

using namespace std;

struct senha {
  string senha_usuario;
  time_t expiracao;
  int prioridade;
};

struct classe {
  string nome;
  int prioridade;
  int max_espera;
  string descricao;
  int contador_senhas;
};

#endif