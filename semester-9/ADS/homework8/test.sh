#!/bin/bash

SERVER_IP="172.16.10.1"  # IP do servidor
TEMPO=1000
PORTA_TCP=5201
PORTA_UDP=5202
LENGTH=1000  # Comprimento do pacote 

echo "Iniciando teste UDP (9 Mbps)..."
iperf3 -c $SERVER_IP -u -b 9M -t $TEMPO -p $PORTA_UDP -l $LENGTH -R > udp_result.txt &

sleep 1  # Pequeno atraso para evitar conflito de conexão

echo "Iniciando teste TCP..."
iperf3 -c $SERVER_IP -t $TEMPO -p $PORTA_TCP -l $LENGTH -R > tcp_result.txt

echo "Testes finalizados. Resultados em udp_result.txt e tcp_result.txt"
