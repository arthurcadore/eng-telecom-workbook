#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Transmissão / Recepção Digital",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "30 de Junho de 2024",
  doc,
)




= Introdução: 

= Desenvolvimento e Resultados: 

== Parte 1: 

=== Definindo parâmetros de execução:

#sourcecode[```matlab
%% Inicializando pacotes necessários: 
clc; close all; clear all;
pkg load communications;

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

% Definindo o filtro FIR passa-baixa para a recepção:
filtro_passa_baixa = fir1(100, fc/(Fs/2)); 

% Criando o vetor de dados: 
Vector_length = 1000; 
info = randi([0 M-1], 1, Vector_length); 
```]

=== Realizando a modulação QAM:

#sourcecode[```matlab
% Modulação QAM:

% Modulando o sinal em QAM:
info_mod = qammod(info, M);

% Fazendo o plot do sinal modulado:
scatterplot(info_mod);
title('Diagrama de constelação QAM do sinal');
xlim([-5 5]);
ylim([-5 5]);
info_r_real = real(info_mod);
info_i_imag = imag(info_mod);

% Criando o vetor de tempo com base no comprimento da informação:
t = [0:Ts:(length(info_r_real) * Tb - Ts)]; 
```]


#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Upsampling do sinal: 

#sourcecode[```matlab
% Criando um filtro NRZ para realizar o upsample do sinal: 
filtro_NRZ = ones(1, n);
info_r_real_up = upsample(info_r_real, n); % Upsampling
info_r_real_tx = filter(filtro_NRZ, 1, info_r_real_up); % Filtragem

% Realizando o plot no dominio do tempo: 
figure;
subplot(221);
plot(t(1:length(info_r_real_tx)), info_r_real_tx, 'LineWidth', 2, 'Color', 'k');
title('Sinal de Informação (Componente Real)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

info_i_imag_up = upsample(info_i_imag, n); % Upsampling
info_i_imag_tx = filter(filtro_NRZ, 1, info_i_imag_up); % Filtragem

subplot(222);
plot(t(1:length(info_i_imag_tx)), info_i_imag_tx, 'LineWidth', 2, 'Color', 'r');
title('Sinal de Informação (Componente Imaginário)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);
```]

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: [Componentes do sinal de transmissão]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Modulando o sinal para transmissão:

#sourcecode[```matlab
% Modulando para transmissão:

% Criando portadora Cosseno:
cos_carrier = cos(2 * pi * fc * t(1:length(info_r_real_tx)));
info_real_tx = info_r_real_tx .* cos_carrier;

% Criando portadora Seno:
sen_carrier = -sin(2 * pi * fc * t(1:length(info_i_imag_tx)));
info_imag_tx = info_i_imag_tx .* sen_carrier;

subplot(223);
plot(t(1:length(info_real_tx)), info_real_tx, 'LineWidth', 2, 'Color', 'k');
title('Componente Real - Dominio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

subplot(224);
plot(t(1:length(info_imag_tx)), info_imag_tx, 'LineWidth', 2, 'Color', 'r');
title('Componente Imaginária - Dominio do Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);
```]


#figure(
  figure(
    rect(image("./pictures/3.png")),
    numbering: none,
    caption: [Sinal de Transmissão (Sem e com ruído)]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Criando o sinal de transmissão:

#sourcecode[```matlab
% Criando o sinal de transmissão:

sinal_tx = info_real_tx + info_imag_tx;

figure;
subplot(211);
plot(t(1:length(sinal_tx)), sinal_tx, 'LineWidth', 2);
title('Sinal de Transmissão - Domínio do tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

% Adicionando ruído ao sinal transmitido
sinal_recebido = awgn(sinal_tx, SNR);

subplot(212);
plot(t(1:length(sinal_recebido)), sinal_recebido, 'LineWidth', 2);
title('Sinal de Recepção - Domínio do tempo (com Ruído)');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
ylim([-5 5]);

```]


#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: [Componentes do sinal Demoduladas e Filtradas]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Demodulando o sinal recebido:

#sourcecode[```matlab
% Demodulação do sinal de recepção:

% Ajuste do vetor de tempo:
t_rx = [0:Ts:(length(sinal_recebido) - 1) * Ts];

% Demodulando o sinal em fase e quadratura:
info_real_rx = sinal_recebido .* cos(2 * pi * fc * t_rx);
info_imag_rx = sinal_recebido .* (-sin(2 * pi * fc * t_rx));

figure;
subplot(221);
plot(t_rx(1:length(info_real_rx)), info_real_rx, 'LineWidth', 2, 'Color', 'k');
title('Componente Real - Demodulada');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);

subplot(222);
plot(t_rx(1:length(info_imag_rx)), info_imag_rx, 'LineWidth', 2, 'Color', 'r');
title('Componente Imaginária - Demodulada');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
```]

#figure(
  figure(
    rect(image("./pictures/5.png")),
    numbering: none,
    caption: [Comparando sinal de TX com sinaL de RX]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Filtrando o sinal demodulado:

#sourcecode[```matlab
% Filtrando o sinal demodulado:

% Filtrando o sinal recebido em fase e quadratura:
info_real_rx_filtered = filter(filtro_passa_baixa, 1, info_real_rx);
info_imag_rx_filtered = filter(filtro_passa_baixa, 1, info_imag_rx);

subplot(223);
plot(t_rx(1:length(info_real_rx_filtered)), info_real_rx_filtered, 'LineWidth', 2, 'Color', 'k');
title('Componente Real - Filtrada');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);

subplot(224);
plot(t_rx(1:length(info_imag_rx_filtered)), info_imag_rx_filtered, 'LineWidth', 2, 'Color', 'r');
title('Componente Imaginária - Filtrada');
xlabel('Tempo (s)');
ylabel('Amplitude');
xlim([0 10 * Tb]);
```]

=== Realizando o downsampling do sinal:

#sourcecode[```matlab
% Realizando o downsampling do sinal:

% Remover o excesso de amostras:
info_real_rx_down = downsample(info_real_rx_filtered, n);
info_imag_rx_down = downsample(info_imag_rx_filtered, n);

info_real_rx_down = info_real_rx_down(ceil(n/2):end);
info_imag_rx_down = info_imag_rx_down(ceil(n/2):end);

% Reconstruindo o sinal QAM transmitido:
info_rx = info_real_rx_down + 1i * info_imag_rx_down;

figure;
subplot(211);
plot(t(1:length(info_real_tx)), info_real_tx, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(t_rx(1:length(info_real_rx_filtered)), info_real_rx_filtered, 'LineWidth', 2);
title('Componente Real do Sinal Recebido');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Transmitida', 'Recebida (Após Filtragem)');
xlim([0 10 * Tb]);
ylim([-5 5]);

subplot(212);
plot(t(1:length(info_imag_tx)), info_imag_tx, 'LineWidth', 2, 'Color', 'b');
hold on;
plot(t_rx(1:length(info_imag_rx_filtered)), info_imag_rx_filtered, 'LineWidth', 2);
title('Componente Imaginária do Sinal Recebido');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Transmitida', 'Recebida (após Filtragem)');
xlim([0 10 * Tb]);
ylim([-5 5]);
```]

=== Plotando o sinal QAM Transmitido e Recebido:

#sourcecode[```matlab
scatterplot(info_mod);
title('Diagrama de Constelação - Sinal TX');
xlim([-5 5]);
ylim([-5 5]);

scatterplot(info_rx);
title('Diagrama de Constelação - Sinal RX');
xlim([-5 5]);
ylim([-5 5]);
```]
#figure(
  figure(
    rect(image("./pictures/6.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Transmitido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/7.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Parte 2: 

=== Definindo parâmetros de execução:

#sourcecode[```matlab
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
```]

=== Modualando o sinal QAM:

#sourcecode[```matlab
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

```]


#figure(
  figure(
    rect(image("./pictures/2.1.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Realizando o Upsampling do sinal:

#sourcecode[```matlab
% Upsample do sinal: 

% Upsampling do sinal modulado
info_mod_up = upsample(info_mod, n); % Upsampling
filtro_NRZ = ones(1, n); % Filtro NRZ
info_mod_tx = filter(filtro_NRZ, 1, info_mod_up); % Filtragem

```]

=== Modulando o sinal para transmissão:

#sourcecode[```matlab
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
```]

#figure(
  figure(
    rect(image("./pictures/2.2.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Demodulando o sinal recebido:

#sourcecode[```matlab
% Demodulação do sinal de recepção:

% Demodulação usando a representação complexa
portadora_rx = exp(-1j * (2 * pi * fc * t(1:length(sinal_recebido))));
sinal_demodulado = sinal_recebido .* portadora_rx;

```]

=== Filtrando o sinal demodulado:

#sourcecode[```matlab
% Filtrando o sinal demodulado:

% Filtragem passa-baixa para recuperar o sinal original
filtro_passa_baixa = fir1(100, fc/(Fs/2)); 
info_rx_filtered = filter(filtro_passa_baixa, 1, sinal_demodulado);

```]

=== Realizando o downsampling do sinal:

#sourcecode[```matlab
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
```]

#figure(
  figure(
    rect(image("./pictures/2.3.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Reconstruindo o sinal QAM Transmitido:

#sourcecode[```matlab
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
```]	

#figure(
  figure(
    rect(image("./pictures/2.4.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/2.5.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Comparação das componentes real e imaginária: 

#sourcecode[```matlab
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
```]

= Conclusão:

= Referências Bibliográficas: