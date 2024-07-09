close all; clear all; clc;

pkg load signal;

% quantidade de bits que serão gerados;
num_bits = 10;

% Gerando bits aleatórios com rand inteiro;
bits = randi([0 1], 1, num_bits);

amplitude = 5;
afk_modulation = zeros(1, num_bits);
for i = 1:1:num_bits
    if bits(i) == 0
        afk_modulation(i) = -amplitude;
    else
        afk_modulation(i) = amplitude;
    end
end

A_carrier = 5
f_carrier = 1000;
fs = f_carrier*40;
Ts = 1/fs;

% Defining the sinal period.
t_inicial = 0;
t_final = 1;

% "t" vector, correspondig to the time period of analysis, on time domain.
t = [t_inicial:Ts:t_final];
t = [2:1:(lenght(t)-1)]


afk_carrier = A_carrier*cos(2*pi*f_carrier*t);

afk_modulation_up = upsample(afk_modulation, (f_carrier/num_bits));

lenght_time = lenght(afk_carrier)
lenght_modulating = lenght(afk_modulation_up)

signal = afk_carrier * afk_modulation_up;

figure(1);
plot(t,bits)