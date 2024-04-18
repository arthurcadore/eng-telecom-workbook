clc; clear all; close all

% amplitude de cada componente do sinal; 
A1 = 10;
A2 = 1;
A3 = 4;

% definindo frequências das componentes do sinal; 
f1 = 100;
f2 = 200;
f3 = 300;

% definindo periodo e frequência de amostragem; 
fs = 50*f2;
Ts = 1/fs;
T = 1/f1;

% definindo priodos do sinal; 
t_inicial = 0;
t_final = 2;

% vetor "t" correspondente ao periodo de análise (dominio da frequência); 
t = [t_inicial:Ts:t_final];

% calculando o passo no dominio da frequência; 
passo_f = 1/t_final;

% vetor "f" correspondente ao periodo de análise (dominio da frequência); 
f = [-fs/2:passo_f:fs/2];

% definição das funções de cada componente do sinal; 
x1_t = A1*cos(2*pi*f1*t);
x2_t = A2*cos(2*pi*f2*t);
x3_t = A3*cos(2*pi*f3*t);

% adicionando uma componente DC ao sinal; 
x4_t = 2; 

% somátório das componentes para compor o sinal completo
x_t = x1_t + x2_t + x3_t + x4_t;

% realizando a FFT (fast Fourier Transform) do sinal para o domínio da frequência; 
X_f = fft(x_t)/length(x_t);
X_f = fftshift(X_f);

% Plotagem do sinal no domínio do tempo; 
figure(1)
plot(t,x_t)
xlim([0 3*T])

% Plotagem do sinal no domínio da frequência; 
figure(2)
plot(f,abs(X_f))
grid on

% Calculando a potência AC do sinal; 
Pot_AC = var(x_t)

% Calculando a potência DC do sinal; 
Pot_DC = mean(x_t)^2

% Potência total do sinal; 
Pot_Media_Total = Pot_AC + Pot_DC

% Calculando a potência média do sinal; 
Pot_Media_Total = 1/length(x_t)*sum(x_t.^2)

