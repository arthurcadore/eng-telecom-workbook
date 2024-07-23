close all; clear all; clc; 

A = 5;
N = 10;

 % Gera os bits aleatórios
info = randi([0 1], 1, 10^6);

 % Realiza a superamostragem dos bits
info_up = upsample(info, n) * (2*A) - A;

filtro_tx = ones(1, N);

filtro_rx = fliplr(filtro_tx);

% Realiza a convolução dos bits superamostrados com o filtro formatador
s_t = filter(filtro_tx, 1, info_up); 

% Define o SNR a ser varrido
snr = 1:15; 

% Define o limiar de decisão
limiar = 0.1; 

for snr

    % Adiciona ruído branco gaussiano ao sinal transmitido
    r_t = awgn(s_t, snr, 'mesuared');

     % Realiza a convolução do sinal recebido com o filtro casado
    r_t_filtrado = filter(filtro_rx, 1, r_t);

    % Realiza a amostragem do sinal recebido
    Z_T = r_t_filtrado(100:N:end);

    % Realiza a decisão sobre os bits recebidos 
    info_hat = Z_T > limiar; 

     % Calcula a taxa de erro de bits
    [num, taxa] = biterr(info, info_hat);
end

