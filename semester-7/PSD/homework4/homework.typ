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
  title: "Projeto de Filtros Por Janelamento",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "07 de Julho de 2024",
  doc,
)

= Fundamentação Teórica:

O janelamento é uma técnica utilizada para projetar filtros digitais, onde a resposta ao impulso do filtro ideal é multiplicada por uma janela. As janelas mais comuns são a janela retangular, de Hamming, de Hanning, de Blackman e de Kaiser Abaixo estão definidos alguns exemplos de filtros projetados por janelamento como exemplo para a resolução das questões posteriormente. 

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

Abaixo estão as resoluções das questões propostas, onde são projetados filtros passa-faixa e rejeita-faixa utilizando as janelas de Hamming, Hanning, Blackman e Kaiser.

== Questão 1:

Projete um filtro passa-faixa usando a janela de Hamming, a janela de Hanning e janela de Blackman que satisfaça a especificação a seguir. Para o projeto, varie a ordem do filtro "M" entre 10, 100 e 1000.

=== Ordem M = 10: 

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
subplot(2,2,1)
plot(w, 20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Filtro Passa-Faixa Ideal');

% Hamming:
% Janela de Hamming com comprimento M+1
h_aux = hamming(M+1); 
h_ham = h_ideal .* h_aux';  
[H_ham, w] = freqz(h_ham, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hamming:
subplot(2,2,2)
plot(w, 20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hamming');

% Hanning:
% Janela de Hanning com comprimento M+1
h_aux = hanning(M+1);  
h_han = h_ideal .* h_aux'; 
[H_han, w] = freqz(h_han, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hanning:
subplot(2,2,3)
plot(w, 20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hanning');

% Blackman:
% Janela de Blackman com comprimento M+1
h_aux = blackman(M+1); 
h_black = h_ideal .* h_aux';  
[H_black, w] = freqz(h_black, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Blackman:
subplot(2,2,4)
plot(w, 20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Blackman');
```]


Abaixo temos o plot da resposta em frequência do filtro passa-faixa ideal e dos filtros projetados com as janelas de Hamming, Hanning e Blackman para a ordem M = 10. Nota-se que a atenuação gerada pelo filtro para "M = 10" não é suficiente para atender as especificações do projeto, além de que a banda de passagem sofre uma variação consideravel do ganho em relação ao filtro ideal.

#figure(
  figure(
    rect(image("./pictures/q1.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Ordem M = 100:

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
subplot(2,2,1)
plot(w, 20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Filtro Passa-Faixa Ideal');

% Hamming:
% Janela de Hamming com comprimento M+1
h_aux = hamming(M+1); 
h_ham = h_ideal .* h_aux';  
[H_ham, w] = freqz(h_ham, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hamming:
subplot(2,2,2)
plot(w, 20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hamming');

% Hanning:
% Janela de Hanning com comprimento M+1
h_aux = hanning(M+1);  
h_han = h_ideal .* h_aux'; 
[H_han, w] = freqz(h_han, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hanning:
subplot(2,2,3)
plot(w, 20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hanning');

% Blackman:
% Janela de Blackman com comprimento M+1
h_aux = blackman(M+1); 
h_black = h_ideal .* h_aux';  
[H_black, w] = freqz(h_black, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Blackman:
subplot(2,2,4)
plot(w, 20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Blackman');
```]

Ao aumentar em 10 vezes a ordem do filtro, temos que a resposta em frequência do filtro projetado com as janelas de Hamming, Hanning e Blackman se aproximam da resposta do filtro ideal, e se assemelhando a uma resposta em frequência apropriada para um filtro passa-faixa. 

Nota-se que com essa ordem é possivel distinguir a banda de passagem e a banda de rejeição do filtro, além de que a atenuação gerada pelo filtro é suficiente para atender as especificações do projeto.

#figure(
  figure(
    rect(image("./pictures/q1.2.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


=== Ordem M = 1000:

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
subplot(2,2,1)
plot(w, 20*log10(abs(H_ret)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Filtro Passa-Faixa Ideal');

% Hamming:
% Janela de Hamming com comprimento M+1
h_aux = hamming(M+1); 
h_ham = h_ideal .* h_aux';  
[H_ham, w] = freqz(h_ham, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hamming:
subplot(2,2,2)
plot(w, 20*log10(abs(H_ham)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hamming');

% Hanning:
% Janela de Hanning com comprimento M+1
h_aux = hanning(M+1);  
h_han = h_ideal .* h_aux'; 
[H_han, w] = freqz(h_han, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Hanning:
subplot(2,2,3)
plot(w, 20*log10(abs(H_han)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Hanning');

% Blackman:
% Janela de Blackman com comprimento M+1
h_aux = blackman(M+1); 
h_black = h_ideal .* h_aux';  
[H_black, w] = freqz(h_black, 1, 2048, Omega_s);

% Plot da resposta em frequência com a janela de Blackman:
subplot(2,2,4)
plot(w, 20*log10(abs(H_black)))
axis([0 Omega_s/2 -150 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta - Janela de Blackman');
```]

Aumentando ainda mais a ordem do filtro para "M = 1000", temos a maximização da atenuação gerada pelo filtro na banda de rejeição, e uma queda mais acentuada do ganho na banda de passagem. 

Com isso, temos que a resposta em frequência do filtro projetado com as janelas de Hamming, Hanning e Blackman se aproximam ainda mais da resposta do filtro ideal, e se assemelhando a uma resposta em frequência apropriada para um filtro passa-faixa.

#figure(
  figure(
    rect(image("./pictures/q1.3.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Questão 2:

Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 40 dB
- Ωp = 1000 rad/s
- Ωr = 1200 rad/s
- Ωs = 5000 rad/s 

#sourcecode[```matlab
clear all; close all; clc; 

pkg load signal;

% Parâmetros passados pela questão: 

Omega_p = 1000;  
Omega_r = 1200;  
Omega_s = 5000;  

% Ripple de passagem em dB
Ap = 1.0; 

% Atenuação mínima em dB
Ar = 40;   


% Convertendo Ap para amplitude
delta_p = (10^(0.05*Ap) - 1) / (10^(0.05*Ap) + 1);  

% Convertendo Ar para amplitude
delta_r = 10^(-0.05*Ar);  

% Definição das frequências de corte em radianos:
F = [Omega_p Omega_r]; 
A = [1 0]; 
ripples = [delta_p delta_r]; 

% Determinação dos parâmetros do filtro usando Kaiserord:
[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Omega_s);

% Geração da janela de Kaiser:
kaiser_win = kaiser(M+1, beta);

% Projeto do filtro FIR usando fir1 com a janela de Kaiser:
h = fir1(M, Wn, FILTYPE, kaiser_win, 'noscale');

% Plot da resposta ao impulso:
figure(1)
stem(0:M, h)
ylabel('h[n]');
xlabel('n');
title('Resposta ao Impulso');

% Cálculo e plot da resposta em frequência:
[H, w] = freqz(h, 1, 2048, Omega_s);
figure(2)
plot(w, 20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');

```]

Abaixo temos a resposta em frequência do filtro projetado com a janela de Kaiser para as especificações dadas. Nota-se que a resposta em frequência do filtro projetado atende as especificações do projeto, com uma atenuação de 40dB na banda de rejeição e um ripple de 1dB na banda de passagem.

#figure(
  figure(
    rect(image("./pictures/q2.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo também é exibido a resposta ao impulso do filtro projetado, onde é possível observar a resposta ao impulso do filtro projetado com a janela de Kaiser.

#figure(
  figure(
    rect(image("./pictures/q2.2.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Questão 3: 

Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 40 dB
- Ωr = 1000 rad/s
- Ωp = 1200 rad/s
- Ωs = 5000 rad/s

|#sourcecode[```matlab
clear all; close all; clc;

pkg load signal; 

% Especificações do filtro
Ap = 1.0;          % Ripple de passagem em dB
Ar = 40;           % Atenuação mínima em dB
Omega_r = 1000;    % Frequência de rejeição em rad/s
Omega_p = 1200;    % Frequência de passagem em rad/s
Omega_s = 5000;    % Frequência de amostragem em rad/s

% Cálculo dos ripples em escala linear
delta_p = (10^(0.05*Ap) - 1) / (10^(0.05*Ap) + 1);  % Ripple de passagem
delta_r = 10^(-0.05*Ar);                            % Atenuação de rejeição

% Vetores de frequência e amplitude
F = [Omega_r Omega_p];  % Frequências de interesse
A = [0 1];              % Amplitudes desejadas (0 para rejeição, 1 para passagem)
ripples = [delta_r delta_p];  % Ripples correspondentes

% Determinação dos parâmetros do filtro usando Kaiserord
[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Omega_s);

% Geração da janela de Kaiser
kaiser_win = kaiser(M+1, beta);

% Projeto do filtro FIR usando fir1 com a janela de Kaiser
h = fir1(M, Wn, FILTYPE, kaiser_win, 'noscale');

% Plot da resposta ao impulso
figure(1)
stem(0:M, h)
ylabel('h[n]');
xlabel('n');
title('Resposta ao Impulso');

% Cálculo e plot da resposta em frequência
[H, w] = freqz(h, 1, 2048, Omega_s);
figure(2)
plot(w, 20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');
```]

Abaixo temos a resposta em frequência do filtro projetado com a janela de Kaiser para as especificações dadas. Nota-se que a resposta em frequência do filtro projetado atende as especificações do projeto, com uma atenuação de 40dB na banda de rejeição e um ripple de 1dB na banda de passagem.

Nota-se que a resposta em frequência deste filtro se assemelha bastante a resposta em frequência do filtro projetado na questão anterior, com a diferença de que a banda de passagem e a banda de rejeição estão invertidas.

#figure(
  figure(
    rect(image("./pictures/q3.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

O mesmo ocorre para a resposta ao impulso do filtro projetado, onde é possível observar a resposta ao impulso do filtro projetado com a janela de Kaiser de maneira similar ao filtro projetado na questão anterior.

#figure(
  figure(
    rect(image("./pictures/q3.2.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Questão 4:

Projete um filtro que satisfaça as especificações a seguir, usando a janela de Kaiser:

- Ap = 1,0 dB
- Ar = 80 dB
- Ωr1 = 800 rad/s
- Ωp1 = 1000 rad/s
- Ωp2 = 1400 rad/s
- Ωr2 = 1600 rad/s
- Ωs = 10000 rad/s 

#sourcecode[```matlab
clear all; close all; clc; 

pkg load signal;

% Parâmetros passados pela questão: 
Omega_r1 = 800;   
Omega_p1 = 1000;  
Omega_p2 = 1400;  
Omega_r2 = 1600;  
Omega_s = 10000;  

% Ripple de passagem em dB
Ap = 1.0;   

% Atenuação mínima em dB
Ar = 80.0;  

% Convertendo Ap para amplitude
delta_p = (10^(0.05*Ap) - 1) / (10^(0.05*Ap) + 1); 

% Convertendo Ar para amplitude
delta_r = 10^(-0.05*Ar);  

% Definição das frequências de corte em radianos:
F = [Omega_r1 Omega_p1 Omega_p2 Omega_r2]; 
A = [0 1 0];  
ripples = [delta_r delta_p delta_r]; 

% Determinação dos parâmetros do filtro usando Kaiserord:
[M, Wn, beta, FILTYPE] = kaiserord(F, A, ripples, Omega_s);

% Geração da janela de Kaiser:
kaiser_win = kaiser(M+1, beta);

% Projeto do filtro FIR usando fir1 com a janela de Kaiser:
h = fir1(M, Wn, FILTYPE, kaiser_win, 'noscale');

% Plot da resposta ao impulso:
figure(1)
stem(0:M, h)
ylabel('h[n]');
xlabel('n');
title('Resposta ao Impulso');

% Cálculo e plot da resposta em frequência:
[H, w] = freqz(h, 1, 2048, Omega_s);
figure(2)
plot(w, 20*log10(abs(H)))
axis([0 Omega_s/2 -90 10])
ylabel('Resposta de Módulo (dB)');
xlabel('Frequência (rad/s)');
title('Resposta em Frequência');
```]

Abaixo temos a resposta em frequência do filtro projetado com a janela de Kaiser para as especificações dadas. Nota-se que a resposta em frequência do filtro projetado atende as especificações do projeto, com uma atenuação de 80dB na banda de rejeição e um ripple de 1dB na banda de passagem.


#figure(
  figure(
    rect(image("./pictures/q4.2.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Abaixo também é exibido a resposta ao impulso do filtro projetado, onde é possível observar a resposta ao impulso do filtro projetado com a janela de Kaiser.

#figure(
  figure(
    rect(image("./pictures/q4.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Questão 5:

Crie um sinal de entrada composto de três componentes senoidais, nas frequências 770 Hz, 852 Hz e 941 Hz, com Ωs = 8 kHz. Projete três filtros passa-faixa digitais, o primeiro com frequência central em 770 Hz, o segundo em 852 Hz e o terceiro em 941 Hz.

Os parâmetros dados pela questão (resumo) estão abaixo. Para essa questão, será utilizado o filtro de kaiser, desta forma definimos um valor de atenuação maior que 60dB para garantir que o filtro atenda a especificação.

```
1° Filtro 
- Ωs = 8 kHz
- Ωc = 770 Hz
- Ωr1 = 697 Hz
- Ωr2 = 852 Hz

2° Filtro:
- Ωs = 8 kHz
- Ωc = 852 Hz
- Ωr1 = 770 Hz
- Ωr2 = 941 Hz

3° Filtro:
- Ωs = 8 kHz
- Ωc = 941 Hz
- Ωr1 = 852 Hz
- Ωr2 = 1209 Hz
```
 
#sourcecode[```matlab
clear all;
close all;
clc;

% Parâmetros do sinal e frequência de amostragem
Omega_s = 8000; % Frequência de amostragem em Hz

% Frequências das componentes senoidais
freq1 = 770; % Hz
freq2 = 852; % Hz
freq3 = 941; % Hz

% Amplitudes das componentes senoidais
amp1 = 5;
amp2 = 5;
amp3 = 5;

% Tempo de amostragem
tmin = 0;
tmax = 1; % segundos
fs = 1/Omega_s;
t = tmin:1/Omega_s:tmax-1/Omega_s;

t1 = 2000*fs;
t2 = 2100*fs;
% Sinal composto de três senoidais
sinal = amp1 * sin(2*pi*freq1*t) + amp2 * sin(2*pi*freq2*t) + amp3 * sin(2*pi*freq3*t);

% Plot do sinal original no tempo
figure;
subplot(2,1,1);
plot(t, sinal);
xlim([t1 t2])
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

% Calculando o espectro do sinal original
Sinal_fft = fft(sinal);
L = length(sinal);
Sinal_fft = abs(Sinal_fft/L);
Sinal_fft = Sinal_fft(1:L/2+1);
Sinal_fft(2:end-1) = 2*Sinal_fft(2:end-1);
f = Omega_s*(0:(L/2))/L;

subplot(2,1,2);
plot(f, Sinal_fft);
title('Espectro de Amplitude do Sinal Original');
xlabel('Frequência (Hz)');
ylabel('|S(f)|');

% Parâmetros dos filtros
fc1 = 770; % Frequência central do primeiro filtro
fc2 = 852; % Frequência central do segundo filtro
fc3 = 941; % Frequência central do terceiro filtro

largura_filtro = 4;

% Extremidades das faixas de rejeição para cada filtro
Omega_c1a = (697 + (((852-697)/2)/largura_filtro))  * 2 * pi / Omega_s;
Omega_c1b = (852 - (((852-697)/2)/largura_filtro)) * 2 * pi / Omega_s;

Omega_c2a = (770 + (((941-770)/2)/largura_filtro)) * 2 * pi / Omega_s;
Omega_c2b = (941 - (((941-770)/2)/largura_filtro))* 2 * pi / Omega_s;

Omega_c3a = (852 + (((1209-852)/2)/largura_filtro)) * 2 * pi / Omega_s;
Omega_c3b = (1209 - (((1209-852)/2)/largura_filtro)) * 2 * pi / Omega_s;

% Ordem dos filtros
M = 1001;

% Vetor de tempo para a resposta ao impulso
n = (-M/2:M/2)';

% Janelas de Hamming para os filtros
w_hamm = hamming(M+1);

% Filtros passa-faixa projetados
h1_n = ((sin(Omega_c1b.*n) - sin(Omega_c1a.*n))./(pi.*n));
h1_n((M+1)/2+1) = (Omega_c1b - Omega_c1a)/pi;
h1_hamm = w_hamm.*h1_n;

h2_n = ((sin(Omega_c2b.*n) - sin(Omega_c2a.*n))./(pi.*n));
h2_n((M+1)/2+1) = (Omega_c2b - Omega_c2a)/pi;
h2_hamm = w_hamm.*h2_n;

h3_n = ((sin(Omega_c3b.*n) - sin(Omega_c3a.*n))./(pi.*n));
h3_n((M+1)/2+1) = (Omega_c3b - Omega_c3a)/pi;
h3_hamm = w_hamm.*h3_n;

% Filtragem dos sinais
sinal_filtrado1 = filter(h1_hamm, 1, sinal);
sinal_filtrado2 = filter(h2_hamm, 1, sinal);
sinal_filtrado3 = filter(h3_hamm, 1, sinal);

% Calculando o espectro dos sinais filtrados
Sinal_fft_filtrado1 = fft(sinal_filtrado1);
Sinal_fft_filtrado1 = abs(Sinal_fft_filtrado1/L);
Sinal_fft_filtrado1 = Sinal_fft_filtrado1(1:L/2+1);
Sinal_fft_filtrado1(2:end-1) = 2*Sinal_fft_filtrado1(2:end-1);

Sinal_fft_filtrado2 = fft(sinal_filtrado2);
Sinal_fft_filtrado2 = abs(Sinal_fft_filtrado2/L);
Sinal_fft_filtrado2 = Sinal_fft_filtrado2(1:L/2+1);
Sinal_fft_filtrado2(2:end-1) = 2*Sinal_fft_filtrado2(2:end-1);

Sinal_fft_filtrado3 = fft(sinal_filtrado3);
Sinal_fft_filtrado3 = abs(Sinal_fft_filtrado3/L);
Sinal_fft_filtrado3 = Sinal_fft_filtrado3(1:L/2+1);
Sinal_fft_filtrado3(2:end-1) = 2*Sinal_fft_filtrado3(2:end-1);

% Plot dos sinais filtrados no tempo e no domínio da frequência
figure;

% Sinal filtrado 1
subplot(2,2,1);
plot(t, sinal_filtrado1);
xlim([t1 t2])

title('Sinal Filtrado com Filtro Passa-Faixa 1 (770 Hz)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(f, Sinal_fft_filtrado1);
title('Espectro de Amplitude do Sinal Filtrado 1');
xlabel('Frequência (Hz)');
ylabel('|S(f)|');

% Resposta em frequência do filtro 1
[H1, W1] = freqz(h1_hamm, 1, 1024, Omega_s);
subplot(2,2,[3 4]);
plot(W1, 20*log10(abs(H1)));
title('Resposta em Frequência do Filtro 1 (770 Hz)');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');

% Sinal filtrado 2
figure;
subplot(2,2,1);
plot(t, sinal_filtrado2);
xlim([t1 t2])
title('Sinal Filtrado com Filtro Passa-Faixa 2 (852 Hz)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(f, Sinal_fft_filtrado2);
title('Espectro de Amplitude do Sinal Filtrado 2');
xlabel('Frequência (Hz)');
ylabel('|S(f)|');

% Resposta em frequência do filtro 2
[H2, W2] = freqz(h2_hamm, 1, 1024, Omega_s);
subplot(2,2,[3 4]);
plot(W2, 20*log10(abs(H2)));
title('Resposta em Frequência do Filtro 2 (852 Hz)');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');

% Sinal filtrado 3
figure;
subplot(2,2,1);
plot(t, sinal_filtrado3);
xlim([t1 t2])
title('Sinal Filtrado com Filtro Passa-Faixa 3 (941 Hz)');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(2,2,2);
plot(f, Sinal_fft_filtrado3);
title('Espectro de Amplitude do Sinal Filtrado 3');
xlabel('Frequência (Hz)');
ylabel('|S(f)|');

% Resposta em frequência do filtro 3
[H3, W3] = freqz(h3_hamm, 1, 1024, Omega_s);
subplot(2,2,[3 4]);
plot(W3, 20*log10(abs(H3)));
title('Resposta em Frequência do Filtro 3 (941 Hz)');
xlabel('Frequência (Hz)');
ylabel('Magnitude (dB)');
```]

A partir do código apresentado acima, primeiramente temos o plot do sinal original no tempo e no domínio da frequência. 

O plot no dominio da frequência permite verificar que as três componentes cossenoidais estão presentes no somatório do sinal. 

#figure(
  figure(
    rect(image("./pictures/q5.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Em seguida, temos o plot do sinal filtrado (com filtro passa faixa de 770Hz) no tempo e no domínio da frequência. Nota-se que no dominio da frequência, apenas o sinal de 770Hz é mantido, enquanto os sinais de 852Hz e 941Hz são atenuados até proximo de 0. 

Também há o plot da resposta em frequência do filtro passa-faixa de 770Hz, onde é possível observar a banda de passagem e a banda de rejeição do filtro.

#figure(
  figure(
    rect(image("./pictures/q5.2.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Em seguida, temos o plot do sinal filtrado (com filtro passa faixa de 852Hz) no tempo e no domínio da frequência. Nota-se que no dominio da frequência, apenas o sinal de 852Hz é mantido, enquanto os sinais de 770Hz e 941Hz são atenuados até proximo de 0. 

Também há o plot da resposta em frequência do filtro passa-faixa de 852Hz, onde é possível observar a banda de passagem e a banda de rejeição do filtro.

#figure(
  figure(
    rect(image("./pictures/q5.3.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Em seguida, temos o plot do sinal filtrado (com filtro passa faixa de 941Hz) no tempo e no domínio da frequência. Nota-se que no dominio da frequência, apenas o sinal de 941Hz é mantido, enquanto os sinais de 770Hz e 852Hz são atenuados até proximo de 0.

Também há o plot da resposta em frequência do filtro passa-faixa de 941Hz, onde é possível observar a banda de passagem e a banda de rejeição do filtro.

#figure(
  figure(
    rect(image("./pictures/q5.4.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Desta forma, podemos concluir que os três filtros projetados atendem as especificações do projeto, onde cada filtro mantém apenas a componente senoidal desejada e atenua as demais componentes cossenoidais. 
