close all; clear all; clc;
pkg load signal;
pkg load communications;

% Altera o tamanho da fonte nos plots para 15
set(0, 'DefaultAxesFontSize', 20);

% Defining the base signal amplitude.
A_signal = 1;

% Defining the frequency for the base signal 
f_signal = 80000;

% Defining the period and frequency of sampling:
fs = 40*f_signal;
Ts = 1/fs;
T = 1/f_signal;

% Defining the sinal period.
t_inicial = 0;
t_final = 0.01;

% "t" vector, correspondig to the time period of analysis, on time domain.
t = [t_inicial:Ts:t_final];

signal = A_signal*cos(2*pi*f_signal*t);

% Criando um trem de impulsos com período de 2T
impulse_train = zeros(size(t));
impulse_train(mod(t, 1/fs) == 0) = 1;

signal_sampled = signal .* impulse_train;

% Quantidade de níveis desejada (tirando o 0)
n=2;
num_levels = 2^n;

levels = 2/num_levels;

quantized_signal = round((signal_sampled+1)/levels);

% verifica o vetor se possui algum elemento no máximo do vetor, se tiver, coloca para o máximo -1:

for i = 1:length(quantized_signal)
    if quantized_signal(i) == num_levels
        quantized_signal(i) = num_levels - 1;
    end
end


figure(1)
subplot(411)
plot(t,signal)
grid on;
xlim([0 3*T])
title('Sinal Senoidal (Dominio do tempo)')

subplot(412)
stem(t,impulse_train, 'MarkerFaceColor', 'b')
grid on;
xlim([0 3*T])
title('Trem de impulsos (Dominio do tempo)')

subplot(413)
stem(t,signal_sampled, 'LineStyle','none', 'MarkerFaceColor', 'b')
grid on;
xlim([0 3*T])
title('Sinal Senoidal Amostrado (Dominio do tempo)')

subplot(414)
stem(t,quantized_signal, 'LineStyle','none', 'MarkerFaceColor', 'b')
xlim([0 3*T])
hold on; 
plot(t,signal*n+A_signal, 'r')
xlim([0 3*T])
grid on;
title('Sinal Senoidal Amostrado e Quantizado (Dominio do tempo)')

% Convertendo valores quantizados inteiros para binário
binary_signal = de2bi(quantized_signal, n);

% Concatenando os valores binários em um único vetor
binary_signal_concatenated = reshape(binary_signal.', 1, []);

% Vetor de tempo
t = linspace(0, 1, length(binary_signal_concatenated) * 2);

% Repetindo cada valor do sinal
repeated_signal = reshape(repmat(binary_signal_concatenated, 2, 1), 1, []);


% Superamostragem
n = 10;
amplitude =5;
repeated_signal_up = upsample(repeated_signal, n);

filtr_tx = ones(1, n);
filtered_signal = filter(filtr_tx, 1, repeated_signal_up)*2*amplitude-amplitude;

% criando um novo vetor de t para o sinal filtrado
t_super = linspace(0, 1, length(filtered_signal));

var_noise = 0.1; 
transmission_noise = sqrt(var_noise)*randn(1,length(filtered_signal)); 

transmitted_signal = filtered_signal + transmission_noise; 

% Plotando o sinal
figure(2)
subplot(311)
plot(t,repeated_signal, 'LineWidth', 2);
ylim([-0.2, 1.2]);
xlim([0, 50*T]);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Binário como Onda Quadrada');
grid on;

subplot(312)
plot(t_super,filtered_signal, 'LineWidth', 2);
xlim([0, 50*T]);
ylim([-amplitude*1.2 , amplitude*1.2]);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Binário como Onda Quadrada');
grid on;

subplot(313)
plot(t_super,transmitted_signal, 'LineWidth', 2);
xlim([0, 50*T]);
ylim([-amplitude*1.2 , amplitude*1.2]);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Binário como Onda Quadrada');
grid on;

% Recepção: 

% definindo o limiar (valor que vai decidir se o sinal é 0 ou 1)
limiar = 0;

% amostrando o sinal recebido
received_signal = transmitted_signal(n/2:n:end);
received_binary = received_signal > limiar; 

t_received = linspace(0, 1, length(t_super)/n);

% Plotando o sinal
figure(3)
subplot(211)
plot(t_received, received_signal);
xlim([0, 50*T]);
subplot(212)
stem(t_received, received_binary);
xlim([0, 50*T]);

num_erro = sum(xor(received_signal, received_binary)) 
taxa_erro = num_erro/length(t_super)

% fazer o bi2de 
% recuperar o sinal analog multiplicando pelo passo. 
