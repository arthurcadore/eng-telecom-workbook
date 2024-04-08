#ifndef TIPOS_H
#define TIPOS_H

#include <fstream>
#include <iostream>
#include <list>
#include <string>

// define o forma da estrutura "dupla", que será utilizada para armazenar a
// dupla de dados a serem processados.
struct dupla {
  std::string data;
  float valor_medido;
};

// protótipo da função para recepção de string e transformação em 2 parâmetros
// para a estrutura.
void importa_arquivo(std::string dado, std::list<dupla>& lista_de_importados);

// inclui a implementação de cada função, definidas em outro arquivo.
#include "tipos_impl.h"

#endif