clc; close all; clear all;
pkg load communications;

% Configuração de parâmetros
% Definindo o n° de símbolos QAM
M = 16; 

% Definindo o fator de upsampling
n = 100;

% Definindo a taxa de bits de TX
Rb = 1e4; 

% Definindo o período de bit
Tb = 1 / Rb; 

% Definindo á frequência de amostragem
Fs = Rb * n; 

% Definindo á Frequência de portadora
fc = Fs / 50;

% Definindo o Período de amostragem: 
Ts = 1 / Fs; 

% Definindo o SNR do sinal de transmissão: 
SNR = 12;

% Criando o vetor de dados: 
Vector_length = 1000; 
info = randi([0 M-1], 1, Vector_length); 

% ==============================================================
% Modulação QAM:

info_mod = qammod(info, M);

% Modulando o sinal em QAM:
scatterplot(info_mod);
title('Diagrama de constelação QAM do sinal');
xlim([-5 5]);
ylim([-5 5]);
grid on;

% Criando o vetor de tempo com base no comprimento da informação:
t = [0:Ts:(length(info_mod) * Tb - Ts)]; 

% ==============================================================
% Upsample do sinal: 

% Upsampling do sinal modulado
info_mod_up = upsample(info_mod, n); % Upsampling
filtro_NRZ = ones(1, n); % Filtro NRZ
info_mod_tx = filter(filtro_NRZ, 1, info_mod_up); % Filtragem

% ==============================================================
% Modulando para transmissão:

% Modulação usando a representação complexa
portadora = exp(1j * 2 * pi * fc * t(1:length(info_mod_tx)));
sinal_transmitido = real(info_mod_tx .* portadora);

% Plotando o sinal transmitido
figure;
subplot(211);
plot(t(1:length(sinal_transmitido)), sinal_transmitido, 'LineWidth', 2);
title('Sinal Transmitido');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

% Adicionando ruído ao sinal transmitido:
sinal_recebido = awgn(sinal_transmitido, SNR);

% Plotando o sinal recebido com ruído
subplot(212);
plot(t(1:length(sinal_recebido)), sinal_recebido, 'LineWidth', 2);
title('Sinal Recebido com Ruído');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

% ==============================================================
% Demodulação do sinal de recepção:

% Demodulação usando a representação complexa
portadora_rx = exp(-1j * (2 * pi * fc * t(1:length(sinal_recebido))));
sinal_demodulado = sinal_recebido .* portadora_rx;

% ==============================================================
% Filtrando o sinal demodulado:

% Filtragem passa-baixa para recuperar o sinal original
filtro_passa_baixa = fir1(100, fc/(Fs/2)); 
info_rx_filtered = filter(filtro_passa_baixa, 1, sinal_demodulado);

% ==============================================================
% Realizando o downsampling do sinal:

% Downsampling para retornar à taxa de amostragem original
info_rx_down = downsample(info_rx_filtered, n);

% Remover o excesso de amostras devido ao filtro
info_rx_down = info_rx_down(ceil(n/2):end);

% Plotando as componentes real e imaginária do sinal recuperado
figure;
subplot(211);
plot(real(info_rx_down), 'LineWidth', 2, 'Color', 'k');
title('Componente Real - Sinal Recebido');
xlabel('Amostras');
ylabel('Amplitude');
grid on;

subplot(212);
plot(imag(info_rx_down), 'LineWidth', 2, 'Color', 'r');
title('Componente Imaginária - Sinal Recebido');
xlabel('Amostras');
ylabel('Amplitude');
grid on;

% ==============================================================
% Reconstruindo o sinal QAM Transmitido:

% Reconstrução do sinal QAM
info_rx = real(info_rx_down) + 1i * imag(info_rx_down);

% Plotando os diagramas de constelação
scatterplot(info_mod);
xlim([-5 5]);
ylim([-5 5]);
title('Diagrama de Constelação do Sinal Transmitido');
grid on;

scatterplot(info_rx);
xlim([-5 5]);
ylim([-5 5]);
title('Diagrama de Constelação do Sinal Recebido');
grid on;

% ==============================================================
% Comparação das componentes real e imaginária: 

figure;
subplot(211);
plot(t(1:length(info_mod_tx)), real(info_mod_tx), 'LineWidth', 2, 'k');
hold on;
plot(t(1:length(info_rx_filtered)), real(info_rx_filtered), 'LineWidth', 2, 'b');
title('Comparação da Componente Real');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Transmitida', 'Recebida');
xlim([0 10 * Tb]);
ylim([-5 5]);
grid on;

subplot(212);
plot(t(1:length(info_mod_tx)), imag(info_mod_tx), 'LineWidth', 2, 'r');
hold on;
plot(t(1:length(info_rx_filtered)), imag(info_rx_filtered), 'LineWidth', 2, 'b');
title('Comparação da Componente Imaginária');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Transmitida', 'Recebida');
xlim([0 10 * Tb]);
ylim([-5 5]);
grid on;
