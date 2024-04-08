/*
Author: Arhur Cadore M. Barcella

GitHub: arthurcadore

This file contains the main code for the program.

This code is responsible for the user interface and the call of the other functions.

*/

#include "main.h"


int main(int argc, char const *argv[]) {

    // Importa os dados de processamento recebidos via linha de comando: 

    // Arquivo de leitura (dataSet)
    string dataSetArchive = argv[1];
    
    // Estado a ser processado (sigla com dois digitos maiusculos): 
    string atualState = argv[2];

    // Imprimir em formato CSV ou não: 
    bool printCSV = true;
    
    // Faz a leitura do dataset linha a linha, utilizando como filtro o estado passado como argumento de linha de comando. 
    statesReader(dataSetArchive, atualState, printCSV);
}
