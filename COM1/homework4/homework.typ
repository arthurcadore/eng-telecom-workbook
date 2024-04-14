#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Modulação e Demodulação em Frequência (FM)",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "09 de Abril de 2024",
  doc,
)

= Introdução

O objetivo deste relatório é apresentar o desenvolvimento de um sistema de modulação e demodulação em frequência (FM) para sinais de áudio. O sistema foi desenvolvido através de linguagem MATLAB (Octa ve), e tem como objetivo principal a compreensão do processo de modulação e demodulação em frequência, bem como a análise dos sinais modulados e demodulados.
\

Neste relatório será apresentado a fundamentação teórica do processo de modulação e demodulação em frequência, bem como a análise dos sinais modulados e demodulados, os scripts MATLAB utilizados e os resultados obtidos.
\

Desta forma, poderemos compreender o processo de modulação e demodulação FM, bem como a análise dos sinais modulados e demodulados, e a importância deste processo para a transmissão de sinais de áudio em sistemas de comunicação.

= Fundamentação teórica

== Principais Conceitos

Os principais conceitos teóricos abordados neste relatório são: 

- Modulação FM: A modulação em frequência (FM) é um processo de modulação em que a frequência da portadora é variada de acordo com a amplitude do sinal modulante. A variação da frequência da portadora é proporcional à amplitude do sinal modulante, resultando em um sinal modulado em frequência. A modulação em frequência é amplamente utilizada em sistemas de comunicação para transmissão de sinais de áudio, devido à sua alta qualidade de áudio e baixa interferência.

- Demodulação FM: A demodulação em frequência é o processo de recuperar o sinal modulante original a partir do sinal modulado em frequência. A demodulação FM é realizada através da diferenciação do sinal modulado, que resulta em um sinal que contém a informação de frequência do sinal modulante original. O sinal demodulado é então filtrado para remover as frequências indesejadas e obter o sinal de áudio original.

- Sinal Portador: O sinal portador é um sinal (tipicamente de alta frequência) que é modulado pela informação do sinal modulante. O sinal portador é a base para a transmissão do sinal modulado em frequência e é recuperado na demodulação para obter o sinal de áudio original.

- Sinal Modulante: O sinal modulante é o sinal de áudio que é modulado em frequência para transmissão em sistemas de comunicação. O sinal modulante é a informação que é transmitida através da variação da frequência da portadora.

== Resumo dos Itens abordados (Material de Referência)

Além dos conceitos base apresentados acima, o material de referência também aborda os seguintes tópicos, que são importantes para o entendimento do processo de modulação e demodulação em frequência (itens 9.1, 9.2, 9.3 e 9.4). 

=== The history of the FM Standard 

Objetivo: Apresentar a modulação em frequência (FM) e sua importância para a transmissão de sinais de áudio em sistemas de comunicação.
\

Nesta sessão do livro, o autor apresenta a história da modulação em frequência (FM) e sua importância para a transmissão de sinais de áudio em sistemas de comunicação. O nacimento da modulação em frequência ocorreu em 1933 com o americano Edwin Howard Armstrong, que desenvolveu e demonstrou a rádio FM como uma solução para o "problema do ruído estático". 
\

Em 1912, Edwin Armstrong descobriu que, se as ondas eletromagnéticas emitidas pelos receptores de rádio (de válvula de vidro) fossem alimentadas de volta através do hardware (circuito de RF), a intensidade do sinal aumentava, e assim, ondas de rádio eram geradas.
\

De acordo com o livro, ele chamou esse processo de feedback positivo de regeneração, e é considerado uma das descobertas mais importantes na história do rádio, pois significava que receptores de rádio também poderiam ser usados como transmissores.

=== The mathematics of FM & the Modulation Index 

Objetivo: Apresentar a matemática da modulação em frequência (FM) e o índices de modulação FM.

Nesta sessão, o autor explica sobre a construção de um modulador FM analógico através de um VCO (Voltage Controller Oscillator). O VCO gera um sinal senoidal cuja fase (e, portanto, efetivamente a frequência) muda em resposta a variações de amplitude de um sinal de controle de entrada. 
\

Quando o sinal modulante é inserido no VCO, ele é multiplicado por uma constante (k_f) que representa a relação de variação de tensão proporcional a variação de frequência. 
\ 
Assim, conforme o sinal modulante varia (supondo uma senoide por exemplo), o sinal modulado tem sua frequência variada na mesma proporção que a variação de tensão ao longo do tempo. 
\
A fase do senoide é determinada pelo valor instantâneo de tensão do sinal modulante, e a frequência do sinal modulado é determinada pela taxa de variação da fase do sinal modulante.

=== FM Signal Bandwidth

Objetivo: Apresentar a largura de banda do sinal FM e as diferenças entre NFM (Narrowband FM) e WFM (Wideband FM).

Nesta sessão, o autor apresenta a largura de banda do sinal FM e as diferenças entre NFM (Narrowband FM) e WFM (Wideband FM). A largura de banda do sinal FM é determinada pela taxa de variação da frequência do sinal modulante. 
\

A modulação em frequência é considerada um processo de Banda Estreita ou Banda Larga, e o valor do índice de modulação determina isso.  Se o índice de modulação de um sinal FM for << 1, é considerado FM de Banda Estreita (NFM), enquanto se for >> 1, é FM de Banda Larga (WFM).

==== NFM (Narrowband FM): 

A modulação em frequência de banda estreita (NFM) é caracterizada por um índice de modulação << 1, resultando em um desvio de frequência máximo limitado, geralmente em torno de 5kHz. Neste cenário, as aproximações podem ser feitas para simplificar os cálculos, já que a contribuição da frequência instantânea é negligenciável. A equação de modulação FM pode ser expandida usando identidades trigonométricas apropriadas. A NFM é comumente usada em aplicações como comunicações de rádio bidirecionais e sistemas de rádio de curto alcance, onde a largura de banda é limitada e a fidelidade do sinal é essencial.

==== WFM (Wideband FM):

A modulação em frequência de banda larga (WFM) é o padrão usado por estações de rádio comerciais, caracterizado por um índice de modulação >> 1. Neste caso, o desvio de frequência máximo permitido é maior, frequentemente em torno de 75kHz. A WFM oferece uma qualidade de áudio superior à NFM, mas requer uma largura de banda maior. Durante o processo de modulação, são criadas um número infinito de bandas laterais ao redor da frequência da portadora, o que exige uma limitação da largura de banda para evitar interferências entre canais. As estações de rádio FM geralmente são separadas por 0,2MHz nos receptores analógicos devido a essa limitação de largura de banda.

=== FM Demodulation Using Differentiation 

Objetivo: Apresentar a demodulação em frequência utilizando a diferenciação do sinal modulado.
\

Nesta seção, o autor descreve o processo de demodulação do sinal FM modulado através de diferenciação do sinal recebido. Para o sinal transmitido (e recebido perfeitamente), um novo sinal diferenciado denotado como (onde o traço denota a derivada) é gerado pelo receptor. 
\

Neste método, o sinal terá a aparência de um sinal AM-DSB-TC no domínio do tempo, pois possui uma envoltória de informação (embora, ao contrário de uma envoltória AM padrão, a frequência do componente da portadora ainda muda). De acordo com o autor, as flutuações nesta envoltória são diretamente proporcionais à frequência instantânea do sinal modulado, que deve ser diretamente proporcional à amplitude do sinal de informação original.
\

Se considerarmos que o termo senoidal de alta frequência pode ser removido por um detector de envoltória (utilizado nos scripts matlab descritos neste documento, veja o código abaixo), fica claro que a amplitude da envoltória é diretamente proporcional à amplitude do sinal de informação. Embora tenha um deslocamento DC (e ganho de resultante da constante de modulação FM), o sinal de áudio original pode ser recuperado com precisão.s

#sourcecode[```matlab
% Calculating the FM demodulation for the modulated signal
demodulated_signal = diff(modulated_signal) * fs / k0;
demodulated_signal = [demodulated_signal, 0];  % Sinal demodulado

% calculating the FFT of the random signal;
demodulated_f = fft(demodulated_signal)/length(demodulated_signal);
demodulated_f = fftshift(demodulated_f);

% Calculating the signal wrap. 
demodulated_wrap = abs(hilbert(demodulated_signal));
```]


= Análise dos resultados

== Sinal de áudio Aleatório: 

Inicialmente, foi feita a importação de um sinal de áudio para ser utilizado como modulante da portadora em frequência, para transmissão em FM. 

A figura abaixo mostra o plot do sinal no domínio do tempo, bem como seu respectivo plot do sinal no domínio da frequência.

#figure(
  figure(
    image("./pictures/timeDomain.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Uma vez com o sinal de entrada definido, a modulação em frequência foi realizada através da integração do argumento de fase da portadora a partir do sinal da modulante, conforme o script abaixo: 

#sourcecode[```matlab
% Creating the FM modulated signal: 
phase_argument = 2*pi*k_f*cumsum(modulating_signal)*(Ts);
modulated_signal = A_carrier * cos(2*pi*f_carrier*t + phase_argument);
```]

Onde na figura acima os parâmetros são: 

-  `modulating_signal` é o sinal de áudio importado. 
-  `k_f` é a sensibilidade do modulador para variação de frequência. 
-  `Ts` é o período de amostragem do sinal.
-  `A_carrier` é a amplitude da portadora
-  `f_carrier` é a frequência da portadora. 
-  `t` é o vetor de tempo do sinal modulado (utilizado para realizar a modulação em FM).
-  `phase_argument` é o argumento de fase da portadora do sinal, gerado a partir da integração do sinal modulante.
-  `modulated_signal` é o sinal modulado em FM.

Uma vez com o sinal modulado em FM, podemos compreender o formato do sinal modulado no domínio do tempo e da frequência, conforme a figura abaixo:

#figure(
  figure(
    image("./pictures/FrequencyDomain.png"),
    numbering: none,
    caption: [Sinal modulado em FM no domínio do tempo e da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Uma vez com o sinal modulado, e multiplexado, podemos transmiti-lo pelo meio físico sem que haja interferência entre cada portadora (idealmente). O sinal no meio físico é ilustrado abaixo em azul. 
\

#figure(
  figure(
    image("./pictures/Modulated.png"),
    numbering: none,
    caption: [Sinal modulado e "transmitido" no meio físico]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Na recepção do sinal, precisamos realizar sua demodulação para ter novamente o sinal de áudio original. Para isso, utilizamos um demodulador FM, que é basicamente um circuito que realiza a derivação do sinal modulado, conforme o script abaixo:

#sourcecode[```matlab
% Calculating the FM demodulation for the modulated signal
demodulated_signal = diff(modulated_signal) * fs / k0;
demodulated_signal = [demodulated_signal, 0];  % Sinal demodulado

% calculating the FFT of the random signal;
demodulated_f = fft(demodulated_signal)/length(demodulated_signal);
demodulated_f = fftshift(demodulated_f);

% Calculating the signal wrap. 
demodulated_wrap = abs(hilbert(demodulated_signal));
```]

Com o sinal demodulado, utilizamos um filtro passa-baixas para eliminar as frequências indesejadas, e obter o sinal de áudio original.

Para isso, foi utilizado um filtro FIR de ordem relativamente alta (neste caso 100), com frequência de corte de 20kHz. A frequência neste script foi fixada em 20kHz, pois trata-se de um sinal de áudio, e portanto, não há informação relevante acima desta frequência para ser capturada. 

Para verificar se de fato o filtro está atuando corretamente, abaixo está um plot da resposta em frequência do filtro FIR:

#figure(
  figure(
    image("./pictures/filter.png"),
    numbering: none,
    caption: [Resposta em frequência do filtro FIR]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Com o sinal demodulado e filtrado, podemos realizar seu plot no dominio do tempo e também realizar a FFT do sinal para observar as componentes de frequência do sinal demodulado.

#figure(
  figure(
    image("./pictures/Demodulated.png"),
    numbering: none,
    caption: [Sinal demodulado no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos observar, o sinal demodulado é muito semelhante ao sinal de áudio original, com pequenas distorções devido ao processo de modulação e demodulação em frequência.

O sinal também foi plotado no dominio do tempo e da frequência, para verificar se o sinal demodulado está correto.

#figure(
  figure(
    image("./pictures/DemodulatedF.png"),
    numbering: none,
    caption: [Sinal demodulado no domínio da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Sinal Senoidal Modulante

Devido as variações no processo de modulação e demodulação apresentadas anteriormente, foi feita a análise de um sinal puramente senoidal como modulante em FM, para verificar se o processo de modulação e demodulação em frequência está correto. 

Inicialmente, foi feita a definição dos parâmetros do sinal modulante e em seguida o plot do mesmo no dominio do tempo e também da frequência: 

#figure(
  figure(
    image("./pictures/timeDomain-Sin.png"),
    numbering: none,
    caption: [Sinal senoidal modulante no domínio do tempo e da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Em seguida, com o sinal modulante definido, foi feita a modulação em frequência do sinal senoidal, note que para esse processo de modulação, o sinal modulante é uma senoide pura, e portanto, o sinal modulado em FM possui uma variação suave e periódica de frequência ao longo do tempo. 
\

Sendo assim possivel analisar o sinal modulado no dominio do tempo e da frequência, conforme a figura abaixo:

#figure(
  figure(
    image("./pictures/FrequencyDomain-Sin.png"),
    numbering: none,
    caption: [Sinal modulado em FM no domínio do tempo e da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Com o sinal modulado em FM definido, podemos transmiti-lo pelo meio físico, e realizar a demodulação do sinal para obter o sinal senoidal original.

Na recepção, foi feita a demodulação do sinal modulado, e em seguida a filtragem do sinal demodulado para obter o sinal senoidal original, a figura abaixo mostra o sinal demodulado no dominio do tempo:

#figure(
  figure(
    image("./pictures/Demodulated-Sin.png"),
    numbering: none,
    caption: [Sinal demodulado no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Novamente, para verificar se o sinal demodulado está correto, foi feita a análise do sinal demodulado no dominio da frequência, conforme a figura abaixo:

#figure(
  figure(
    image("./pictures/DemodulatedF-Sin.png"),
    numbering: none,
    caption: [Sinal demodulado no domínio da frequência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Scripts e Códigos Utilizados:

== Definições Iniciais

O script abaixo define as variáveis iniciais do sistema, como a amplitude dos sinais, a frequência do sinal modulante, a frequência da portadora, a sensibilidade do modulador para variação de frequência, e o período de amostragem do sinal.

#sourcecode[```matlab
close all; clear all; clc;
pkg load signal;

% Altera o tamanho da fonte nos plots para 15
set(0, 'DefaultAxesFontSize', 20);

% Defining the signals amplitude.
A_modulating = 1;
A_carrier = 1;

% Defining the signals frequency
f_modulating_max = 20000;
f_carrier = 80000;

% modulator sensibility for frequency variation (Hz/volts)
k_f = 2000000;
k0 = 2*pi*k_f;

% Delta variable, correponding to max frequency variation.
d_f = k_f*A_modulating;

% Beta variable, correspondig to percentage of frequency variation about the frequency of the modulating.
b = d_f/f_modulating_max;

% Defining the period and frequency of sampling:
fs = 50*f_carrier;
Ts = 1/fs;
T = 1/f_modulating_max;

% Defining the sinal period.
t_inicial = 0;
t_final = 2;

% "t" vector, correspondig to the time period of analysis, on time domain.
t = [t_inicial:Ts:t_final];
```]

== Sinal modulante e Modulado FM

O script abaixo importa um sinal de áudio para ser utilizado como modulante da portadora em frequência, e em seguida realiza a modulação em frequência do sinal modulante.

#sourcecode[```matlab	

% Import the audioSignal to use as modulating FM signal: 
[modulating_signal, Hs] = audioread('randomSignal.wav');
modulating_signal = transpose(modulating_signal);

% Calculate the number of zeros to be added
num_zeros = length(t) - length(modulating_signal);

% Add the zeros to the end of the modulating_signal vector
modulating_signal = [modulating_signal, zeros(1, num_zeros)];

% Transpose the modulated signal if necessary
modulated_signal = transpose(modulating_signal);

% Creating the FM modulated signal:
phase_argument = 2*pi*k_f*cumsum(modulating_signal)*(Ts);
modulated_signal = A_carrier * cos(2*pi*f_carrier*t + phase_argument);

% Plot signals on time domain:
figure(1)
subplot(311)
plot(t, (modulating_signal),'b', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Time (s)')
ylabel('Amplitude')
title('Random Sound Signal (Time Domain)')

subplot(312)
plot(t, abs(modulating_signal),'r', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Time (s)')
ylabel('Amplitude')
title('Random Sound Signal - Absolute (Time Domain)')

subplot(313)
plot(t, modulated_signal,'k', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Time (s)')
ylabel('Amplitude')
title('Modulated FM Signal (Time Domain)')
```]

== FFT dos sinais modulantes

O script abaixo calcula a FFT dos sinais modulantes e modulados, e em seguida realiza o plot dos sinais no domínio da frequência.

#sourcecode[```matlab
% calculating the step of the frequency vector "f" (frequency domain);
f_step = 1/t_final;

% creating the frequency vector "f" (frequency domain);
f = [-fs/2:f_step:fs/2];

% calculating the FFT of the random signal;
modulating_f = fft(modulating_signal)/length(modulating_signal);
modulating_f = fftshift(modulating_f);

% calculating the FFT of the modulated signal;
modulated_f = fft(modulated_signal)/length(modulated_signal);
modulated_f = fftshift(modulated_f);

% Plotting the modulated signal on frequency domain;
figure(2)
subplot(211)
plot(f, abs(modulating_f), 'k', 'LineWidth', 2)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Modulating Signal (Frequency Domain)')
xlim([-f_carrier*1.2 f_carrier*1.2])
ylim([0 A_carrier/1000])

subplot(212)
plot(f, abs(modulated_f), 'k', 'LineWidth', 2)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Modulated Signal (Frequency Domain)')
xlim([-f_carrier*1.2 f_carrier*1.2])
ylim([0 A_carrier/1000])
```]

== Demodulação do sinal e Filtro

O script abaixo realiza a demodulação do sinal modulado, e em seguida realiza a filtragem do sinal demodulado para obter o sinal de áudio original.

#sourcecode[```matlab
% Calculating the FM demodulation for the modulated signal
demodulated_signal = diff(modulated_signal) * fs / k0;
demodulated_signal = [demodulated_signal, 0];  % Sinal demodulado

% Ordem do filtro FIR
filtro_ordem = 100;

% Frequência de corte do filtro FIR 
% Como trata-se de um sinal de áudio, a frequência de corte pode ser fixada em 20kHz
frequencia_corte = 20000;

% Coeficientes do filtro FIR para cada sinal demodulado
coeficientes_filtro = fir1(filtro_ordem, frequencia_corte/(fs/2));

% Resposta em frequência do filtro FIR para cada sinal demodulado
[H_fir, f_fir] = freqz(coeficientes_filtro, 1, length(t), fs);
  
% Plot da resposta em frequência do filtro:
figure(6)
plot(f_fir, abs(H_fir), 'r', 'LineWidth', 3)
xlim([0 frequencia_corte*1.1])
title('Resposta em Frequência do Filtro FIR')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
```]

== Filtragem e plotagem dos sinais resultantes

O script abaixo realiza a filtragem do sinal demodulado, e em seguida realiza o plot dos sinais modulados e demodulados no domínio do tempo e da frequência.

#sourcecode[```matlab
% Filtragem dos sinais demodulados
demodulated_filtered = filter(coeficientes_filtro, 1, demodulated_signal);

% calculating the FFT of the random signal;
demodulated_filtered_f = fft(demodulated_filtered)/length(demodulated_filtered);
demodulated_filtered_f = fftshift(demodulated_filtered_f);

% Calculating the signal wrap. 
demodulated_wrap = abs(hilbert(demodulated_filtered));

% Plotting the modulated and demodulated signals on time domain:
figure(3)
subplot(311)
plot(t, modulated_signal, 'k', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sinal Modulado FM (Domínio do Tempo)')

subplot(312)
plot(t, demodulated_signal, 'b', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sinal Demodulado FM (Domínio do Tempo)')

subplot(313)
plot(t, demodulated_filtered, 'r--', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Tempo (s)')
ylabel('Amplitude')
title('Sinal Demodulado FM Filtrado (Domínio do Tempo)')

figure(4)
subplot(211)
plot(f, demodulated_filtered_f, 'k', 'LineWidth', 2)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Demodulated Signal (Frequency Domain)')
xlim([-f_carrier*1.2 f_carrier*1.2])
ylim([0 A_carrier/1000])

subplot(212)
plot(f, abs(demodulated_filtered_f), 'k', 'LineWidth', 2)
xlabel('Frequency (Hz)')
ylabel('Amplitude')
title('Absolute Demodulated Signal (Frequency Domain)')
xlim([-f_carrier*1.2 f_carrier*1.2])
ylim([0 A_carrier/1000])

```]


= Conclusão


A partir dos conceitos vistos e dos resultados obtidos, podemos concluir que o processo de modulação e demodulação em frequência é uma tecnica eficiente para a transmissão de sinais de áudio em sistemas de comunicação, pois permite a transmissão de sinais de áudio com qualidade e fidelidade com baixa interência devido a informação estar sendo carregada na variação de frequência e não na amplitude do sinal. 

Desta forma, podemos compreender seu uso em sistemas de telecomunicação utilizado atualmente pelas rádios analógicas regionais para transmissão de sinais de áudio em broadcast para toda a região, visto que esse tipo de transmissão possui um baixo índice de ruído e distorção. 

= Referências

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]