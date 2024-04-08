% QAM transmission of two diferent audio signals. 

% QAM - Quadrature Amplitude modulation

clc; clear all; close all

% sinal com menor duração
[signal, Fs] = audioread('bison.wav');

% sinal com maior duração
[signal2, Fs2] = audioread('wolf.wav');

signal = transpose(signal);
signal2 = transpose(signal2);

duracao = length(signal)/Fs;
signal2 = signal2(1:length(signal));

Ts = 1/Fs; 

t=[0:Ts:duracao-Ts];

% calculando o passo no dominio da frequência; 
f_step = 1/duracao;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f = [-Fs/2:f_step:Fs/2];

f = [1:length(signal)];

Ac = 1; 

signal_F = fft(signal)/length(signal);
signal_F = fftshift(signal_F);

signal2_F = fft(signal2)/length(signal2);
signal2_F = fftshift(signal2_F);

figure(1)
subplot(221)
plot(t,signal,'b')
title('Sinal Curto (Time domain)')

figure(1)
subplot(223)
plot(t,signal2,'b')
title('Sinal Longo (Time domain)')

subplot(222)
plot(f,abs(signal_F), 'b')
title('Sinal Curto (Frequncy domain)')

subplot(224)
plot(f,abs(signal2_F), 'b')
title('Sinal Longo (Frequncy domain)')

carrier_frequency = 1000000;

carrier_1 = Ac*cos(2*pi*carrier_frequency*t);
carrier_2 = Ac*sin(2*pi*carrier_frequency*t);

modulated1 = signal.*carrier_1; 
modulated2 = signal2.*carrier_2; 

multiplexed = modulated1 + modulated2;

multiplexed_F = fft(multiplexed)/length(multiplexed);
multiplexed_F = fftshift(multiplexed_F);

figure(2)
subplot(221)
plot(f,carrier_1,'b')
xlim([0 3000*f_step])
title('Portadora 1 (cosseno)')

subplot(223)
plot(f,carrier_2,'b')
xlim([0 3000*f_step])
title('Portadora 2 (seno)')

subplot(222)
plot(t,modulated1,'b')
title('Sinal Curto Modulado (Time domain)')

subplot(224)
plot(t,modulated2,'b')
title('Sinal Longo Modulado (Time domain)')

figure(3)
subplot(211)
plot(f,multiplexed,'b')
title('Sinal multiplexado')

subplot(212)
plot(f,abs(multiplexed_F), 'b')
title('Sinal multiplexado (Frequencia)')