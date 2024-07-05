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
  title: "Filtros Digitais",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "05 de Maio de 2024",
  doc,
)

= Exemplo: 

#sourcecode[```matlab
clear all  % Limpa todas as variáveis e funções da área de trabalho

M = 52;  % Define a ordem do filtro
N = M + 1;  % Define o comprimento do filtro
Omega_p = 4;  % Frequência de passagem
Omega_r = 4.2;  % Frequência de rejeição
Omega_s = 10;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

A = [ones(1, kp + 1) zeros(1, M / 2 - kr + 1)];  % Vetor de resposta ideal em frequência

% Corrigindo o cálculo de 'A' para evitar vetores de tamanho não inteiro
A = [ones(1, kp + 1) zeros(1, ceil(M / 2 - kr) + 1)];

% Ajuste de kp se a diferença entre kr e kp for maior que 1
if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

k = 1:M/2;  % Índices para o cálculo da resposta ao impulso
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

h = h / N;  % Normalização da resposta ao impulso

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

#figure(
  figure(
    rect(image("./pictures/ex1.1.png")),
    numbering: none,
    caption: [Forma de onda no domínio do tempo e densidade espectral de potência do sinal filtrado.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/ex1.2.png")),
    numbering: none,
    caption: [Forma ]
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
clear all  % Limpa todas as variáveis e funções da área de trabalho

% Definindo os parâmetros do filtro
M = 200;  % Define a ordem do filtro
N = M + 1;  % Define o comprimento do filtro
Omega_p = 4.0;  % Frequência de passagem
Omega_r = 4.2;  % Frequência de rejeição
Omega_s = 10.0;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

% Corrigindo o cálculo de 'A' para evitar vetores de tamanho não inteiro
A = [ones(1, kp + 1) zeros(1, N - (kp + 1))];

% Ajuste de kp se a diferença entre kr e kp for maior que 1
if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

k = 1:M/2;  % Índices para o cálculo da resposta ao impulso
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

h = h / N;  % Normalização da resposta ao impulso

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

#figure(
  figure(
    rect(image("./pictures/q1.1.png")),
    numbering: none,
    caption: [Forma de onda no domínio do tempo e densidade espectral de potência do sinal filtrado.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q1.2.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


= Questão 2: 

Projete um filtro passa-altas usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 
- Agora aumente o número de amostras, mantendo a paridade e faça suas considerações.

#sourcecode[```matlab
clear all  % Limpa todas as variáveis e funções da área de trabalho

% Definindo os parâmetros do filtro
M = 52;  % Define a ordem do filtro
N = M + 1;  % Define o comprimento do filtro
Omega_r = 4.0;  % Frequência de rejeição
Omega_p = 4.2;  % Frequência de passagem
Omega_s = 10.0;  % Frequência de amostragem

kp = floor(N * Omega_p / Omega_s);  % Índice de passagem
kr = floor(N * Omega_r / Omega_s);  % Índice de rejeição

% Corrigindo o cálculo de 'A' para evitar vetores de tamanho não inteiro
A = [zeros(1, kr) ones(1, N - kr)];

% Ajuste de kr se a diferença entre kr e kp for maior que 1
if (kr - kp) > 1
    kp = kr - 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

k = 1:M/2;  % Índices para o cálculo da resposta ao impulso
for n = 0:M
    h(n + 1) = A(1) + 2 * sum((-1) .^ k .* A(k + 1) .* cos(pi * k * (1 + 2 * n) / N));
end

h = h / N;  % Normalização da resposta ao impulso

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

#figure(
  figure(
    rect(image("./pictures/q2.1.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q2.2.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


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
clear all  % Limpa todas as variáveis e funções da área de trabalho

% Definindo os parâmetros do filtro
M = 104;  % Aumentar a ordem do filtro para 104 (paridade mantida)
N = M + 1;  % Define o comprimento do filtro
Omega_r1 = 2.0;  % Frequência de rejeição 1
Omega_p1 = 3.0;  % Frequência de passagem 1
Omega_r2 = 7.0;  % Frequência de rejeição 2
Omega_p2 = 8.0;  % Frequência de passagem 2
Omega_s = 20.0;  % Frequência de amostragem

kr1 = floor(N * Omega_r1 / Omega_s);  % Índice de rejeição 1
kp1 = floor(N * Omega_p1 / Omega_s);  % Índice de passagem 1
kr2 = floor(N * Omega_r2 / Omega_s);  % Índice de rejeição 2
kp2 = floor(N * Omega_p2 / Omega_s);  % Índice de passagem 2

% Criando o vetor de resposta em frequência desejada
A = zeros(1, N);
A(kp1:kr2) = 1;  % Passa-faixa

% Ajuste dos índices para evitar vetores de tamanho não inteiro
if (kr1 - kp1) > 1
    kp1 = kr1 - 1;
end
if (kp2 - kr2) > 1
    kp2 = kr2 + 1;
end

% Inicializando o vetor de resposta ao impulso
h = zeros(1, N);

k = 1:M/2;  % Índices para o cálculo da resposta ao impulso
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

#figure(
  figure(
    rect(image("./pictures/q3.1.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q3.2.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 4: 

Projete um filtro rejeita-faixa usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 

#sourcecode[```matlab
clear all
M = 52; 
N = M + 1; 
Omega_p1 = 2; 
Omega_r1 = 3; 
Omega_r2 = 7; 
Omega_p2 = 8; 
Omega_s = 20; 

kp1 = floor(N * Omega_p1 / Omega_s);
kr1 = floor(N * Omega_r1 / Omega_s);
kr2 = floor(N * Omega_r2 / Omega_s);
kp2 = floor(N * Omega_p2 / Omega_s);

A = [ones(1, kp1 + 1), zeros(1, kr2 - kp1 + 1), ones(1, M/2 - kp2 + 3)];

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

#figure(
  figure(
    rect(image("./pictures/q4.1.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/q4.2.png")),
    numbering: none,
    caption: [Forma ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


= Questão 5: 

Projete um filtro passa-faixa tipo III usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 

= Questão 6:

Projete um filtro passa-baixas usando o método da amostragem em frequência que satisfaça a especificação a seguir

- M = 53
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 
