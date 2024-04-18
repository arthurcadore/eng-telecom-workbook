
#ifndef TIPOS_IMPL_H
#define TIPOS_IMPL_H

// função para recepção de string e transformação em 2 parâmetros para
// a estrutura.
void importa_arquivo(std::string dado, std::list<dupla>& lista_de_importados) {
  // procura o primeiro caracter separador da string (nesse caso, o caracter
  // espaço)
  int first_space = dado.find_first_of(' ', 0);

  // realiza a captura das duas substrings a partir desse separador.
  std::string data_captura = dado.substr(0, first_space);
  std::string valor_captura = dado.substr(first_space + 1);

  // cria a variavel para receber a conversão de string para float, e faz a
  // conversão.
  float valor_captura_float;
  valor_captura_float = std::stof(valor_captura);

  // monta uma estrutura com o par de informações coletados.
  auto dados = dupla{data_captura, valor_captura_float};

  // adiciona essa estrutura na lista.
  lista_de_importados.push_back(dados);
}

#endif