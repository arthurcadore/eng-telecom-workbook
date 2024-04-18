/*
	Author: Arthur Cadore M. Barcella
*/

// Incluindo bibliotecas
#include<iostream>
#include <cstdlib>

// Definindo namespace
using namespace std; 

// Prama que calcula a frequência de cada faces impares de um dado de 6 lados, simulando 10.000 lançamentos.

int main(){

  // Declarando variáveis
  int freq[6]{};

  // número de tentativas de lançamento
  int n=10000000;

  // lançando o dado
  for (int i{}; i<n; ++i){

    // gerando um número aleatório
    int rando= rand();

    // pegando o resto da divisão por 6
    int face = rando%6;

    // incrementando a frequência da face
    freq[face]++;

    }

  //	Declarando variável soma

  float soma{};

  for (int i{}; i<6; ++i){

    // imprimindo a frequência de cada face
    if (i%2==0){
      cout<<(float)freq[i]/n<<" ";
      // somando a frequência de cada face
      soma+=(float)freq[i]/n;
      }
    }

    // imprimindo a soma
    cout<<endl;
    cout<<soma<<endl;
    
}
	
