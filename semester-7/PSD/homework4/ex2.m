clear all; close all; clc; 

% Parâmetros passados pela questão: 
M = 1000;          
Omega_c1 = 10;     
Omega_c2 = 35;     
Omega_s = 100;    

% Definição das frequências de corte em radianos:
wc1 = Omega_c1*2*pi/Omega_s;  % Frequência de corte inferior (rad/s)
wc2 = Omega_c2*2*pi/Omega_s;  % Frequência de corte superior (rad/s)

% Cálculo dos coeficientes do filtro passa-faixa ideal: 
n = 1:M/2;  
h0 = (wc2 - wc1)/pi;  
haux = (sin(wc2.*n) - sin(wc1.*n))./(pi.*n); 
h_ideal = [fliplr(haux) h0 haux];  
h_ret = h_ideal; 

% Cálculo da resposta em frequência do filtro passa-faixa ideal:
[H_ret, w] = freqz(h_ret, 1, 2048, Omega_s);

% Plot da resposta em frequência do filtro passa-faixa ideal:
figure(1)
plot(w, 20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Filtro Passa-Faixa Ideal');

% Hamming:
% Janela de Hamming com comprimento M+1
h_aux = hamming(M+1); 
h_ham = h_ideal .* h_aux';  
[H_ham, w] = freqz(h_ham, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hamming:
figure(2)
plot(w, 20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hamming');

% Hanning:
% Janela de Hanning com comprimento M+1
h_aux = hanning(M+1);  
h_han = h_ideal .* h_aux'; 
[H_han, w] = freqz(h_han, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hanning:
figure(3)
plot(w, 20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hanning');

% Blackman:
% Janela de Blackman com comprimento M+1
h_aux = blackman(M+1); 
h_black = h_ideal .* h_aux';  
[H_black, w] = freqz(h_black, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Blackman:
figure(4)
plot(w, 20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Blackman');
