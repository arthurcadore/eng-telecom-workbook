/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include <iostream>
#include <cstdlib>
#include <ctime>

//  Definindo namespace
using namespace std;

// programa que calcula a frequencia de duas refeições com base nas informações de consumo dos clientes. 
int main()
{
    // inicializa o gerador de números aleatórios
    srand(time(NULL)); 

    // número de clientes que vão ao restaurante (para teste)
    const int num_clientes = 10000000; 

    // número de homens
    int num_homens = 0;

    // número de clientes que preferem salada    
    int num_saladas = 0; 

    // número de clientes que preferem carne
    int num_carnes = 0; 

    // número de homens que preferem carne
    int num_homens_carnes = 0; 

    for (int i = 0; i < num_clientes; i++)
    {
        // simula o gênero do cliente
         // 75% de chance de ser homem
        bool teste_genero = (rand() % 100) < 75;

        // simula a preferência do cliente
        // 20% de homens preferem salada, 30% de mulheres preferem carne
        bool prefere_salada = (teste_genero && (rand() % 100) < 20) || (!teste_genero && (rand() % 100) >= 30); // 20% de homens preferem salada, 30% de mulheres preferem carne

        // atualiza os contadores
        // se o cliente for homem
        if (teste_genero)
        {
            // atualiza o número de homens
            num_homens++;

            // se o homem preferir carne
            if (!prefere_salada)
                //  atualiza o número de homens que preferem carne
                num_homens_carnes++;
        }
        // se o cliente prefere salada 
        // atualiza o número de clientes que preferem salada
        if (prefere_salada)
            num_saladas++;
        else
            // atualiza o número de clientes que preferem carne
            num_carnes++;
    }

    // calcula as probabilidades frequentistas
    double pH = (double) num_homens / num_clientes;
    double pA_H = (double) num_homens_carnes / num_homens;
    double pB_H = 1 - pA_H;

    // exibe os resultados
    cout << "P(H) = " << pH << endl;
    cout << "P(A|H) = " << pA_H << endl;
    cout << "P(B|H) = " << pB_H << endl;

    return 0;
}