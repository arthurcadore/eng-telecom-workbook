% IQ transmission of two diferent audio signals. 
% IQ - In-Phase and Quadrature Modulation

clc; clear all; close all
pkg load signal

% Definição dos parâmetros da portadora do sinal IQ:
carrier_amplitude = 1; 
carrier_frequency = 1000000;

% Coletando os sinais para transmissão:
[short_signal, Fs] = audioread('long-signal.wav');
[long_signal, Fs2] = audioread('long-signal.wav');

% Fazendo a transposição linha/coluna do sinal de entrada
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

% calculando a FFT do sinal de entrada (que será utilizado no cosseno):
signal_cos_F = fft(signal_cos)/length(signal_cos);
signal_cos_F = fftshift(signal_cos_F);

% calculando a FFT do sinal de entrada (que será utilizado no seno):
signal_sin_F = fft(signal_sin)/length(signal_sin);
signal_sin_F = fftshift(signal_sin_F);

% Plot dos sinais de entrada (dominio do tempo e frequência):
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

% Criando dos sinais de portadora para transmissão ortogonal (um com seno e outro com cosseno):
carrier_cos = carrier_amplitude*cos(2*pi*carrier_frequency*t);
carrier_sin = carrier_amplitude*sin(2*pi*carrier_frequency*t);

% Realizando a modulação AM do sinal de aúdio na portadora correspondente a cada sinal:
modulated_cos = signal_cos .* carrier_cos; 
modulated_sin = signal_sin .* carrier_sin; 

% Realizando a multiplexação do sinal (a partir do principio de ortogonalidade):
multiplexed_signal = modulated_cos + modulated_sin;

% Calculando a FFT do sinal para amostrar seu estado no dominio da frequência:
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

% Realizando a demodulação do sinal no receptor: 

demodulated_cos = multiplexed_signal .* carrier_cos;
demodulated_sin = multiplexed_signal .* carrier_sin;

% Ordem do filtro FIR
filtro_ordem = 100;

% Frequência de corte do filtro FIR
frequencia_corte = 20000;

% Coeficientes do filtro FIR para cada sinal demodulado
coeficientes_filtro_cos = fir1(filtro_ordem, frequencia_corte/(Fs/2));
coeficientes_filtro_sin = fir1(filtro_ordem, frequencia_corte/(Fs/2));

% Resposta em frequência do filtro FIR para cada sinal demodulado
[H_cos, f_cos] = freqz(coeficientes_filtro_cos, 1, length(signal_cos), Fs);
[H_sin, f_sin] = freqz(coeficientes_filtro_sin, 1, length(signal_sin), Fs);

% Plot da resposta em frequência dos filtros
figure(5)
subplot(211)
plot(f_cos, abs(H_cos), 'b')
title('Resposta em Frequência do Filtro FIR para o Sinal Curto')

subplot(212)
plot(f_sin, abs(H_sin), 'b')
title('Resposta em Frequência do Filtro FIR para o Sinal Longo')

% Filtragem dos sinais demodulados
demodulated_cos_filtered = filter(coeficientes_filtro_cos, 1, demodulated_cos);
demodulated_sin_filtered = filter(coeficientes_filtro_sin, 1, demodulated_sin);

% Plot dos sinais demodulados
figure(4)
subplot(211)
plot(t, demodulated_cos_filtered, 'b')
title('Sinal Curto Demodulado (Time domain)')

subplot(212)
plot(t, demodulated_sin_filtered, 'b')
title('Sinal Longo Demodulado (Time domain)')

