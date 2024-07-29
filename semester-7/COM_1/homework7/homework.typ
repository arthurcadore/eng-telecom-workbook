#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set highlight(
  fill: rgb("#c1c7c3"),
  stroke: rgb("#6b6a6a"),
  extent: 2pt,
  radius: 0.2em, 
  ) 

#show: doc => report(
  title: "Modulador 16-QAM",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "30 de Junho de 2024",
  doc,
)




= Introdução: 

O objetivo deste relatório é realizar a transmissão e recepção de um sinal digital utilizando a modulação QAM (Quadrature Amplitude Modulation), o sinal será composto por um vetor de dados aleatórios com 1000 elementos, onde cada elemento obtido através dos dados aleatórios representa um diferente símbolo QAM. O sinal será modulado e transmitido, e posteriormente será recebido e demodulado, sendo possível comparar o sinal transmitido com o sinal recebido.

= Desenvolvimento e Resultados: 

O desenvolvimento do relatório foi dividido em duas partes, na primeira parte foi realizado a transmissão e recepção do sinal QAM utilizando a modulação QAM com a representação do sinal em fase e quadratura, e na segunda parte foi realizado a transmissão e recepção do sinal QAM utilizando a modulação QAM com a representação complexa.

== Parte 1: 

Para o desenvolvimento da primeira parte, foi estruturado um script em octave para realizar a transmissão e recepção do sinal QAM utilizando a modulação QAM com a representação do sinal em fase e quadratura.

=== Definindo parâmetros de execução:

A primeira etapa do desenvolvimento, é a definição das variáveis que serão utilizadas nos processos de modulação e demodulação do sinal QAM. Desta forma, defini os seguintes parâmetros:

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
```]

Em seguida, foi estruturado também o vetor de dados que será utilizado para a modulação do sinal QAM, para isso, foi gerado um vetor de dados aleatórios com 1000 elementos.

#sourcecode[```matlab 
% Criando o vetor de dados: 
Vector_length = 1000; 
info = randi([0 M-1], 1, Vector_length); 
```]

=== Realizando a modulação QAM:

Uma vez com os parâmetros definidos e o vetor de dados gerado, o primeiro passo foi realizra a modulação do sinal QAM, onde o sinal foi modulado utilizando a função #highlight[qammod] do pacote de comunicações do octave. Em seguida, os dados gerados pela função de modulação QAM podem ser visualizados através de um diagrama de constelação, utilizando a função #highlight[scatterplot].

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

Com base no diagrama de constelação gerado, é possível visualizar a representação dos símbolos QAM no plano complexo, onde cada símbolo é representado por um ponto no plano complexo, sendo a parte real do sinal representada no eixo x e a parte imaginária do sinal representada no eixo y: 

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Upsampling do sinal: 

Em seguida, foi realizado o processo de upsampling do sinal, onde o sinal modulado foi expandido para a taxa de amostragem desejada. O objetivo desse processo é aumentar a taxa de amostragem do sinal, oque melhora a qualidade do sinal e facilita a filtragem do sinal.

Para isso, foi utilizado a função #highlight[upsample] do octave, que adiciona zeros entre as amostras. Em seguida, foi criado um filtro NRZ para realizar o upsample (valor positivo) do sinal, e o sinal foi filtrado utilizando a função #highlight[filter].

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


=== Modulando o sinal para transmissão:

Em seguida, o sinal foi modulado para a transmissão, onde foi criado um sinal portadora cosseno e um sinal portadora seno, e o sinal de informação foi multiplicado por essas portadoras para realizar a modulação do sinal.


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

Desta forma, foi possível visualizar o sinal de informação antes da modulação, note que após a expansão das amostras, existem diversos zeros e uns contínuos, o que permite uma visualização "quadrada" do sinal. 

Também podemos ver o sinal após a modulação, onde o sinal foi multiplicado pela portadora cosseno e seno, e o sinal de informação foi modulado para a transmissão.

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: [Componentes do sinal de transmissão]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Criando o sinal de transmissão:

Uma vez com as componentes do sinal já moduladas, foi realizado a soma das componentes do sinal para obter o sinal de transmissão (Fase e Quadratura), oque resulta no sinal de transmissão QAM.

Em seguida, foi adicionado ruído ao sinal transmitido, utilizando a função #highlight[awgn] do octave, onde foi adicionado um ruído com a relação sinal ruído (SNR) de 12 dB. Foi utilizada a função #highlight[awgn] pois essa função adiciona ruído gaussiano branco ao sinal transmitido, oque a torna o mais próximo possível de um piso de ruído térmico.

O objetivo de adicionar ruído ao sinal transmitido é simular o ambiente de transmissão real, onde o sinal é afetado por ruídos e interferências, e assim, é possível avaliar a qualidade do sinal recebido. 

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

Desta forma, foi possível visualizar o sinal de transmissão e o sinal recebido com ruído, onde é possível observar a diferença entre o sinal transmitido e o sinal recebido, e a presença do ruído no sinal recebido.

#figure(
  figure(
    rect(image("./pictures/3.png")),
    numbering: none,
    caption: [Sinal de Transmissão (Sem e com ruído)]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Demodulando o sinal recebido:

Na recepção do sinal, o sinal recebido foi demodulado utilizando a representação do sinal em fase e quadratura, onde o sinal recebido foi multiplicado pela portadora cosseno e seno, retornando o sinal para a banda base. 


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

=== Filtrando o sinal demodulado:

Com o sinal já demodulado, foi filtrado utilizando um filtro passa-baixa para recuperar o sinal original, e o sinal foi filtrado utilizando a função #highlight[filter] do octave com base nos parâmetros definidos anteriormente.

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

Desta forma, foi possível visualizar as componentes do sinal demoduladas, onde é possível observar a diferença entre o sinal transmitido e o sinal recebido, e a presença do ruído no sinal recebido: 

#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: [Componentes do sinal Demoduladas e Filtradas]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Realizando o downsampling do sinal:

Uma vez com o sinal filtrado, podemos realizar o downsampling do sinal para retornar a taxa de amostragem original, onde o sinal foi decimado para a taxa de amostragem original, e o excesso de amostras foi removido.



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

Desta forma, foi possível visualizar a comparação entre as componentes do sinal transmitido e do sinal recebido, onde é possível observar a diferença entre o sinal transmitido e o sinal recebido, e a presença do ruído no sinal recebido:

#figure(
  figure(
    rect(image("./pictures/5.png")),
    numbering: none,
    caption: [Comparando sinal de TX com sinaL de RX]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Plotando o sinal QAM Transmitido e Recebido:

Com os sinais antes da transmissão e após a recepção, é possivel reconstruir o sinal QAM transmitido e verificar o sinal QAM recebido. 

Assim, podemos plotar os diagramas de constelação dos sinais transmitidos e recebidos e realizar um comparativo entre ambos.

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

Abaixo está o diagrama 16-QAM antes da transmissão, note que os pontos estão bem definidos e separados, oque indica que o sinal está bem modulado.
#figure(
  figure(
    rect(image("./pictures/6.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Transmitido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo está o diagrama 16-QAM após a recepção, note que os pontos estão mais próximos e dispersos, oque indica que o sinal foi afetado pelo ruído e interferências, e a qualidade do sinal foi reduzida.

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