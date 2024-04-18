% Plot tree diferent signals (cos) multiplexed in frequency domain. 

clc; clear all; close all

% Defining the signals amplitude. 
A1_modulating = 1;
A2_modulating = 1;
A3_modulating = 1;
A_carrier = 1;

% Defining the signals frequency
f1_modulating = 3000;
f2_modulating = 2000;
f3_modulating = 1000;

% carrier frequencies (use the bigger frequecy as f1 always!)
f1_carrier = 14000;
f2_carrier = 12000;
f3_carrier = 10000;


% Defining the period and frequency of sampling: 
fs1 = 50*f1_carrier;
Ts1 = 1/fs1;
T1 = 1/f1_modulating;

% Defining the signal period. 
t_inicial = 0;
t_final = 2;

% "t" vector: correspondente ao periodo de análise (dominio da frequência); 
t1 = [t_inicial:Ts1:t_final];

% calculando o passo no dominio da frequência; 
f1_step = 1/t_final;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f1 = [-fs1/2:f1_step:fs1/2];

modulating_signal1 = A1_modulating*cos(2*pi*f1_modulating*t1);
modulating_signal2 = A2_modulating*cos(2*pi*f2_modulating*t1);
modulating_signal3 = A3_modulating*cos(2*pi*f3_modulating*t1);

carrier_signal1 = A_carrier*cos(2*pi*f1_carrier*t1);
carrier_signal2 = A_carrier*cos(2*pi*f2_carrier*t1);
carrier_signal3 = A_carrier*cos(2*pi*f3_carrier*t1);

final_signal1 = modulating_signal1 .* carrier_signal1;
final_signal2 = modulating_signal2 .* carrier_signal2;
final_signal3 = modulating_signal3 .* carrier_signal3;


% realizando a FFT (fast Fourier Transform) do sinal para o domínio da frequência; 

modulating_F1 = fft(modulating_signal1)/length(modulating_signal1);
modulating_F1 = fftshift(modulating_F1);

carrier_F1 = fft(carrier_signal1)/length(carrier_signal1);
carrier_F1 = fftshift(carrier_F1);

modulating_F2 = fft(modulating_signal2)/length(modulating_signal2);
modulating_F2 = fftshift(modulating_F2);

carrier_F2 = fft(carrier_signal2)/length(carrier_signal2);
carrier_F2 = fftshift(carrier_F2);

modulating_F3 = fft(modulating_signal3)/length(modulating_signal3);
modulating_F3 = fftshift(modulating_F3);

carrier_F3 = fft(carrier_signal3)/length(carrier_signal3);
carrier_F3 = fftshift(carrier_F3);

fb1 = [ -(f1_modulating-f1_carrier)/fs1 (f1_modulating+f1_carrier)/fs1];

final_signal1F = firls(10,fb1,[1 1]);

multiplexed_singal = final_signal1 + final_signal2 + final_signal3;

multiplexed_F = fft(multiplexed_singal)/length(multiplexed_singal);
multiplexed_F = fftshift(multiplexed_F);


figure(1)
subplot(421)
plot(t1,modulating_signal1,'b')
xlim([0 3*T1])
ylim([-1.2*A1_modulating 1.2*A1_modulating])
title('modulating signal 1 (Time domain)')

subplot(423)
plot(t1,modulating_signal2,'b')
xlim([0 3*T1])
ylim([-1.2*A2_modulating 1.2*A2_modulating])
title('modulating signal 2 (Time domain)')


subplot(425)
plot(t1,modulating_signal3,'b')
xlim([0 3*T1])
ylim([-1.2*A3_modulating 1.2*A3_modulating])
title('modulating signal 3 (Time domain)')


subplot(422)
plot(f1,abs(modulating_F1), 'b')
xlim([-5*f1_carrier 5*f1_carrier])
ylim([-1.2*A1_modulating 1.2*A1_modulating])
title('modulating signal 1 (Frequency domain)')

subplot(424)
plot(f1,abs(modulating_F2), 'b')
xlim([-5*f2_carrier 5*f2_carrier])
ylim([-1.2*A2_modulating 1.2*A2_modulating])
title('modulating signal 2 (Frequency domain)')

subplot(426)
plot(f1,abs(modulating_F3), 'b')
xlim([-5*f3_carrier 5*f3_carrier])
ylim([-1.2*A3_modulating 1.2*A3_modulating])
title('modulating signal 3 (Frequency domain)')


subplot(427)
plot(t1,multiplexed_singal, 'k')
xlim([0 3*T1])
hold on
plot(t1,modulating_signal1, 'r')
hold on
plot(t1,modulating_signal2, 'g')
hold on
plot(t1,modulating_signal3, 'b')
title('Multiplexed Signal (Time domain)')

subplot(428)
plot(f1,abs(multiplexed_F), 'b')
title('Multiplexed Signal (Frequency domain)')