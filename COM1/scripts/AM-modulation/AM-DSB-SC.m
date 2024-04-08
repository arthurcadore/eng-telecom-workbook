% Plot an AM-DSB modulated singal using an 10KHz carrier signal and an 1KHz modulating wave.

% AM - Amplitude modulation
% DSB - Double Side Band

clc; clear all; close all

% Defining the signals amplitude.
A_modulating = 1;
A_carrier = 1;

% For modulation factor = 0.5
A1_dc = 2*A_modulating;

% For modulation factor = 0.25
A2_dc = 4*A_modulating;

% For modulation factor = 0.75
A3_dc = 4/3*A_modulating;

% For modulation factor = 1
A4_dc = 1*A_modulating;

% For modulation factor = 1.5
A5_dc = 2/3*A_modulating;

% modulation factor (operations):
m1 = A_modulating/A1_dc;
m2 = A_modulating/A2_dc;
m3 = A_modulating/A3_dc;
m4 = A_modulating/A4_dc;
m5 = A_modulating/A5_dc;

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

modulating_signal1 = A1_dc .* (1 + m1 * cos(2*pi*f_modulating));
modulating_signal2 = A2_dc .* (1 + m2 * cos(2*pi*f_modulating));
modulating_signal3 = A_dc .* (1 + m3 * cos(2*pi*f_modulating));
modulating_signal4 = A_dc .* (1 + m4 * cos(2*pi*f_modulating));
modulating_signal5 = A_dc .* (1 + m5 * cos(2*pi*f_modulating));


% criando o sinal da portadora
carrier_signal = A_carrier*cos(2*pi*f_carrier*t);

% first method to calculate the modulated signal
final_signal1 = modulating_signal1 .* carrier_signal;
final_signal2 = modulating_signal2 .* carrier_signal;
final_signal3 = modulating_signal3 .* carrier_signal;
final_signal4 = modulating_signal4 .* carrier_signal;
final_signal5 = modulating_signal5 .* carrier_signal;

% second method to calculate the modulated signal
%final_signal = (A_dc + modulating_signal) .* carrier_signal;

% third method to calculate the modulated signal
%final_signal = A_dc .* carrier_signal + ((A_dc * A_carrier * m)/2) * (cos(2*pi*f_carrier - 2*pi*f_modulating)*t + cos(2*pi*f_carrier + 2*pi*f_modulating)*t);

% realizando a FFT (fast Fourier Transform) do sinal para o domínio da frequência;
modulating_F1 = fft(modulating_signal1)/length(modulating_signal1);
modulating_F2 = fft(modulating_signal2)/length(modulating_signal2);
modulating_F3 = fft(modulating_signal3)/length(modulating_signal3);
modulating_F4 = fft(modulating_signal4)/length(modulating_signal4);
modulating_F5 = fft(modulating_signal5)/length(modulating_signal5);

modulating_F1 = fftshift(modulating_F1);
modulating_F2 = fftshift(modulating_F2);
modulating_F3 = fftshift(modulating_F3);
modulating_F4 = fftshift(modulating_F4);
modulating_F5 = fftshift(modulating_F5);

carrier_F = fft(carrier_signal)/length(carrier_signal);
carrier_F = fftshift(carrier_F);

final_F1 = fft(final_signal1)/length(final_signal1);
final_F2 = fft(final_signal2)/length(final_signal2);
final_F3 = fft(final_signal3)/length(final_signal3);
final_F4 = fft(final_signal4)/length(final_signal4);
final_F5 = fft(final_signal5)/length(final_signal5);

final_F1 = fftshift(final_F1);
final_F2 = fftshift(final_F2);
final_F3 = fftshift(final_F3);
final_F4 = fftshift(final_F4);
final_F5 = fftshift(final_F5);

figure(1)
subplot(521)
plot(t,modulating_signal1','b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal 1 (Time domain)')

subplot(523)
plot(t,modulating_signal2','b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal 2 (Time domain)')

subplot(525)
plot(t,modulating_signal3','b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal 3 (Time domain)')

subplot(527)
plot(t,modulating_signal4','b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal 4 (Time domain)')

subplot(529)
plot(t,modulating_signal5','b')
xlim([0 3*T])
ylim([-1.2*A_modulating 1.2*A_modulating])
title('modulating signal 5 (Time domain)')



figure(2)
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