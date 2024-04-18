/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include<iostream>
#include <cstdlib>

// Definindo namespace
using namespace std;

// Função principal
int main(){

  // Declarando variáveis
  int freq[3]{};

  // número de clientes hospedados
  int n = 10000000;

  // calculando a frequência de quartos com problemas no encanamento em cada hotel
  float prob_Ramada = 0.20 * 0.05;
  float prob_Sheraton = 0.50 * 0.04;
  float prob_Lakeview = 0.30 * 0.08;

  // simulando a hospedagem dos clientes
  for (int i{}; i<n; ++i){

    // gerando um número aleatório
    float rando = (float)rand() / RAND_MAX;

    // verificando em qual hotel o cliente foi hospedado
    if (rando < 0.20) {

      // cliente hospedado no Ramada Inn
      rando = (float)rand() / RAND_MAX;

      if (rando < 0.05) {

        // quarto com problema no encanamento
        freq[0]++;

      }
      
    } else if (rando < 0.70) {

      // cliente hospedado no Sheraton
      rando = (float)rand() / RAND_MAX;

      if (rando < 0.04) {

        // quarto com problema no encanamento
        freq[1]++;
      }
    } else {

      // cliente hospedado no Lakeview
      rando = (float)rand() / RAND_MAX;

      if (rando < 0.08) {

        // quarto com problema no encanamento
        freq[2]++;

      }
    }

  }

  // calculando a frequência total de quartos com problemas no encanamento
   
  // imprimindo a frequência de cada hotel 
  float freq_total = (float)(freq[0] + freq[1] + freq[2]) / n;

  // imprimindo a frequência de cada hotel
  cout << "Frequência Ramada Inn: " << (float)freq[0] / n << endl;
  cout << "Frequência Sheraton: " << (float)freq[1] / n << endl;
  cout << "Frequência Lakeview: " << (float)freq[2] / n << endl;

  // imprimindo a frequência total (somatório)
  cout << "Frequência total: " << freq_total << endl;

  // calculando a probabilidade de que uma pessoa acomodada em um quarto que apresenta problemas no encanamento esteja hospedada no Lakerview

  // probabilidade de que um quarto apresente problemas no encanamento
  float problema_hotel = (float)freq[2] / (freq[0] + freq[1] + freq[2]);

  // imprimindo a probabilidade
  cout << "Hospedada no Lakerview com problemas: " << problema_hotel << endl;

} // fim da função principal