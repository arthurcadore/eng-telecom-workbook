close all; clear all; clc;
pkg load signal;

% Altera o tamanho da fonte nos plots para 15
set(0, 'DefaultAxesFontSize', 20);

% Defining the base signal amplitude.
A_signal = 1;

% Defining the frequency for the base signal 
f_signal = 80000;

% Defining the period and frequency of sampling:
fs = 20*f_signal;
Ts = 1/fs;
T = 1/f_signal;

% Defining the sinal period.
t_inicial = 0;
t_final = 0.14;

% "t" vector, correspondig to the time period of analysis, on time domain.
t = [t_inicial:Ts:t_final];

signal = A_signal*cos(2*pi*f_signal*t);

% Criando um trem de impulsos com período de 2T
impulse_train = zeros(size(t));
impulse_train(mod(t, 1/fs) == 0) = 1;

signal_sampled = signal .* impulse_train;


% Quantidade de níveis desejada (tirando o 0)
n=3
num_levels = 2^n;

% Gerando os níveis de quantização automaticamente
levels = linspace(-1, 1, num_levels+1);

% Quantização
quantized_signal = zeros(size(signal_sampled));

for i = 1:length(signal_sampled)
    if signal_sampled(i) <= levels(1)
        quantized_signal(i) = levels(1);
    elseif signal_sampled(i) >= levels(end)
        quantized_signal(i) = levels(end);
    else
        for j = 1:length(levels)-1
            if signal_sampled(i) >= levels(j) && signal_sampled(i) < levels(j+1)
                if abs(signal_sampled(i) - levels(j)) < abs(signal_sampled(i) - levels(j+1))
                    quantized_signal(i) = levels(j);
                else
                    quantized_signal(i) = levels(j+1);
                end
                break;
            end
        end
    end
end

figure(1)
subplot(411)
plot(t,signal)
xlim([0 5*T])
subplot(412)
stem(t,impulse_train, 'MarkerFaceColor', 'b')
xlim([0 5*T])
subplot(413)
stem(t,signal_sampled, 'LineStyle','none', 'MarkerFaceColor', 'b')
xlim([0 5*T])
subplot(414)
stem(t,quantized_signal, 'LineStyle','none', 'MarkerFaceColor', 'b')
xlim([0 5*T])
