/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include<iostream>
#include<cstdlib>

//  Definindo namespace
using namespace std;

// Programa que calcula a frequência de mulheres que bebem Dado, simulando 10.000 clientes que vão ao bar.
// 75% dos homens bebem Dado e 25% das mulheres bebem Dado.
// 3/4 dos clientes são homens e 1/4 são mulheres.

// Função principal
int main(){

    // número de clientes que vão ao bar
    int n = 10000000; 
    
    // número de homens
    // 3/4 dos clientes são homens
    int homens = 3 * n / 4; 
    
    // número de mulheres
    // 1/4 dos clientes são mulheres
    int mulheres = n / 4; 
    
    // número de homens que bebem Dado
    // 75% dos homens bebem Dado
    int dado_homem = homens * 0.75;

    // número de mulheres que bebem Dado
    // 25% das mulheres bebem Dado
    int dado_mulher = mulheres * 0.25;

    // número total de clientes que bebem Dado
    int total_dado = dado_homem + dado_mulher; 

    //  frequência de mulheres que bebem Dado
    float freq_mulher_dado = (float)dado_mulher / total_dado; 

    // imprimindo a frequência de mulheres que bebem Dado
    cout << "Frequência de mulheres que bebem Dado: " << freq_mulher_dado << endl;

    return 0;
}