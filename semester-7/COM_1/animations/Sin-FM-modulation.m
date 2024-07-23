close all; clear all; clc;
pkg load signal;

% Definindo a amplitude dos sinais
A_modulating = 1;
A_carrier = 1;

% Definindo as frequências dos sinais
f_modulating_max = 200; % Reduzida para facilitar a visualização
f_carrier = 800;

% modulator sensibility for frequency variation (Hz/volts)
k_f = 50000;
k0 = 2*pi*k_f;

% Delta variable, correponding to max frequency variation.
d_f = k_f*A_modulating;

% Beta variable, correspondig to percentage of frequency variation about the frequency of the modulating.
b = d_f/f_modulating_max;

% Definindo o período e a frequência de amostragem
fs = 150*f_carrier;
Ts = 1/fs;
T = 1/f_modulating_max;

% Definindo o período de análise
t_inicial = 0;
t_final = 2;

% Vetor de tempo
t = [t_inicial:Ts:t_final];

% Modulating Singnal for FM modulation
modulating_signal = A_modulating *cos(2*pi*f_modulating_max*t);

% Calculate the number of zeros to be added
num_zeros = length(t) - length(modulating_signal);

% Add the zeros to the end of the modulating_signal vector
modulating_signal = [modulating_signal, zeros(1, num_zeros)];

% Transpose the modulated signal if necessary
modulated_signal = transpose(modulating_signal);

figure;

for i = 1:length(t)
    % Calcula o sinal modulado para o tempo atual
    t_current = [t_inicial:Ts:t(i)]; % Vetor de tempo para o intervalo atual
    phase_argument = 2*pi*k_f*cumsum(modulating_signal(1:i))*(Ts);
    modulated_signal_current = A_carrier * cos(2*pi*f_carrier*t_current + phase_argument);
    
    % Plota o sinal modulado (estático)
    subplot(2,1,1);
    plot(t_current, modulated_signal_current, 'b', 'LineWidth', 2);
    hold on;
    plot([t_current(1), t_current(end)], [0, 0], 'k--'); % Linha base
    xlim([0 T*1]);
    ylim([-2*A_carrier 2*A_carrier]);
    title('FM Modulated Signal (Time Domain)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    hold off;
    
    % Calcula o deslocamento do sinal modulante
    offset_modulating = round((i-1) * length(modulating_signal) / length(t));
    modulating_signal_shifted = circshift(modulating_signal, offset_modulating);
    
    % Plota o sinal modulante (movendo-se para a direita)
    subplot(2,1,2);
    plot(t, modulating_signal_shifted, 'b', 'LineWidth', 2);
    hold on;
    plot([t(1), t(end)], [0, 0], 'k--'); % Linha base
    xlim([0 T]);
    ylim([-2*A_modulating 2*A_modulating]);
    title('Modulating Signal (Time Domain)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    hold off;
    
    % Atualiza o gráfico
    drawnow;
    
    % Pausa para criar a animação
    pause(0.01);
end
