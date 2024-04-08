% IQ transmission of two diferent audio signals. 
% IQ - In-Phase and Quadrature Modulation

clc; clear all; close all
pkg load signal

% Definição dos parâmetros da portadora do sinal IQ:
carrier_amplitude = 1; 
carrier_frequency = 40000;

% Coletando os sinais para transmissão:
[short_signal, Fs] = audioread('short-signal.wav');
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
plot(t,signal_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Cosseno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t,signal_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Seno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(f,abs(signal_cos_F), 'r')
title('Sinal Modulante da Portadora Cosseno (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(224)
plot(f,abs(signal_sin_F), 'k')
title('Sinal Modulante da Portadora Seno (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

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
plot(f,carrier_cos,'r', 'LineWidth', 2)
xlim([0 100*f_step])
title('Portadora Cosseno')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(223)
plot(f,carrier_sin,'k', 'LineWidth', 2)
xlim([0 100*f_step])
title('Portadora Seno')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(222)
plot(t,modulated_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Cossenoidal Modulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(224)
plot(t,modulated_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Senoidal Modulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

% Verificando o sinal multiplexado: 

figure(3)
subplot(211)
plot(t,multiplexed_signal,'b')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal multiplexado')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(212)
plot(f,abs(multiplexed_signal_F), 'b')
title('Sinal multiplexado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% Realizando a demodulação do sinal no receptor: 

demodulated_cos = multiplexed_signal .* carrier_cos;
demodulated_sin = multiplexed_signal .* carrier_sin;

% Ordem do filtro FIR
filtro_ordem = 100;

% Frequência de corte do filtro FIR 
% Como trata-se de um sinal de áudio, a frequência de corte pode ser fixada em 20kHz
frequencia_corte = 20000;

% Coeficientes do filtro FIR para cada sinal demodulado
coeficientes_filtro = fir1(filtro_ordem, frequencia_corte/(Fs/2));

% Resposta em frequência do filtro FIR para cada sinal demodulado
[H_cos, f_cos] = freqz(coeficientes_filtro, 1, length(t), Fs);
[H_sin, f_sin] = freqz(coeficientes_filtro, 1, length(t), Fs);

% Plot da resposta em frequência dos filtros:
figure(5)
subplot(211)
plot(f_cos, abs(H_cos), 'r', 'LineWidth', 3)
xlim([0 frequencia_corte*1.1])
title('Resposta em Frequência do Filtro FIR Cossenoidal')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(212)
plot(f_sin, abs(H_sin), 'k', 'LineWidth', 3)
xlim([0 frequencia_corte*1.1])
title('Resposta em Frequência do Filtro FIR Senoidal')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% Filtragem dos sinais demodulados
demodulated_cos_filtered = filter(coeficientes_filtro, 1, demodulated_cos);
demodulated_sin_filtered = filter(coeficientes_filtro, 1, demodulated_sin);

% Calculando a FFT dos sinais demodulados para amostrar seu estado no dominio da frequência:
demodulated_sin_F = fft(demodulated_sin_filtered)/length(demodulated_sin_filtered);
demodulated_sin_F = fftshift(demodulated_sin_F);

demodulated_cos_F = fft(demodulated_cos_filtered)/length(demodulated_cos_filtered);
demodulated_cos_F = fftshift(demodulated_cos_F);

% Plot dos sinais demodulados
figure(4)
subplot(221)
plot(t, demodulated_cos_filtered, 'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Cosseno) Demodulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t, demodulated_sin_filtered, 'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Seno) Demodulado Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(f,abs(demodulated_cos_F), 'r')
title('Sinal Modulante (Portadora Cosseno) Demodulado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

subplot(224)
plot(f,abs(demodulated_sin_F), 'k')
title('Sinal Modulante (Portadora Seno) Demodulado (Frequency domain)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')

% =======================
% Comparando sinal transmitido com sinal recebido: 

figure(4)
subplot(221)
plot(t, demodulated_cos_filtered, 'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Cosseno) Demodulado (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(223)
plot(t, demodulated_sin_filtered, 'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante (Portadora Seno) Demodulado Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(222)
plot(t,signal_cos,'r')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Cosseno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

subplot(224)
plot(t,signal_sin,'k')
xlim([(duracao*0.3) (duracao*0.7)])
title('Sinal Modulante da Portadora Seno (Time domain)')
xlabel('Tempo (s)')
ylabel('Amplitude')

% Calculando a densidade espectral do sinal modulado: 

figure(7)
subplot(221)
plot(pwelch(signal_cos), 'r', 'LineWidth', 3);
xlim([0 200])
title('Densidade Espectral do Sinal Modulante (Portadora Cosseno)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
xlim([0 100])

subplot(222)
plot(pwelch(signal_sin), 'k', 'LineWidth', 3);
xlim([0 200])
title('Densidade Espectral do Sinal Modulante (Portadora Seno)')
xlabel('Frequência (Hz)')
ylabel('Magnitude')
xlim([0 100])

subplot(2, 2, [3 4])
plot(pwelch(multiplexed_signal), 'b', 'LineWidth', 3);
xlim([0 100])
title('Densidade Espectral do Sinal Multiplexado')
xlabel('Frequência (Hz)')
ylabel('Magnitude')



