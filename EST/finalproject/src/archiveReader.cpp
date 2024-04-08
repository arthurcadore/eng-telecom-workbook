/*
Author: Arhur Cadore M. Barcella

GitHub: arthurcadore

This file contains the implementation of the archiveReader class.

This code collect the data from csv archive and store it in a hash table.

*/

#include "archiveReader.h"

// definições das variáveis de processamento:
int totaldeaths = 0;
int totalconfirmed = 0;
int atualMonth = 1;
int atualYear = 2020;
int populationTotal = 0;
int populationMedia = 0;
int monthCounter = 0;
int mediaCounter = 0;

char separatorCharacter = ',';

// função para separar a string completa (formato YYYY-DD-MM) para strings individuais: 
void dateSub(string date, string &year, string &month, string &day) {
  year = date.substr(0, 4);
  month = date.substr(5, 2);
  day = date.substr(8, 2);
}

// função que faz o calculo da média e desvio padrão; 
// a média e desvio padrão são calculadas se o valor do mês e do ano forem iguais;
void Processing(int deaths, int confirmed, int population, string date, string state, bool print){

  // definição de strings utilizadas na função de separação: 
  string year, month, day;
  dateSub(date, year, month, day);

  // traduz as strings de ano e mês para inteiro
  // valor de dia não é utilizado pois a análise dos datasets é feita mês a mês não por dia. 
  int yearInt = stoi(year);
  int monthInt = stoi(month);

  
  while(true){

    // verifica se o mês e ano da linha atual é igual ao da linha anterior; 
    // caso sejam, realiza operações de acordo com a coluna do dataset. 
    if (atualMonth == monthInt && atualYear == yearInt){
      totaldeaths += deaths;
      totalconfirmed += confirmed;

      if(mediaCounter < 12){
      populationTotal += population;
      mediaCounter++;
      }
      break;
    }
    // caso sejam diferentes, faz a impressão dos resultados da medição e avança para uma nova data; 
    else{
      if(mediaCounter != 0){
        populationMedia = populationTotal/mediaCounter;
      }

      // verifica se a variavel de impressão (CSV) está ativa ou não, caso esteja imprime em formato CSV, caso não, em formato de texto simples.
      if(print){

        cout << atualMonth << "/" << atualYear << "," << totaldeaths << "," << totalconfirmed << "," << populationMedia << ",";
        
        if(populationMedia != 0){
        cout << ((totaldeaths*100000)/populationMedia) << "," << ((totalconfirmed*100000)/populationMedia) << endl;
        }else{
          cout << endl;
        }

      }else{

        cout << endl << endl;
        cout << "Data Atual: " << atualMonth << "/" << atualYear << endl;
        cout << "Total de mortes: " << totaldeaths << endl;
        cout << "Total de confirmados: " << totalconfirmed << endl;
        cout << "Média da populaçao: " << populationMedia << endl;

        if(populationMedia != 0){
           cout << "Média de mortes por 100k (população): " << ((totaldeaths*100000)/populationMedia) << endl;
           cout << "Média de casos confirmados por 100k (população): " << ((totalconfirmed*100000)/populationMedia) << endl;
        }
      }

      //incrementa o valor mensal e anual, varrendo todas as posições do dataset. 
      atualMonth++;
      if (atualMonth > 12){
        atualMonth = 1;
        atualYear++;
      }
      // zera os valores de população, morte, e média, para que possa se iniciar uma nova leitura. 
      totaldeaths = 0;
      totalconfirmed = 0;
      populationMedia = 0;
    }
  }
}

// função que recebe uma string como imput, o caracter separador e um vetor de strings para armazenar as palavras separadas. 
void separator(string line, char separatorCharacter, string lineOutput[], int expectedSize, bool &sizeVerifier){

  // Cria um fluxo de string para a linha.
  stringstream ss(line);

  // Cria uma variável para armazenar cada palavra da linha.
  string word;

  // Cria um contador para armazenar a posição da palavra no vetor.
  int i = 0;

  // Separa a linha em palavras, utilizando o separador ','.
  while (getline(ss, word, separatorCharacter)) {

    // Armazena a palavra no vetor.
    lineOutput[i] = word;

    // Incrementa o contador.
    i++;
  }

  // Verifica se o tamanho do vetor é o esperado.
  if (i != expectedSize) {
    // Caso não seja, retorna exeção.
    sizeVerifier = false;
    throw "Erro ao ler o arquivo csv";
  }
}

// função que recebe o nome do arquivo e o estado que se deseja filtrar.
void statesReader(string fileName, string stateIndex, bool printCSV){

  // Abre arquivo CSV
  ifstream archiveCSV(fileName);

  if (!archiveCSV.is_open()) {
    // Caso haja erro ao abrir o arquivo, retorna exeção.
    throw "Erro ao abpush_back(state);rir o arquivo csv";
  }

  if(printCSV){

    cout << "Aluno: Arthur Cadore M. Barcella - " << " Tabela do estado: " << stateIndex << endl; 

    // faz o print do cabeçalho da tabela referente ao estado "state": 
    cout << "Date" << "," << "TotalDeaths" << "," << "TotalConfirmed" << "," << "PopulationMedia" << "," << "Media M. P/100k" << "," << "Media C. P/100k" << endl; 
  }


  // Retira a primeira linha do arquivo, que contém apenas os nomes das colunas.
  string line;
  getline(archiveCSV, line);

 while (getline(archiveCSV, line)) {

    // Verifica se a linha não está vazia.
     string vetOutput[18];
     bool sizeVerifier = true;
     int expectedSize = 18;
    if (!line.empty()) {

      // Separa a linha em palavras, utilizando o separador ','.
      separator(line, separatorCharacter, vetOutput, expectedSize, sizeVerifier);
        if(sizeVerifier){

        // coleta a coluna do vetor correspondente ao estado;
        string state = vetOutput[INDEXESTADO];

        if(state == stateIndex){

          // coleta a coluna do vetor correspondente ao numero de mortos;
           int deaths = 0;
          try{
            deaths = stoi(vetOutput[NOVOSMORTOS]);
          }catch(std::exception& e){
            // Dispara exceção para erros de valores na coluna dos novos mortos: 
            cout << "Erro no valor de morte: " << vetOutput[NOVOSMORTOS] << endl;
          }
          // coleta a coluna do vetor correspondente ao numero de casos confirmados;
          int confirmed = 0;
          try{
            confirmed = stoi(vetOutput[NOVOSCONFIRMADOS]);
           }catch(std::exception& e){
            // Dispara exceção para erros de valores na coluna dos confirmados: 
            cout << "Erro no valor de confirmados: " << vetOutput[NOVOSCONFIRMADOS] << endl;
           }

          // coleta a coluna do vetor correspondente ao numero de casos confirmados;
            int population = 0;
          try{
            population = stoi(vetOutput[POPULACAOESTIMADA]);
           }catch(std::exception& e){
           }
          // coleta a coluna do vetor correspondente a data;
          string date = (vetOutput[COLUNADATA]);

          // chama a função de processamento para a linha coletada; 
          Processing(deaths, confirmed, population, date, stateIndex, printCSV);
         
        }
      }
    }
  }
}





