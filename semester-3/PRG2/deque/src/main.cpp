
#include "main.h"

// Imprime os valores da lista de resultados.
void imprime_retorno(std::list<dupla> output) {
  // recebe o valor total da lista, para realizar o laço completo.
  int saida = output.size();

  for (int i = 0; i < saida; i++) {
    // faz a impressão setando o valor de precisão em 2 casas decimais.
    std::cout << output.front().data << " " << std::fixed
              << std::setprecision(2) << output.front().valor_medido
              << std::endl;

    output.pop_front();
  }
}

int main(int argc, char* argv[]) {
  // recebe o nome do arquivo em variavel e realiza sua abertura.
  auto arquivo_input = argv[1];
  std::ifstream arquivo(arquivo_input);

  // Caso haja erro ao abrir o arquivo, retorna erro.
  if (!arquivo.is_open()) {
    throw std::invalid_argument("Erro ao abrir o arquivo!");
  }

  // recebe o valor do intervalo de média em uma string.
  std::string media_intervalo_input = argv[2];

  // inicializa uma variavel para auxiliar no procedimento de conversão stoi.
  int intervalo_inteiro;

  // tenta realizar a conversão stoi, caso o valor de entrada não seja
  // compativel com um inteiro, retorna erro.
  try {
    intervalo_inteiro = std::stoi(media_intervalo_input);

  } catch (...) {
    throw std::invalid_argument(
        "O valor de intervalo informado não é compativel!");
  }

  // cria uma variável string padrão com o tipo de média padrão "mms"
  std::string media_tipo = "mms";

  // verifica se há um 4 argumento de linha de comando (responsável pelo tipo de
  // média) caso tenha, iguala a string padrão a esse valor de entrada.
  if (argc == 4) {
    std::string media_input = argv[3];
    media_tipo = media_input;
  }

  // verifica se o valor de tipo de média corresponde a um dos valores
  // propostos, caso não retorna erro.
  if (media_tipo != "mms" && media_tipo != "mmp") {
    throw std::invalid_argument("O tipo de media precisa ser 'mmp' ou 'mms'");
  }

  // listas de struct responsáveis por receber os dados do arquivo, e retornar
  // com os dados de calculo de média.
  std::list<dupla> valores, retorno;

  // string resposável por capturar o valor de cada linha do arquivo
  // individualmente.
  std::string line;

  // loop para carregar todas as linhas do arquivo para a lista "valores"
  while (std::getline(arquivo, line)) {
    importa_arquivo(line, valores);
  }

  // verifica o conteúdo da variavel "media_tipo", como ela pode assumir apenas
  // 2 valores, chama a função media corresponde ao valor da variavel.
  if (media_tipo == "mms") {
    media_mms(valores, retorno, intervalo_inteiro);
  } else {
    media_mmp(valores, retorno, intervalo_inteiro);
  }

  // chama a função responsável pela impressão do arquivo.
  imprime_retorno(retorno);
}
