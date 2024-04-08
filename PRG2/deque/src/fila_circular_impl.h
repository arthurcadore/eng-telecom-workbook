#ifndef DEQUE_FILA_CIRCULAR_IMPL_H
#define DEQUE_FILA_CIRCULAR_IMPL_H

namespace prg2 {

// realiza o deslocamento da variavel "pos" de acordo com sua posição na fila,
// incrementando o valor incial.
static int incremento_circular(int pos, int capacidade, int incremento = 1) {
  return (pos + incremento) % capacidade;
}

// realiza o deslocamento da variavel "pos" de acordo com sua posição na fila.
// decrementando o valor inicial
static int decremento_circular(int pos, int capacidade) {
  if (pos == 0) {
    pos = capacidade - 1;
  } else {
    pos--;
  }
  return pos;

  if (pos == 0) {
    return capacidade - 1;
  } else {
    return pos - 1;
  }
}

// cria uma fila
template <typename T>
fila_circular<T> fila_cria(int capacidade) {
  // caso a capacidade passada como parâmetro, retorna erro.
  if (capacidade <= 0) {
    throw std::invalid_argument("capacidade deve ser > 0 !");
  }

  // cria a fila e nesta adiciona todos os valores iniciais.
  fila_circular<T> fila;
  fila.inicio = 0;
  fila.fim = 0;
  fila.n = 0;
  fila.capacidade = capacidade;
  fila.area = new T[capacidade];

  return fila;
}

// deleta a fila passada como parâmetro.
template <typename T>
void fila_destroi(fila_circular<T>& fila) {
  // deleta a área de memória correspondente a armezenar os dados.
  delete[] fila.area;

  // iguala os demais parâmetros da fila a 0, ou nullptr, para impedir o uso da
  // fila novamente.
  fila.area = nullptr;
  fila.n = 0;
  fila.inicio = 0;
  fila.fim = 0;
  fila.capacidade = 0;
}

// acrescenta um dado no final da fila
template <typename T>
void fila_anexa(fila_circular<T>& fila, const T& dado) {
  // verifica se a fila está cheia antes de adicionar um dado a mesma, caso
  // esteja, retorna erro de inserção.

  if (fila_cheia(fila)) {
    throw std::invalid_argument("fila cheia");
  }
  // reliza a inserção do dado na fila.
  fila.area[fila.fim] = dado;
  fila.n++;

  // altera o valor do ponteiro em uma unidade.
  fila.fim = incremento_circular(fila.fim, fila.capacidade);
}

// acrescenta um dado no início da fila
template <typename T>
void fila_insere(fila_circular<T>& fila, const T& dado) {
  // verifica se a fila está cheia antes de adicionar um dado a mesma, caso
  // esteja, retorna erro de inserção.

  if (fila_cheia(fila)) {
    throw std::invalid_argument("fila cheia");
  }

  // altera o valor do ponteiro em uma unidade.
  fila.inicio = decremento_circular(fila.inicio, fila.capacidade);

  // reliza a inserção do dado na fila.
  fila.area[fila.inicio] = dado;
  fila.n++;
}

// remove um dado do final da fila
template <typename T>
void fila_remove_final(fila_circular<T>& fila) {
  // verifica se a fila está vazia antes de retirar um dado a mesma, caso
  // esteja, retorna erro de remoção.
  if (fila_vazia(fila)) {
    throw std::invalid_argument("fila vazia");
  }

  // altera a posição do ponteiro, tornando o valor inacessivel (deletado)
  fila.fim = decremento_circular(fila.fim, fila.capacidade);
  fila.n--;
}

// remove um dado do começo da fila
template <typename T>
void fila_remove_inicio(fila_circular<T>& fila) {
  // verifica se a fila está vazia antes de retirar um dado a mesma, caso
  // esteja, retorna erro de remoção.
  if (fila_vazia(fila)) {
    throw std::invalid_argument("fila vazia");
  }

  // altera a posição do ponteiro, tornando o valor inacessivel (deletado)
  fila.inicio = incremento_circular(fila.inicio, fila.capacidade);
  fila.n--;
}

// acessa um dado de uma posição especifica da fila
template <typename T>
T& fila_acessa(fila_circular<T>& fila, int pos) {
  // verifica se a fila está vazia antes de retirar um dado a mesma, caso
  // esteja, retorna erro de acesso.
  if (fila_vazia(fila)) {
    throw std::invalid_argument("fila vazia");
  }

  // verifica se a posição setada é maior que o comprimento da fila, neste caso,
  // retorna erro.
  if (pos >= fila.n) {
    throw std::invalid_argument("posicao invalida: " + std::to_string(pos));
  }

  // realiza o incremente circular da fila passada como parâmetro até encontrar
  // o valor correspondente ao procurado na lista.
  pos = incremento_circular(fila.inicio, fila.capacidade, pos);
  return fila.area[pos];
}

// retorna o dado da frente da fila;
template <typename T>

// retorna valor a frente da lista, caso a lista esteja vazia, retorna erro.
T& fila_frente(fila_circular<T>& fila) {
  if (fila_vazia(fila)) {
    throw std::invalid_argument("fila vazia");
  }
  return fila.area[fila.inicio];
}

// retorna o ultimo dado da fila, caso a lista esteja vazia, retorna erro.
template <typename T>
T& fila_atras(fila_circular<T>& fila) {
  if (fila_vazia(fila)) {
    throw std::invalid_argument("fila vazia");
  }

  // realiza o incremento circular com o número de posições da fila, indo até o
  // ultimo valor disponivel para acesso.
  int pos = decremento_circular(fila.fim, fila.capacidade);
  return fila.area[pos];
}

// verifica se a fila está vazia
template <typename T>
bool fila_vazia(fila_circular<T>& fila) {
  return fila.n == 0;
}

// verifica se a fila está cheia
template <typename T>
bool fila_cheia(fila_circular<T>& fila) {
  return fila.n == fila.capacidade;
}

// retorna o tamanho da fila
template <typename T>
int fila_tamanho(fila_circular<T>& fila) {
  return fila.n;
}

}  // namespace prg2

#endif  // DEQUE_FILA_CIRCULAR_IMPL_H