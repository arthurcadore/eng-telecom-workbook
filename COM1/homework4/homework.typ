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

Seção II - Conceitos teóricos utilizados no relatório

= Análise dos resultados

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


= Scripts e Códigos Utilizados:

Seção IV -  Scripts e Codigos


#sourcecode[```matlab
close all; clear all; clc;

% Defining the signals amplitude. 
A_modulating = 1; 
A_carrier = 1; 

% Defining the signals frequency
f_modulating_max = 20000;
f_carrier = 80000;

% modulator sensibility for frequency variation (Hz/volts)
k_f = 2000000;

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

#sourcecode[```matlab	
% modulating_singal = A_modulating *cos(2*pi*f_modulating_max*t);
[modulating_signal, Hs] = audioread('general-signal.wav');
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

subplot(312)
plot(t, abs(modulating_signal),'r', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Time (s)')
ylabel('Amplitude')

subplot(313)
plot(t, modulated_signal,'k', 'LineWidth', 2)
xlim([0.00054 0.00067])
xlabel('Time (s)')
ylabel('Amplitude')
```]

#sourcecode[```matlab
% calculating the step of the frequency vector "f" (frequency domain); 
f_step = 1/t_final;

% creating the frequency vector "f" (frequency domain); 
f = [-fs/2:f_step:fs/2];

% calculating the FFT of the modulated signal;
modulated_f = fft(modulated_signal)/length(modulated_signal);
modulated_f = fftshift(modulated_f);
```]

= Conclusões
Seção V - Conclusões

= Referências
Seção VI - Referências bibliograficas