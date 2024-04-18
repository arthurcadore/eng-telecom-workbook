clc; clear all; close all

% Definindo a amplitude dos sinais
A_modulating = 1;
A_carrier = 1;

% Definindo as frequências dos sinais
f_modulating = 1000;
f_carrier = 10000;

% Definindo o período e a frequência de amostragem
fs = 50*f_carrier;
Ts = 1/fs;
T = 1/f_modulating;

% Definindo o período de análise
t_inicial = 0;
t_final = 2;

% Vetor de tempo
t = [t_inicial:Ts:t_final];

% Sinal modulante
modulating_signal = A_modulating*sin(2*pi*f_modulating*t);

% Sinal portadora
carrier_signal = A_carrier*cos(2*pi*f_carrier*t);

figure;

for i = 1:length(t)
  
    % Calcula o sinal modulado para o tempo atual
    modulated_signal = (1 + modulating_signal(i)) .* carrier_signal;
    
    % Plota o sinal modulado (estático)
    subplot(2,1,2);
    plot(t, modulated_signal, 'b',  'LineWidth', 3);
    hold on;
    xlim([0 1*T]);
    grid on;
    ylim([-2*A_carrier 2*A_carrier]);
    title('AM Modulated Signal (time)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    hold off;
    
    % Calcula o deslocamento do sinal modulante
    offset_modulating = round((i-1) * length(modulating_signal) / length(t));
    modulating_signal_shifted = circshift(modulating_signal, offset_modulating);
    
    % Plota o sinal modulante (movendo-se para a direita)
    subplot(2,1,1);
    plot(t, modulating_signal_shifted, 'b', 'LineWidth', 3);
    hold on;
    grid on;
    xlim([0 1*T]);
    ylim([-2*A_modulating 2*A_modulating]);
    title('Modulating Signal (time)');
    xlabel('Time (s)');
    ylabel('Amplitude');
    hold off;
    
    % Atualiza o gráfico
    drawnow;
    
    % Pausa para criar a animação
    pause(0.001);
end
