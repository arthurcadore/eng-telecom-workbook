#ifndef DEQUE_DEQUE_H
#define DEQUE_DEQUE_H

#include "fila_circular.h"

namespace prg2 {

// define a estrutura que será utilizada pelo trecho.
template <typename T>
struct trecho {
  fila_circular<T> fila;
  trecho<T>* proximo;
  // trecho<T>* anterior;  IMPLEMENTAÇÃO FUTURA PARA DUPLO ENCADIAMENTO;
};

// define a estrutura que será utilizada pelo deque.
template <typename T>
struct deque {
  trecho<T>* primeiro;
  trecho<T>* ultimo;
  int tamanho;
};

// define um tamanho default para o deque.
int tam_default = 64;

// cria um deque vazio, neste, informa o tamanho_default definido.
template <typename T>
deque<T> deque_cria(int tam_trecho = tam_default);

// destroi o deque.
template <typename T>
void deque_destroi(deque<T>& q);

// insere um valor no inicio do deque.
template <typename T>
void deque_insere(deque<T>& q, const T& dado);

// insere um valor no final do deque
template <typename T>
void deque_anexa(deque<T>& q, const T& dado);

// remove um dado no inicio do deque;
template <typename T>
void deque_remove_inicio(deque<T>& q);

// remove um dado no final do deque
template <typename T>
void deque_remove_final(deque<T>& q);

// acessa um dado no inicio da lista.
template <typename T>
T& deque_acessa_inicio(deque<T>& q);

// acessa um dado no final da lista.
template <typename T>
T& deque_acessa_final(deque<T>& q);

// acessa um dado na posição informada no deque.
template <typename T>
T& deque_acessa(deque<T>& q, int pos);

// retorna um valor inteiro com o tamanho do deque.
template <typename T>
int deque_tamanho(const deque<T>& q);

// verifica se o deque está vazio ou não.
template <typename T>
bool deque_vazio(const deque<T>& q);

}  // namespace prg2

// inclui a implementação de cada função, definidas em outro arquivo.
#include "deque_impl.h"

#endif
