clear all; close all; clc;

% definindo frequências das componentes do sinal; 
f1 = 1e3; 
f2 = 3e3; 

% definindo a frequência de amostragem: 
fs = 100e3;

% amplitude de cada componente do sinal; 
a1 = 10;
a2 = 5;

% definindo periodos do sinal; 
t = [0:ts:1];
ts = 1/fs; 

% Criando os sinais a partir de senos, e criando o sinal total a partir de sua soma;
x1_t = a1*sin(2*pi*f1*t);
x2_t = a2*sin(2*pi*f2*t);
s_t = x1_t + x2_t; 


% Calcuando passo e vetor de f para o plot na frequência;
passo_f = 1;
f = [-fs/2:passo_f:fs/2];

% Criando um filtro passa baixas ideal com vetor de zeros e uns;
filtro_PB_f = [zeros(1, 48000) ones(1, 4001) zeros(1, 48000)];

% Realizando a FFT do sinal s_t;
S_f = fftshift(fft(s_t));

% Calculando o sinal filtrado Y_f através da multiplicação de S_f com o filtro passa baixas;
Y_f = abs(S_f) .* filtro_PB_f;

% Realizando a IFFT (Transformada FTT inversa) do sinal filtrado Y_f;
y_t = ifft(ifftshift(Y_f));

% Realizando os plots dos sinais: 
figure(1)
subplot(211);
plot(t, s_t);
xlim([0 5*(1/f1)]);
grid on; 
subplot(212);
plot(f,abs(S_f);

figure(2)
subplot(311)
plot(f,abs(S_f);
ylim([0 1.2])
xlim([-10000 10000])

subplot(312)
plot(f, filtro_PB_f);
ylim([0 1.2])
xlim([-10000 10000])

subplot(313)
plot(f, Y_f);
ylim([0 1.2*a1])
xlim([-10000 10000])]

figure(3)
subplot(211)
plot(f, Y_f);
ylim([0 1.2*a1])
xlim([-10000 10000])]

subplot(212)
plot(t, y_t);
xlim([0 0.002])
