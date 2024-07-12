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

= Exemplo: 

Abaixo está o exemplo apresentado em sala para entender o projeto do filtro:

#sourcecode[```matlab

clear all; close all; clc;

% Define a ordem do filtro
M = 52;  
% Define o comprimento do filtro
N = M + 1;  

Omega_p = 4;  % Frequência de passagem
Omega_r = 4.2;  % Frequência de rejeição
Omega_s = 10;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

% Criando o vetor 'A' 
A = [ones(1, kp + 1) zeros(1, ceil(M / 2 - kr) + 1)];

% Ajuste de kp se a diferença entre kr e kp for maior que 1
if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

% Realizando laço de criação do vetor de resposta ao impuslo
k = 1:M/2; 
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

% Normalização da resposta ao impulso
h = h / N;  

% Calculando a resposta em frequência
[H, w] = freqz(h, 1, 2048, Omega_s);

% Plotando a resposta em frequência
figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

% Plotando a resposta ao impulso
figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/ex1.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/ex1.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 1:

Projete um filtro passa-baixas usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 200
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 

#sourcecode[```matlab
clear all; close all; clc;

% Define a ordem do filtro

 % Define a ordem do filtro
M = 200;

% Define o comprimento do filtro
N = M + 1; 

Omega_p = 4.0;  % Frequência de passagem
Omega_r = 4.2;  % Frequência de rejeição
Omega_s = 10.0;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

 % Vetor de resposta em frequência
A = [ones(1, kp + 1) zeros(1, N - (kp + 1))];

% Criando o vetor 'A' 
if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

% Realizando laço de criação do vetor de resposta ao impuslo
k = 1:M/2; 
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

% Normalização da resposta ao impulso
h = h / N;  

% Calculando a resposta em frequência
[H, w] = freqz(h, 1, 2048, Omega_s);

% Plotando a resposta em frequência
figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

% Plotando a resposta ao impulso
figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q1.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q1.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com ganho/atenuação 0 dB na frequência de passagem (até 4 rad/s) e atenuação de 50 dB na frequência de rejeição (a partir de 4,2 rad/s). A resposta ao impulso do filtro é apresentada na segunda imagem, onde podemos ver que o filtro possui uma resposta ao impulso com 201 amostras, sendo a amostra central a de maior valor.

= Questão 2: 

Projete um filtro passa-altas usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 
- Agora aumente o número de amostras, mantendo a paridade e faça suas considerações.

#sourcecode[```matlab

clear all; close all; clc;

% Define a ordem do filtro
M = 52;  

% Define o comprimento do filtro
N = M + 1;  

Omega_r = 4.0;  % Frequência de rejeição
Omega_p = 4.2;  % Frequência de passagem
Omega_s = 10.0;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

 % Vetor de resposta em frequência
A = [zeros(1, kr) ones(1, N - kr)];

if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

% Realizando laço de criação do vetor de resposta ao impuslo
k = 1:M/2;  
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

% Normalização da resposta ao impulso
h = h / N;  

% Calculando a resposta em frequência
[H, w] = freqz(h, 1, 2048, Omega_s);

% Plotando a resposta em frequência
figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

% Plotando a resposta ao impulso
figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q2.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q2.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com ganho/atenuação 0 dB nas frequências de passagem (a partir de 4dB, considerando que não há flutuações de ganho na banda de passagem), e nas frequências de rejeição (até 4dB) um ganho variavel entre -20 e -50dB, variando de acordo com a frequência. 

A resposta ao impulso do filtro é apresentada na segunda imagem, onde podemos ver que o filtro possui uma resposta ao impulso com 105 amostras, sendo a amostra central a de maior valor.


= Questão 3: 

Projete um filtro passa-faixa usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 
- Agora aumente o número de amostras, mantendo sua paridade e faça suas considerações.

#sourcecode[```matlab

clear all; close all; clc;

% Define a ordem do filtro
M = 104;

% Define o comprimento do filtro
N = M + 1;  

Omega_r1 = 2.0;  % Frequência de rejeição 1
Omega_p1 = 3.0;  % Frequência de passagem 1
Omega_r2 = 7.0;  % Frequência de rejeição 2
Omega_p2 = 8.0;  % Frequência de passagem 2
Omega_s = 20.0;  % Frequência de amostragem

kr1 = floor(N * Omega_r1 / Omega_s);  % Índice de rejeição 1
kp1 = floor(N * Omega_p1 / Omega_s);  % Índice de passagem 1
kr2 = floor(N * Omega_r2 / Omega_s);  % Índice de rejeição 2
kp2 = floor(N * Omega_p2 / Omega_s);  % Índice de passagem 2

 % Vetor de resposta em frequência
A = zeros(1, N);
A(kp1:kr2) = 1;  % Passa-faixa

% Ajustando dos índices para evitar vetores de tamanho não inteiro
if (kr1 - kp1) > 1
    kp1 = kr1 - 1;
end
if (kp2 - kr2) > 1
    kp2 = kr2 + 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

% Índices para o cálculo da resposta ao impulso
k = 1:M/2;  
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

h = h / N;  % Normalização da resposta ao impulso

% Calculando a resposta em frequência
[H, w] = freqz(h, 1, 2048, Omega_s);

% Plotando a resposta em frequência
figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 10 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência com M aumentado')

% Plotando a resposta ao impulso
figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q3.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q3.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com ganho/atenuação 0 dB nas frequências de passagem (de 3 a 7 rad/s), e nas frequências de rejeição (até 2 e a partir de 8 rad/s) um ganho variavel entre -20 e -50dB, variando de acordo com a frequência.



= Questão 4: 

Projete um filtro rejeita-faixa usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 

#sourcecode[```matlab

clear all; close all; clc;

% Define a ordem do filtro
M = 52; 
% Define o comprimento do filtro
N = M + 1; 

Omega_p1 = 2; % Frequência de passagem 1
Omega_r1 = 3; % Frequência de rejeição 1  
Omega_r2 = 7; % Frequência de passagem 2
Omega_p2 = 8; % Frequência de rejeição 2
Omega_s = 20; % Frequência de amostragem

kp1 = floor(N * Omega_p1 / Omega_s); % Índice de rejeição 1 
kr1 = floor(N * Omega_r1 / Omega_s); % Índice de passagem 1
kr2 = floor(N * Omega_r2 / Omega_s); % Índice de rejeição 2
kp2 = floor(N * Omega_p2 / Omega_s); % Índice de passagem 2

 % Vetor de resposta em frequência
A = [ones(1, kp1 + 1), zeros(1, kr2 - kp1 + 1), ones(1, M/2 - kp2 + 3)];

% Inicializando o vetor de resposta ao impulso
k = 1:M/2;
h = zeros(1, N);
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1).^k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

h = h ./ N;

[H, w] = freqz(h, 1, 2048, Omega_s);

figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 10 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q4.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q4.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com um ganho variavel entre -20 e -50dB nas frequências de rejeição (de 3 a 7 rad/s), e nas frequências de passagem (até 2 e a partir de 8 rad/s) um ganho 0 (tendo flutuações de acordo com a frequência). A resposta ao impulso do filtro é apresentada na segunda imagem, onde podemos ver que o filtro possui uma resposta ao impulso com 53 amostras, sendo a amostra central a de menor valor.




= Questão 5: 

Projete um filtro passa-faixa tipo III usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 

#sourcecode[```matlab
clear all; close all; clc;

% Define a ordem do filtro
M = 52; 
% Define o comprimento do filtro
N = M + 1; 

Omega_p1 = 3; % Frequência de rejeição 1
Omega_r1 = 2; % Frequência de passagem 1
Omega_r2 = 7; % Frequência de rejeição 2
Omega_p2 = 8; % Frequência de passagem 2
Omega_s = 20; % Frequência de amostragem

kp1 = floor(N * Omega_p1 / Omega_s); % Índice de rejeição 1
kr1 = floor(N * Omega_r1 / Omega_s); % Índice de passagem 1
kr2 = floor(N * Omega_r2 / Omega_s); % Índice de rejeição 2
kp2 = floor(N * Omega_p2 / Omega_s); % Índice de passagem 2

 % Vetor de resposta em frequência
A = [zeros(1, kr1+1), ones(1, kp2 - kr1 + 1), zeros(1, kr2 - kp1 + 1)];

% Inicializando o vetor de resposta ao impulso
k = 1:M/2;
h = zeros(1, N);
for n = 0:M
    h(n + 1) = 2 * sum((-1).^(k+1) .* A(k + 1) .* sin(pi * k * (1 + 2 * n) / N));
end

h = h ./ N;

[H, w] = freqz(h, 1, 2048, Omega_s);

figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 10 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q5.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado  ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q5.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com um ganho variavel entre -20 e -50dB nas frequências de rejeição (menor que 2 e maior que 9 rad/s), e nas frequências de passagem (até 2 e a partir de 8 rad/s) um ganho 0 (tendo flutuações de acordo com a frequência). A resposta ao impulso do filtro é apresentada na segunda imagem, onde podemos ver que o filtro possui uma resposta ao impulso com 53 amostras, sendo a amostra central a de menor valor.



= Questão 6:

Projete um filtro passa-baixas usando o método da amostragem em frequência que satisfaça a especificação a seguir

- M = 53
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 

#sourcecode[```matlab
clear all; close all; clc;

% Define a ordem do filtro
M = 53;
% Define o comprimento do filtro
N = M + 1;

Omega_p = 4; % Frequência de rejeição
Omega_r = 4.2; % Frequência de passagem
Omega_s = 10; % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

 % Vetor de resposta em frequência
A = [ones(1, kp + 1), zeros(1, N/2 - kp - 1)];

if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
k = 1:M/2;
h = zeros(1, N);

% Realizando laço de criação do vetor de resposta ao impuslo
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1).^k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

% Normalização da resposta ao impulso
h = h ./ N;

[H, w] = freqz(h, 1, 2048, Omega_s);

figure(1)
plot(w, 20 * log10(abs(H)))
axis([0 5 -50 10])
ylabel('Resposta de Módulo (dB)')
xlabel('Frequência (rad/s)')
title('Resposta em Frequência')

figure(2)
stem(h)
ylabel('Resposta ao impulso')
xlabel('Amostras (n)')
```]

A partir deste script, temos os seguintes resultados: 

#figure(
  figure(
    rect(image("./pictures/q6.1.png")),
    numbering: none,
    caption: [Forma de filtragem do filtro projetado ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q6.2.png")),
    numbering: none,
    caption: [Resposta ao impulso do filtro ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como podemos ver pelas imagens apresentadas, o filtro possui uma resposa em frequência com um ganho 0 dB nas frequências de passagem (até 4 rad/s), e nas frequências de rejeição (a partir de 4,2 rad/s) um ganho variavel entre -20 e -50dB, variando de acordo com a frequência. A resposta ao impulso do filtro é apresentada na segunda imagem, onde podemos ver que o filtro possui uma resposta ao impulso com 54 amostras, sendo a amostra central a de maior valor.