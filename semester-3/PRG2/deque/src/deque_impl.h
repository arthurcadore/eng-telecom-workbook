#ifndef DEQUE_DEQUE_IMPL_H
#define DEQUE_DEQUE_IMPL_H

namespace prg2 {
template <typename T>

// remove um trecho individual.
void trecho_destroi(trecho<T>* p) {
  // destroi inicialmente a fila contida dentro do trecho, após isso, deleta o
  // próprio trecho.
  fila_destroi(p->fila);
  delete p;
}

// cria um trecho individual.
template <typename T>
trecho<T>* trecho_cria(int tam_trecho) {
  // aloca memória para a estrutura trecho utilizando o tipo de dados a ser
  // determinado.
  auto p_trecho = new trecho<T>;

  // cria uma fila dentro do trecho para armazenar os valores de dados.
  p_trecho->fila = fila_cria<T>(tam_trecho);

  // aponta a proxima posição com nullptr.
  p_trecho->proximo = nullptr;

  return p_trecho;
}

// cria um deque vazio.
template <typename T>
deque<T> deque_cria(int tam_trecho) {
  // cria um novo deque e inicia-o com um trecho.
  deque<T> dequeue;
  auto p_trecho = trecho_cria<T>(tam_trecho);

  // define os parâmetros iniciais do deque.
  dequeue.tamanho = 0;
  dequeue.primeiro = p_trecho;
  dequeue.ultimo = p_trecho;

  return dequeue;
}

// destroi o deque.
template <typename T>
void deque_destroi(deque<T>& q) {
  // realiza um laço deletando individualmente cada trecho do deque.
  for (auto trecho_atual = q.primeiro; trecho_atual != nullptr;) {
    auto proximo = trecho_atual->proximo;
    trecho_destroi(trecho_atual);
    trecho_atual = proximo;
  }

  // define novamente os parâmetros do deque para evitar seu re-uso.
  q.tamanho = 0;
  q.primeiro = nullptr;
  q.ultimo = nullptr;
}

// insere um valor no inicio do deque.
template <typename T>
void deque_insere(deque<T>& q, const T& dado) {
  // verifica se a fila no trecho inicial está cheia, nesse caso, adiciona um
  // novo trecho.
  if (fila_cheia(q.primeiro->fila)) {
    // cria variaveis auxiliares para atualizar os ponteiros do deque
    auto antigo_primeiro = q.primeiro;
    int tamanho_anterior = fila_tamanho(q.primeiro->fila);

    // faz a atualização do primeiro trecho, adicionando um novo e apontando o
    // antigo anterior como segundo trecho.
    q.primeiro = trecho_cria<T>(tamanho_anterior);
    q.primeiro->proximo = antigo_primeiro;
  }

  // insere o valor dentro da lista do primeiro trecho.
  fila_insere(q.primeiro->fila, dado);
  q.tamanho++;
}

// insere um valor no final do deque
template <typename T>
void deque_anexa(deque<T>& q, const T& dado) {
  // verifica se a fila no trecho inicial está cheia, nesse caso, adiciona um
  // novo trecho.
  if (fila_cheia(q.ultimo->fila)) {
    // cria variaveis auxiliares para atualizar os ponteiros do deque
    int tamanho_anterior = fila_tamanho(q.ultimo->fila);
    auto ultimo_trecho = trecho_cria<T>(tamanho_anterior);
    auto penultimo_trecho = q.ultimo;

    // faz a atualização do ultimo trecho, adicionando um novo após o ultimo e
    // atualizando os ponteiros do deque.
    penultimo_trecho->proximo = ultimo_trecho;
    q.ultimo = ultimo_trecho;
  }

  // insere o valor dentro da lista do ultimo trecho.
  fila_anexa(q.ultimo->fila, dado);
  q.tamanho++;
}

// remove um dado no inicio do deque;
template <typename T>
void deque_remove_inicio(deque<T>& q) {
  // verifica se o deque está vazio antes da remoção, nesse caso, retorna erro.
  if (deque_vazio(q)) {
    throw std::invalid_argument("erro de remoção, deque vazio!");
  }

  // cria variavel auxiliar para receber o proximo trecho.
  auto proximo_trecho = q.primeiro->proximo;
  // remove a fila do trecho atual.
  fila_remove_inicio(q.primeiro->fila);

  // verifica se a fila está vazia após a remoção, caso esteja, deleta o
  // promeiro trecho, e coloca o segundo como novo primeiro.
  if (fila_vazia(q.primeiro->fila)) {
    auto remover = q.primeiro;
    q.primeiro = proximo_trecho;
    fila_destroi(remover->fila);
  }
  q.tamanho--;
}

// remove um dado no final do deque
template <typename T>


void deque_remove_final(deque<T>& q) {
  // verifica se o deque está vazio antes da remoção, nesse caso, retorna erro.
  if (deque_vazio(q)) {
    throw std::invalid_argument("erro de remoção, deque vazio!");
  }

  // cria variavel auxiliar para receber o proximo trecho.
  auto& fila_final = q.ultimo->fila;

  // verifica se a fila está vazia antes da remoção, caso esteja, deleta o
  // ultio trecho, e coloca o penultimo como novo ultimo.
  if (fila_vazia(fila_final) && (q.primeiro != q.ultimo)) {
    // variavel para armazenar o valor do penultimo trecho, que se incia com o
    // valor do primeiro trecho.
    auto trecho_penultimo = q.primeiro;

    // cria laço para procurar pelo penultimo trecho.
    while (trecho_penultimo->proximo != q.ultimo) {
      trecho_penultimo = trecho_penultimo->proximo;
    }

    // destroi a fila do atual ultimo trecho e também o próprio trecho.
    fila_destroi(q.ultimo->fila);
    delete q.ultimo;

    // atualiza os ponteiros para passar o penultimo trecho para o ultimo trecho
    // no deque.
    q.ultimo = trecho_penultimo;
    q.ultimo->proximo = nullptr;

  }

  // remove um valor da fila correspondente ao final do deque.
  fila_remove_final(q.ultimo->fila);
  q.tamanho--;
}

// acessa um dado no inicio da lista.
template <typename T>
T& deque_acessa_inicio(deque<T>& q) {
  // verifica se o deque está vazio antes do acesso, nesse caso, retorna erro.

  if (fila_vazia(q.primeiro->fila)) {
    throw std::invalid_argument("erro de acesso, fila vazia!");
  }

  // coleta o valor do primeiro item na lista correspondente ao primeiro deque,
  // e o retorna.
  return fila_frente(q.primeiro->fila);
}

// acessa um dado no final da lista.
template <typename T>
T& deque_acessa_final(deque<T>& q) {
  // verifica se o deque está vazio antes do acesso, nesse caso, retorna erro.

  if (deque_vazio(q)) {
    throw std::invalid_argument("erro de acesso, fila vazia!");
  }

   if (fila_vazia(q.ultimo->fila)) {
    // variavel para armazenar o valor do penultimo trecho, que se incia com o
    // valor do primeiro trecho.
    auto trecho_penultimo = q.primeiro;

    // cria laço para procurar pelo penultimo trecho.
    while (trecho_penultimo->proximo != q.ultimo) {
      trecho_penultimo = trecho_penultimo->proximo;
    }

    // destroi a fila do atual ultimo trecho e também o próprio trecho.
    fila_destroi(q.ultimo->fila);
    delete q.ultimo;

    // atualiza os ponteiros para passar o penultimo trecho para o ultimo trecho
    // no deque.
    q.ultimo = trecho_penultimo;
    q.ultimo->proximo = nullptr;

  }
  // coleta o valor do ultimo item na lista correspondente ao ultimo deque,
  // e o retorna.
 
  return fila_atras(q.ultimo->fila);
}

// acessa um dado na posição informada no deque.
template <typename T>
T& deque_acessa(deque<T>& q, int pos) {
  // verifica se a posição a tentar ser acessada é fora do tamanho do deque,
  // nesse caso retorna erro.

  if (pos > q.tamanho - 1) {
    throw std::invalid_argument("posicao invalida no deque acessa!");
  }

  // intera o deque procurando pelo trecho correspondente a posição passada.
  auto ponteiro = q.primeiro;
  while (pos >= fila_tamanho(ponteiro->fila)) {
    pos = pos - fila_tamanho(ponteiro->fila);
    ponteiro = ponteiro->proximo;
  }

  // procura dentro do trecho encontrado a posição de dado correspondente ao
  // item procurado.
  return fila_acessa(ponteiro->fila, pos);
}

// retorna um valor inteiro com o tamanho do deque.
template <typename T>
int deque_tamanho(const deque<T>& q) {
  return q.tamanho;
}

// verifica se o deque está vazio ou não.
template <typename T>
bool deque_vazio(const deque<T>& q) {
  return q.tamanho == 0;
}

}  // namespace prg2

#endif