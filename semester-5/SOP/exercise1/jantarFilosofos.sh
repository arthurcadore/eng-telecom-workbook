#!/bin/bash

valor=100

# imprime a primera rodada utilizando 5 filósofos como parâmetro; 
echo rodada com valor == 5

# Compila o código utilizando bibliotecas lpthread e define a variável  "N" com o valor 5
gcc jantarFilosofos.c -DN=5 -o jantarFilosofos -lpthread

# Roda o código utilizando o comando "time" para medir os dados de tempo de execução
time ./jantarFilosofos 
echo

# loop de interações enquanto a variável "valor" for diferente de 1000
while [ $valor -le 1000 ]
do
  # Imprime na tela a rodada de repetição do código a partir do interador de "valor"
  echo Rodada com valor == $valor

  # Compila o código utilizando bibliotecas lpthread e define a variável  "N" com o a variável "valor".
  # Para cada interação a variável "valor" é incrementada em 100.  
 gcc jantarFilosofos.c -DN=$valor -o jantarFilosofos -lpthread
  time ./jantarFilosofos 
  echo 

  # Incrementa a variável "valor" em 100 vezes.
  valor=$((valor+100))
done
