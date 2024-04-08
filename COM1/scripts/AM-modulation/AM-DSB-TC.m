% Plot an AM-DSB-SC modulated singal using an 10KHz carrier signal and an 1KHz modulating wave. 

% AM - Amplitude modulation
% DSB - Double Side Band
% SC - Supressed carrier

clc; clear all; close all

% Defining the signals amplitude. 
A_modulating = 1;
A_carrier = 1;
A_dc = 2; 

m = A_modulating/A_dc;

% Defining the signals frequency
f_modulating = 1000;
f_carrier = 10000;

% Defining the period and frequency of sampling: 
fs = 50*f_carrier;
Ts = 1/fs;
T = 1/f_modulating;

% Defining the sinal period. 
t_inicial = 0;
t_final = 2;

% "t" vector: correspondente ao periodo de análise (dominio da frequência); 
t = [t_inicial:Ts:t_final];

% calculando o passo no dominio da frequência; 
f_step = 1/t_final;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f = [-fs/2:f_step:fs/2];

modulating_signal = A_modulating*cos(2*pi*f_modulating*t);
carrier_signal = A_carrier*cos(2*pi*f_carrier*t);

final_signal = (A_dc + modulating_signal) .* carrier_signal; 

%final_signal = A_dc .* (1 + m * cos(2*pi*f_modulating)) .* A_carrier*cos(2*pi*f_carrier*t);
%final_signal = A_dc .* carrier_signal + ((A_dc * A_carrier * m)/2) * (cos(2*pi*f_carrier - 2*pi*f_modulating)*t + cos(2*pi*f_carrier + 2*pi*f_modulating)*t);

% realizando a FFT (fast Fourier Transform) do sinal para o domínio da frequência; 
modulating_F = fft(modulating_signal)/length(modulating_signal);
modulating_F = fftshift(modulating_F);

carrier_F = fft(carrier_signal)/length(carrier_signal);
carrier_F = fftshift(carrier_F);

final_F = fft(final_signal)/length(final_signal);
final_F = fftshift(final_F);

figure(1)
subplot(321)
plot(t,modulating_signal,'b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal (Time domain)')

subplot(323)
plot(t,carrier_signal, 'b')
xlim([0 3*T])
ylim([-1.2*A_carrier 1.2*A_carrier])
title('carrier signal (Time domain)')

subplot(325)
plot(t,final_signal, 'b')
xlim([0 3*T])
hold on
plot(t,modulating_signal, 'r')
xlim([0 3*T])
ylim([-1.6*A_dc 1.6*A_dc])
title('final signal (Time domain)')

subplot(322)
plot(f,abs(modulating_F), 'b')
xlim([-5*f_carrier 5*f_carrier])
ylim([0 1.2*A_modulating])
title('modulating signal (Frequency domain)')

subplot(324)
plot(f,abs(carrier_F), 'b')
xlim([-5*f_carrier 5*f_carrier])
ylim([0 0.8*A_carrier])
title('carrier signal (Frequency domain)')

subplot(326)
plot(f,abs(final_F), 'b')
xlim([-5*f_carrier 5*f_carrier])
ylim([0 0.5*A_modulating])
title('final signal (Frequency domain)')


demulated_signal = final_signal .* carrier_signal; 

demulated_F = fft(demulated_signal)/length(demulated_signal);
demulated_F = fftshift(demulated_signal);

figure(2)
subplot(121)
plot(t,demulated_signal,'b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('demulated signal (Time domain)')

subplot(122)
plot(f,abs(demulated_F), 'b')
xlim([-5*f_carrier 5*f_carrier])
ylim([-0.5*A_modulating 0.5*A_modulating])
title('demulated signal (Frequency domain)')