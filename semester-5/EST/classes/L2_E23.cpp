/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include <iostream>
#include <cstdlib>
#include <ctime>

// Definindo namespace
using namespace std;

// Programa que simula um jogo de cartas, onde o jogador deve escolher 6 cartas de um baralho de 52 cartas.
// O jogador ganha se as cartas forem consecutivas e vermelhas.
// O jogador ganha 10000 reais por jogo e 6000 reais por carta consecutiva e vermelha.

int main() {

    // Declarando variáveis
    // Número de testes
    const int testes = 10000000;

    // Número de clientes
    int num_clientes = 0;

    //  Número de vitórias
    int num_vitorias = 0;
    
    // Número de devoluções
    int num_devolucoes = 0;
    
    // Lucro total
    float lucro_total = 0.0;

    // Semente para gerar números aleatórios
    srand(time(nullptr));

    // Loop para testar o jogo
    for (int i = 0; i < testes; i++) {

        // incrementando o número de clientes
        num_clientes++;

        // Verificando se o cliente devolveu a carta
        num_devolucoes += (rand() % 100) < 60; // 60% de chance de devolver a carta

        // Selecionando as cartas
        bool venceu = true;

        // Inicializando a variável que verifica se é consecutivo vermelho
        bool consecutivo_vermelho = false;

        for (int j = 0; j < 6; j++) {
        
            // Selecionando a carta
            int carta = rand() % 52;

            // Verificando a cor da carta
            bool vermelha = (carta % 2) == 0;

            // Verificando se é consecutivo vermelho
            if (vermelha) {

              // Verificando se é consecutivo vermelho
              // Se for, o cliente perde
                if (consecutivo_vermelho) {

                  // O cliente perdeu o jogo
                    venceu = false;
                    break;
                }
                consecutivo_vermelho = true;
            } else {

              // Se não for vermelha, atualiza a variável
                consecutivo_vermelho = false;
            }
        }

        // Verificando se o candidato venceu
        if (venceu) {
            // Incrementando o número de vitórias
            num_vitorias++;

            // Calculando o lucro (10000 do jogo + 6000 do prêmio);
            lucro_total += 16000.0;
        } else {

          // Calculando a perda (10000 do jogo);
            lucro_total -= 10000.0;
        }
    }

    // Imprimindo resultados
    cout << "Número de clientes: " << num_clientes << endl;
    cout << "Número de devoluções: " << num_devolucoes << endl;
    cout << "Número de vitórias: " << num_vitorias << endl;
    cout << "Lucro total: R$ " << lucro_total << endl;

    return 0;
}