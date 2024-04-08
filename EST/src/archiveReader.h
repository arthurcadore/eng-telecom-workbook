/*
Author: Arhur Cadore M. Barcella

GitHub: arthurcadore

This file contains the main code for the program.

This code is responsible for the user interface and the call of the other functions.

*/

#ifndef ARCHIVEREADER_H
#define ARCHIVEREADER_H

#include <fstream>
#include <sstream>
#include <string>
#include <iostream>

// definições das colunas de operação: 
#define NOVOSMORTOS 17
#define NOVOSCONFIRMADOS 16
#define POPULACAOESTIMADA 5
#define INDEXESTADO 15
#define COLUNADATA 2

using std::getline;
using std::ifstream;
using std::string;
using std::stringstream;
using std::cout;
using std::endl;

void importerData(string fileName, string atualState);
void statesReader(string fileName, string stateIndex, bool printCSV); 
void separator(string line, char separatorCharacter, string lineOutput[], int expectedSize, bool &sizeVerifier);

#endif  