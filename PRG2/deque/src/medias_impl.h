#ifndef MEDIAS_MMS_MMP_IMPL_H
#define MEDIAS_MMS_MMP_IMPL_H

// função responsável pelo calculo da media movel simples.
void media_mms(std::list<dupla>& valores, std::list<dupla>& retorno,
               int intervalo_inteiro) {
  // Cria um deque para realização do calculo.
  auto deque_media = prg2::deque_cria<dupla>(intervalo_inteiro);

  // envia todos os dados da lista para o deque.
  for (auto i : valores) {
    prg2::deque_anexa(deque_media, i);
  }

  // entra em laço até que o tamanho do deque seja igual ao do intervalo de
  // medida.
  while (prg2::deque_tamanho(deque_media) >= intervalo_inteiro) {
    // recebe o valor da data correspondente a média que será calculada, o valor
    // é pego através da do intervalo de medida definido.
    std::string data_atual =
        prg2::deque_acessa(deque_media, intervalo_inteiro - 1).data;

    // cria outro laço de repetição para somar todos os valores dentro do
    // intervalo de média.
    float somatorio = 0;
    for (int i = 0; i <= intervalo_inteiro - 1; i++) {
      somatorio = somatorio + prg2::deque_acessa(deque_media, i).valor_medido;
    }

    // divide a somatória dos dados pelo tamanho do interválo, gerando a média
    // simples.
    float resultado = somatorio / intervalo_inteiro;

    // monta uma estrutura com os valores passados como parâmetro.
    auto estrutura_atual = dupla{data_atual, resultado};

    // remove uma estrutura do incio do deque (para avançar a média)
    prg2::deque_remove_inicio(deque_media);

    // envia a estrutura para a lista de saída.
    retorno.push_back(estrutura_atual);
  }
}

// função responsável pelo calculo da media movel ponderada.
void media_mmp(std::list<dupla>& valores, std::list<dupla>& retorno,
               int intervalo_inteiro) {
  // Cria um deque para realização do calculo.
  auto deque_media = prg2::deque_cria<dupla>(intervalo_inteiro);

  // envia todos os dados da lista para o deque.
  for (auto i : valores) {
    prg2::deque_anexa(deque_media, i);
  }

  // cria o somatório que será o divisor da média, como o valor do divisor é
  // apenas a quantidade de posições somadas, ele será igual em todos os
  // calculos. Dessa maneira pode ser definido fora do laço.
  float somatorio = 0;
  for (int j = 0; j <= intervalo_inteiro - 1; j++) {
    somatorio = somatorio + (j + 1);
  }

  // entra em laço até que o tamanho do deque seja igual ao do intervalo de
  // medida.
  while (prg2::deque_tamanho(deque_media) >= intervalo_inteiro) {
    // recebe o valor da data correspondente a média que será calculada, o valor
    // é pego através da do intervalo de medida definido.
    std::string data_atual =
        prg2::deque_acessa(deque_media, intervalo_inteiro - 1).data;

    // cria outro laço de repetição para somar todos através de seu peso com o
    // correspondente valor do somatório.
    float ponderado = 0;
    for (int i = 0; i <= intervalo_inteiro - 1; i++) {
      ponderado += (prg2::deque_acessa(deque_media, i).valor_medido * (i + 1));
    }

    // realiza a divisão dos valores passados como parâmetro para criar a média.
    float resultado = (float)(ponderado / somatorio);

    // monta uma estrutura com os valores passados como parâmetro.
    auto estrutura_atual = dupla{data_atual, resultado};

    // remove uma estrutura do incio do deque (para avançar a média)
    prg2::deque_remove_inicio(deque_media);

    // envia a estrutura para a lista de saída.
    retorno.push_back(estrutura_atual);
  }
}

#endif