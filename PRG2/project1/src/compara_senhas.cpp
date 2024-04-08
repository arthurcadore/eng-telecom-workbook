#include "compara_senhas.h"

bool compara_senhas(const senha &senha1, const senha &senha2) {
  return senha1.prioridade < senha2.prioridade;
}