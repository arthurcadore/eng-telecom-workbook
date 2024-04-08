#!/bin/bash

# Author: Arhur Cadore M. Barcella
# GitHub: arthurcadore

# para cada estado, gera um arquivo .csv individual: 
./a.out caso_full.csv AC > ./binaryCode/AC.csv
./a.out caso_full.csv AL > ./binaryCode/AL.csv
./a.out caso_full.csv AM > ./binaryCode/AM.csv
./a.out caso_full.csv AP > ./binaryCode/AP.csv
./a.out caso_full.csv BA > ./binaryCode/BA.csv
./a.out caso_full.csv CE > ./binaryCode/CE.csv
./a.out caso_full.csv DF > ./binaryCode/DF.csv
./a.out caso_full.csv ES > ./binaryCode/ES.csv
./a.out caso_full.csv GO > ./binaryCode/GO.csv
./a.out caso_full.csv MA > ./binaryCode/MA.csv
./a.out caso_full.csv MG > ./binaryCode/MG.csv
./a.out caso_full.csv MS > ./binaryCode/MS.csv
./a.out caso_full.csv MT > ./binaryCode/MT.csv
./a.out caso_full.csv PA > ./binaryCode/PA.csv
./a.out caso_full.csv PB > ./binaryCode/PB.csv
./a.out caso_full.csv PE > ./binaryCode/PE.csv
./a.out caso_full.csv PI > ./binaryCode/PI.csv
./a.out caso_full.csv PR > ./binaryCode/PR.csv
./a.out caso_full.csv RJ > ./binaryCode/RJ.csv
./a.out caso_full.csv RN > ./binaryCode/RN.csv
./a.out caso_full.csv RO > ./binaryCode/RO.csv
./a.out caso_full.csv RR > ./binaryCode/RR.csv
./a.out caso_full.csv RS > ./binaryCode/RS.csv
./a.out caso_full.csv SC > ./binaryCode/SC.csv
./a.out caso_full.csv SE > ./binaryCode/SE.csv
./a.out caso_full.csv SP > ./binaryCode/SP.csv
./a.out caso_full.csv TO > ./binaryCode/TO.csv

# para todos os estados, gera um arquivo único de output
echo "Aquivo único de resultados (COVID 19) - Autor: Arthur Cadore M. B." > ./out/finalResults.csv
./binaryCode caso_full.csv AC >> ./out/finalResults.csv
./binaryCode caso_full.csv AL >> ./out/finalResults.csv
./binaryCode caso_full.csv AM >> ./out/finalResults.csv
./binaryCode caso_full.csv AP >> ./out/finalResults.csv
./binaryCode caso_full.csv BA >> ./out/finalResults.csv
./binaryCode caso_full.csv CE >> ./out/finalResults.csv
./binaryCode caso_full.csv DF >> ./out/finalResults.csv
./binaryCode caso_full.csv ES >> ./out/finalResults.csv
./binaryCode caso_full.csv GO >> ./out/finalResults.csv
./binaryCode caso_full.csv MA >> ./out/finalResults.csv
./binaryCode caso_full.csv MG >> ./out/finalResults.csv
./binaryCode caso_full.csv MS >> ./out/finalResults.csv
./binaryCode caso_full.csv MT >> ./out/finalResults.csv
./binaryCode caso_full.csv PA >> ./out/finalResults.csv
./binaryCode caso_full.csv PB >> ./out/finalResults.csv
./binaryCode caso_full.csv PE >> ./out/finalResults.csv
./binaryCode caso_full.csv PI >> ./out/finalResults.csv
./binaryCode caso_full.csv PR >> ./out/finalResults.csv
./binaryCode caso_full.csv RJ >> ./out/finalResults.csv
./binaryCode caso_full.csv RN >> ./out/finalResults.csv
./binaryCode caso_full.csv RO >> ./out/finalResults.csv
./binaryCode caso_full.csv RR >> ./out/finalResults.csv
./binaryCode caso_full.csv RS >> ./out/finalResults.csv
./binaryCode caso_full.csv SC >> ./out/finalResults.csv
./binaryCode caso_full.csv SE >> ./out/finalResults.csv
./binaryCode caso_full.csv SP >> ./out/finalResults.csv
./binaryCode caso_full.csv TO >> ./out/finalResults.csv