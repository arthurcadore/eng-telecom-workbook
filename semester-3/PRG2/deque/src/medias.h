#ifndef MEDIAS_MMS_MMP_H
#define MEDIAS_MMS_MMP_H

#include "deque.h"
#include "tipos.h"

// protótipo da função responsável pelo calculo da media movel simples.
void media_mms(std::list<dupla>& valores, std::list<dupla>& retorno,
               int intervalo_inteiro);

// protótipo da função responsável pelo calculo da media movel ponderada.
void media_mmp(std::list<dupla>& valores, std::list<dupla>& retorno,
               int intervalo_inteiro);

// inclui a implementação de cada função, definidas em outro arquivo.
#include "medias_impl.h"

#endif