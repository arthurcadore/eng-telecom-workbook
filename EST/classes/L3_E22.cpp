/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include <iostream>
#include <cstdlib>
#include <ctime>

//  Definindo namespace
using namespace std;

// Programa que calcula a frequência de combinações de gênero de dois membros de um comite, simulando 1.000.000 de tentativas.

// Função principal
int main() {

    // número de tentativas de seleção
    int n = 10000000;

    // contadores de combinações de gênero
    int hh = 0, hm = 0, mh = 0, mm = 0;

    srand(time(NULL)); // inicializa a semente aleatória

    // Simula a seleção de dois membros aleatórios n vezes
    for (int i = 0; i < n; i++) {

        // Seleciona um número aleatório entre 0 e 5
        int membro1 = rand() % 6; 

        // Seleciona outro número aleatório diferente do primeiro
        int membro2;
        do {
            membro2 = rand() % 6;
        } while (membro2 == membro1);

        // Verifica qual foi a combinação de gênero dos membros selecionados e atualiza as contagens

        // Se os dois membros forem homens
        if ((membro1 < 4 && membro2 < 4)) {
              hh++;

        // Se um dos membros for homem e o outro mulher
        } else if ((membro1 < 4 && membro2 >= 4) || (membro1 >= 4 && membro2 < 4)) {

            // Se o primeiro membro for homem
            if (membro1 < membro2) {
                hm++;
            // Se o segundo membro for homem
            } else {
                 mh++;
            }

            // Se os dois membros forem mulheres
        } else if (membro1 >= 4 && membro2 >= 4){
            mm++;
        }
    }

    // Calcula a frequência de cada resultado
    double freq_hh = (double) hh / n;
    double freq_hm = (double) hm / n;
    double freq_mh = (double) mh / n;
    double freq_mm = (double) mm / n;

    // Imprime os resultados
    cout << "Frequência de HH: " << freq_hh << endl;
    cout << "Frequência de HM: " << freq_hm << endl;
    cout << "Frequência de MH: " << freq_mh << endl;
    cout << "Frequência de MM: " << freq_mm << endl;

    return 0;
}