#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Projetos de Filtros Por Amostragem",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "07 de Julho de 2024",
  doc,
)

= Exemplos:

== Exemplo 1:

Projete um filtro que satisfaça as especificações a seguir:
- M = 50
- Ωc1 = π/4 rad/s
- Ωc2 = π/2 rad/s
- Ωs = 2π rad/s

Abaixo está o exemplo apresentado em sala para entender o projeto do filtro:

#sourcecode[```matlab
M = 50;
Omega_c1 = pi/4;
Omega_c2 = pi/2;
ws = 2*pi;
wc1 = Omega_c1*2*pi/ws; wc2 = Omega_c2*2*pi/ws;
n = 1:M/2;
h0 = 1 - (wc2 - wc1)/pi;
haux = (sin(wc1.*n) - sin(wc2.*n))./(pi.*n);
h = [fliplr(haux) h0 haux];
[H,w]=freqz(h,1,2048,ws);
plot(w,20*log10(abs(H)))
axis([0 ws/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');
```]

== Exemplo 2:

Projete um filtro rejeita-faixa que satisfaça as especificações a seguir usando as janelas retangular, de
Hamming, de Hann e de Blackman:

 - M = 80 
 - Ωc1 = 2000 rad/s 
 - Ωc2 = 4000 rad/s 
 - Ωs = 10 000 rad/s 

#sourcecode[```matlab
clear all
M = 80;
Omega_c1 = 2000;
Omega_c2 = 4000;
Omega_s = 10000;
wc1 = Omega_c1*2*pi/Omega_s; wc2 = Omega_c2*2*pi/Omega_s;
n = 1:M/2;
h0 = 1 - (wc2 - wc1)/pi;
haux = (sin(wc1.*n) - sin(wc2.*n))./(pi.*n);
h_ideal = [fliplr(haux) h0 haux];
h_ret=h_ideal;
[H_ret,w]=freqz(h_ret,1,2048,Omega_s);
figure(1)
plot(w,20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela Retangular');

h_aux=hamming(M+1);
h_ham=h_ideal.*h_aux';
[H_ham,w]=freqz(h_ham,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hamming');

h_aux=hanning(M+1);
h_han=h_ideal.*h_aux';
[H_han,w]=freqz(h_han,1,2048,Omega_s);
figure(3)
plot(w,20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Hanning');

h_aux=blackman(M+1);
h_black=h_ideal.*h_aux';
[H_black,w]=freqz(h_black,1,2048,Omega_s);
figure(4)
plot(w,20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência - Janela de Blackman');
```]

== Exemplo 3:

Projete um filtro rejeita-faixa que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 45 dB
- Ωp1 = 800 Hz
- Ωr1 = 950 Hz
- Ωr2 = 1050 Hz
- Ωp2 = 1200 Hz
- Ωs = 6000 Hz


#sourcecode[```matlab
Ap = 1;
Ar = 45;
Omega_p1 = 800;
Omega_r1 = 950;
Omega_r2 = 1050;
Omega_p2 = 1200;
Omega_s = 6000;
delta_p = (10^(0.05*Ap) - 1)/(10^(0.05*Ap) + 1);
delta_r = 10^(-0.05*Ar);
F = [Omega_p1 Omega_r1 Omega_r2 Omega_p2];
A = [1 0 1];
ripples = [delta_p delta_r delta_p];
[M,Wn,beta,FILTYPE] = kaiserord(F,A,ripples,Omega_s);
kaiser_win = kaiser(M+1,beta);
h = fir1(M,Wn,FILTYPE,kaiser_win,'noscale');
figure(1)
stem(0:M,h)
ylabel('h[n]');
xlabel('n)');
title('Resposta ao Impulso');

[H,w]=freqz(h,1,2048,Omega_s);
figure(2)
plot(w,20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (Hz)');
title('Resposta em Frequência');
```]

== Exemplo 4:

Crie um sinal de entrada composto de três componentes senoidais, nas frequências 50 Hz, 350 Hz e 900 Hz, com Ωs = 2 kHz, com amplitudes de 5, 2 e 1, respectivamente. Projete um filtro usando as janelas retangular, Hamming, Hanning e Blackman para eliminar as componentes de 50 e 900 Hz.

#sourcecode[```matlab
clear all
M = 71;
Omega_c1 = 250;
Omega_c2 = 750;
Omega_s = 2000;
wc1 = Omega_c1*2*pi/Omega_s;
wc2 = Omega_c2*2*pi/Omega_s;
%% Resposta ao impulso do filtro ideal h[n]
n = [-1*((M-1)/2):(M-1)/2];
h_n = ((sin(wc2.*n) - sin(wc1.*n))./(pi.*n)); %resposta ao impulso para ≠0
h_n(((M-1)/2)+1) = (wc2 - wc1)/pi; %resposta ao impulso para n=0
w_hamm = 0.54 + 0.46*cos(2*n.*pi/(M));%coeficientes da janela de hamming
w_hann = 0.5 + 0.5*cos(2*n.*pi/(M));%coeficientes da janela de hanning
w_black = 0.42+0.5*cos(2*n.*pi/(M))+0.08*cos(4*n.*pi/(M)); %coeficientes da janela de blackman
h_ret = h_n;
h_hamm = w_hamm.*h_n;
h_hann = w_hann.*h_n;
h_black = w_black.*h_n;
figure
freqz(h_ret,1);
title('Filtro FIR passa-faixa - Janela Retangular')

figure
freqz(h_hamm,1);
title('Filtro FIR passa-faixa - Janela de Hammming')

figure
freqz(h_hann,1);
title('Filtro FIR passa-faixa - Janela de Hanning')

figure
freqz(h_black,1);
title('Filtro FIR passa-banda - Janela de Blackman')

%% Sinal
tmin = 0;
tmax = 2;
Fs=2000;
Ts=1/Fs;
L=(tmax-tmin)/Ts;
t=0:Ts:tmax-Ts;
s = 5*sin(2*pi*50*t) + 2*sin(2*pi*300*t) + sin(2*pi*900*t);
S = fft(s);
S = abs(2*S/L);
S = fftshift(S);
freq = Fs*(-(L/2):(L/2)-1)/L;
%% Gráficos do sinal
figure(1)
subplot(3,1,1),plot(t,s);
title('Sinal')
xlabel('t')
ylabel('s(t)')
subplot(3,1,2),plot(freq,S)
title('Espectro de Amplitude de s(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
h_hamm = w_hamm.*h_n;
h_hann = w_hann.*h_n;
h_black = w_black.*h_n;
s_f_h_ret = filter(h_ret,1,s);
S_F_h_ret = fft(s_f_h_ret);
S_F_h_ret = abs(2*S_F_h_ret/L);
S_F_h_ret = fftshift(S_F_h_ret);
subplot(3,1,3),plot(freq,S_F_h_ret)
title('Espectro de Amplitude do sinal Filtrado ')
xlabel('f (Hz)')
ylabel('|S(f)|')
```]


= Questões: 

== Questão 1:

Projete um filtro passa-faixa usando a janela de Hamming, a janela de Hanning e janela de Blackman que satisfaça a especificação a seguir.

=== M=10: 

- M = 10
- Ωc1 = 10 rad/s
- Ωc2 = 35 rad/s
- Ωs = 100 rad/s 

#sourcecode[```matlab
clear all; close all; clc; 

% Parâmetros passados pela questão: 
M = 10;          
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
```]


=== M=100:

- M = 100
- Ωc1 = 10 rad/s
- Ωc2 = 35 rad/s
- Ωs = 100 rad/s 

#sourcecode[```matlab
clear all; close all; clc; 

% Parâmetros passados pela questão: 
M = 100;          
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
```]


=== M=1000:

- M = 1000
- Ωc1 = 10 rad/s
- Ωc2 = 35 rad/s
- Ωs = 100 rad/s 

#sourcecode[```matlab
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

```]

== Questão 2:

Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 40 dB
- Ωp = 1000 rad/s
- Ωr = 1200 rad/s
- Ωs = 5000 rad/s 

#sourcecode[```matlab
% Parâmetros do filtro
```]


== Questão 3:

Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 80 dB
- Ωr1 = 800 rad/s
- Ωp1 = 1000 rad/s
- Ωp2 = 1400 rad/s
- Ωr2 = 1600 rad/s
- Ωs = 10000 rad/s 

#sourcecode[```matlab
% Parâmetros do filtro
```]

== Questão 4:

Crie um sinal de entrada composto de três componentes senoidais, nas frequências 770 Hz, 852 Hz e 941 Hz, com Ωs = 8 kHz. Projete três filtros passa-faixa digitais, o primeiro com frequência central em 770 Hz, o segundo em 852 Hz e o terceiro em 941 Hz. Para o primeiro filtro, as extremidades das faixas de rejeição estão nas frequências 697 e 852; para o segundo, em 770 e 941 Hz; para o terceiro. Em 852 e 1209 Hz. Nos três filtros, a atenuação mínima na faixa de rejeição é 60 dB. 

#sourcecode[```matlab
% Parâmetros do filtro
```]



