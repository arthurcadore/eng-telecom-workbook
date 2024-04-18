%% CONVERSÃO DE SINAIS - SÉRIES DE FOURIER
%% Aluno: Arthur Cadore M. B. 

%% Formatação base: 
close all
clear all
clc

%% Parâmetros da função:
t=-15:0.001:15;
w=pi/2;
amp=1;
a0=0;

% Primeiro Loop: 5 Harmônicas
x1=0;
for n = 1:5
    x1=x1+(4/(pi*n))*sin((pi*n)/2)*cos((pi*n*t)/2)
end
plot(t,x1);

% Segundo Loop: 15 Harmônicas
x2=0;
for n = 1:15
    x2=x2+(4/(pi*n))*sin((pi*n)/2)*cos((pi*n*t)/2)
end
plot(t,x2);

% Terceiro Loop: 25 Harmônicas
x3=0;
for n = 1:25
    x3=x3+(4/(pi*n))*sin((pi*n)/2)*cos((pi*n*t)/2)
end
plot(t,x3);

% Quarto Loop: 35 Harmônicas
x4=0;
for n = 1:25
    x4=x4+(4/(pi*n))*sin((pi*n)/2)*cos((pi*n*t)/2)
end
plot(t,x4);

%% Plotagem conjunta (para comparação): 
figure(1)
subplot(2,2,1);
plot(t,x1);
grid on
hold;

subplot(2,2,2);
plot(t,x2);
grid on
hold;

subplot(2,2,3);
plot(t,x3);
grid on
hold;

subplot(2,2,4);
plot(t,x4);
grid on
hold;
