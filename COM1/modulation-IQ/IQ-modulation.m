% IQ transmission of two diferent audio signals. 
% IQ - In-Phase and Quadrature Modulation

clc; clear all; close all
pkg load signal

% sinal com menor duração
[short_signal, Fs] = audioread('long-signal.wav');
[long_signal, Fs2] = audioread('long-signal.wav');

short_signal = transpose(short_signal);
long_signal = transpose(long_signal);

% pegando a duração da transmissão a partir do tamanho do menor sinal;
duracao = length(short_signal)/Fs;

% calculando vetor de t no dominio do tempo;
Ts = 1/Fs; 
t=[0:Ts:duracao-Ts];

% Igualando o comprimento dos sinais ao vetor de tempo
signal_cos = short_signal(1:length(t));
signal_sin = long_signal(1:length(t));

% calculando o passo no dominio da frequência; 
f_step = 1/duracao;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f = [-Fs/2:f_step:Fs/2];
f = [1:length(signal_cos)];

signal_cos_F = fft(signal_cos)/length(signal_cos);
signal_cos_F = fftshift(signal_cos_F);

signal_sin_F = fft(signal_sin)/length(signal_sin);
signal_sin_F = fftshift(signal_sin_F);

figure(1)
subplot(221)
plot(t,signal_cos,'b')
title('Sinal Curto (Time domain)')

subplot(223)
plot(t,signal_sin,'b')
title('Sinal Longo (Time domain)')

subplot(222)
plot(f,abs(signal_cos_F), 'b')
title('Sinal Curto (Frequncy domain)')

subplot(224)
plot(f,abs(signal_sin_F), 'b')
title('Sinal Longo (Frequncy domain)')

carrier_amplitude = 1; 
carrier_frequency = 1000000;

carrier_cos = carrier_amplitude*cos(2*pi*carrier_frequency*t);
carrier_sin = carrier_amplitude*sin(2*pi*carrier_frequency*t);

modulated_cos = signal_cos .* carrier_cos; 
modulated_sin = signal_sin .* carrier_sin; 

multiplexed_signal = modulated_cos + modulated_sin;

multiplexed_signal_F = fft(multiplexed_signal)/length(multiplexed_signal);
multiplexed_signal_F = fftshift(multiplexed_signal_F);

figure(2)
subplot(221)
plot(f,carrier_cos,'b')
xlim([0 3000*f_step])
title('Portadora 1 (cosseno)')

subplot(223)
plot(f,carrier_sin,'b')
xlim([0 3000*f_step])
title('Portadora 2 (seno)')

subplot(222)
plot(t,modulated_cos,'b')
title('Sinal Curto Modulado (Time domain)')

subplot(224)
plot(t,modulated_sin,'b')
title('Sinal Longo Modulado (Time domain)')

figure(3)
subplot(211)
plot(f,multiplexed_signal,'b')
title('Sinal multiplexado')

subplot(212)
plot(f,abs(multiplexed_signal_F), 'b')
title('Sinal multiplexado (Frequencia)')'