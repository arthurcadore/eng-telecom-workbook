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

    // número de mulheres
    int num_mulheres = 0;

    // número de clientes que preferem salada
    int num_saladas = 0;

    // número de clientes que preferem carne
    int num_carnes = 0;

    // número de mulheres que preferem salada
    int num_mulheres_saladas = 0;

    for (int i = 0; i < num_clientes; i++)
    {
        // simula o gênero do cliente
        // 75% de chance de ser homem
        bool teste_genero = (rand() % 100) < 75;

        // atualiza os contadores
        if (teste_genero)
        {
            // atualiza o número de homens
            num_homens++;
        }

        // se o cliente for mulher
        else
        {
            // atualiza o número de mulheres
            num_mulheres++;

            // simula a preferência do cliente
            // 20% de mulheres preferem salada, 80% preferem carne
            bool prefere_salada = (rand() % 100) < 20;

            // se o cliente prefere salada
            if (prefere_salada)
            {
                // atualiza o número de mulheres que preferem salada
                num_mulheres_saladas++;
            }
            else
            {
                // atualiza o número de clientes que preferem carne
                num_carnes++;
            }
        }
    }

    // calcula as probabilidades frequentistas
    double pM = (double) num_mulheres / num_clientes;
    double pA_M = (double) num_mulheres_saladas / num_mulheres;

    // exibe os resultados
    cout << "P(M) = " << pM << endl;
    cout << "P(A|M) = " << pA_M << endl;
 
    return 0;
}