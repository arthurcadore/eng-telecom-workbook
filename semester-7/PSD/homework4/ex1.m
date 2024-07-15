clear all
M = 80;
Omega_c1 = 2000;
Omega_c2 = 4000;
Omega_s = 10000;
wc1 = Omega_c1*2*pi/Omega_s; wc2 = Omega_c2*2*pi/Omega_s;
n = 1:M/2;
h0 = (wc2 - wc1)/pi; % Coeficiente central para passa-faixa
haux = (sin(wc2.*n) - sin(wc1.*n))./(pi.*n);
h_ideal = [fliplr(haux) h0 haux]; % Coeficientes do filtro passa-faixa
h_ret = h_ideal;
[H_ret,w] = freqz(h_ret,1,2048,Omega_s);
figure(1)
plot(w,20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Filtro Passa-Faixa Retangular');

% Hamming: 

h_aux = hamming(M+1);
h_ham = h_ideal.*h_aux';
[H_ham,w] = freqz(h_ham,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hamming');

% Hanning: 

h_aux = hanning(M+1);
h_han = h_ideal.*h_aux';
[H_han,w] = freqz(h_han,1,2048,Omega_s);
figure(3)
plot(w,20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hanning');

% Blackman: 

h_aux = blackman(M+1);
h_black = h_ideal.*h_aux';
[H_black,w] = freqz(h_black,1,2048,Omega_s);
figure(4)
plot(w,20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Blackman');
