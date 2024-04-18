#ifndef DEQUE_FILA_CIRCULAR_H
#define DEQUE_FILA_CIRCULAR_H

#include <stdexcept>

// a definição da fila circular, que é usada pelo deque !
namespace prg2 {

template <typename T>

// define a estrutura de fila_circular.
struct fila_circular {
  T* area;  // aqui será o vetor
  int inicio;
  int fim;
  int n;           // qtde de dados armazenados
  int capacidade;  // capacidade do vetor
};

// cria uma fila a partir da capacidade passada.
template <typename T>
fila_circular<T> fila_cria(int capacidade);

// deleta a fila passada como parâmetro.
template <typename T>
void fila_destroi(fila_circular<T>& fila);

// acrescenta um dado no final da fila
template <typename T>
void fila_anexa(fila_circular<T>& fila, const T& dado);

// acrescenta um dado no início da fila
template <typename T>
void fila_insere(fila_circular<T>& fila, const T& dado);

// remove um dado do final da fila
template <typename T>
void fila_remove_final(fila_circular<T>& fila);

// remove um dado do começo da fila
template <typename T>
void fila_remove_inicio(fila_circular<T>& fila);

// acessa um dado da fila na posição passada.
template <typename T>
T& fila_acessa(fila_circular<T>& fila, int pos);

// acessa um dado da fila no inicio.
template <typename T>
T& fila_frente(fila_circular<T>& fila);

// acessa um dado da fila no final.
template <typename T>
T& fila_atras(fila_circular<T>& fila);

// verifica se a fila está vazia
template <typename T>
bool fila_vazia(fila_circular<T>& fila);

// verifica se a fila está cheia
template <typename T>
bool fila_cheia(fila_circular<T>& fila);

// verifica o tamanho da fila.
template <typename T>
int fila_tamanho(fila_circular<T>& fila);

}  // namespace prg2

// inclui a implementação de cada função, definidas em outro arquivo.
#include "fila_circular_impl.h"

#endif  // DEQUE_FILA_CIRCULAR_H