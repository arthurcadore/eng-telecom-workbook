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

= Questão 1: 

Considere o diagrama de fluxo de sinais a seguir: 

#figure(
  figure(
    image("./pictures/q1.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Item A: 
Determine a função de transferência $𝐻[𝑧]$ relacionando a entrada $𝑥[𝑛]$ à saída $𝑦[𝑛]$ para o filtro FIR em treliça da figura acima.

Para determinar a função de transferência, é necessário analisar o diagrama de fluxo de sinais e identificar as relações entre as variáveis de entrada e saída. 

Assim podemos retirar da figura acima as seguintes expressões:

- $x[n] + 1/4x[n -1]$

- $x[n-1] + 1/4x[n]$

- $x[n] + 1/4x[n-1] - 3/5[n-2] - 0,15[n-1]$

- $x[n-2] + 1/4x[n-1] - 3/5[n] - 0,15[n-1]$

- $y[n] = x[n] + 1/4x[n-1] - 3/5x[n-2] - 3/20x[n-1] - 2/3x[n-3] -1/6x[n-2] + 2/5x[n-1] + 1/10x[n-2] $


Desta forma, solucionando a equação acima no dominio $n$ temos que: 

$
y[n] = 1x[n] + 0,5x[n-1] - 0,666x[n-2] - 0,666x[n-3]
$

Agora, podemos passar a função expressada acima para o domino Z, onde temos que:

$
Y[z] = x[Z] + 0,5Z^{-1}x[Z] - 0,666Z^{-2}x[Z] - 0,666Z^{-3}x[Z]
$

Assim, podemos isolar a função de transferência $H[z]$ através de $Y[z]/X[z]$, onde temos que:

$
Y[Z] = X[Z] . (1 + 0,5Z^{-1} - 0,666Z^{-2} - 0,666Z^{-3})
$
$
H[Z] = Y[Z]/X[Z] = 1 + 0,5Z^{-1} - 0,666Z^{-2} - 0,666Z^{-3}
$

Podemos também encontrar os coeficientes $alpha$ utiliziando o algorimito para conversão de $k$, e calcular a equação de transferência: 

$
\k1= -1/4, \k2 = 3/5, \k3 = 2/3 
$


Para i = 1: 
$
alpha^{1}_1 = -1/4
$

Para i = 2: 
$
alpha^{2}_2 = 3/5
$

Como $i=2$ entra em $i > 1$, então $(j = 1)$, temos que: 

$
alpha^{2}_1 = alpha^{1}_1 - 3/5 alpha^{1}_1
$

Para $i = 3$: 

$
alpha^{3}_3 = 2/3
$

Como $i=3$ entra em $i > 1$, então $(j = 1)$, temos que:

$
alpha^{3}_1 = alpha^{2}_1 - 2/3 alpha^{2}_2
$

Para $j = 2$: 

$
alpha^{3}_2 = alpha^{2}_2 - 2/3 alpha^{2}_1
$

Podemos encontrar $alpha^{3}_1$ substituindo  $alpha^{2}_1$ em $alpha^{3}_1 = alpha^{2}_1 - 2/3 alpha^{2}_2$: 

$
alpha^{3}_1 = alpha^{2}_1 - 2/3 alpha^{2}_2
$
Considerando que $alpha^{2}_1  = alpha^{1}_1 - 3/5 alpha^{1}_1  
$
$
alpha^{3}_1 = alpha^{1}_1 - 3/5 alpha^{1}_1 - 2/3 alpha^{2}_2
$
$
alpha^{3}_1 = (-1/4) + (-3/5).(-1/4) + (-2/3).(3/5) = -0,5
$

Podemos encontrar $alpha^{3}_2$ substituindo $alpha^{2}_1$ em $alpha^{3}_2 = alpha^{2}_2 - 2/3 alpha^{2}_1$:

$
alpha^{3}_2 = alpha^{2}_2 - 2/3 alpha^{2}_1
$
$
alpha^{3}_2 = alpha^{2}_2 - 2/3 (alpha^{1}_1 - 3/5 alpha^{1}_1)
$
$
alpha^{3}_2 = alpha^{2}_2 - 2/3 alpha^{1}_1 + 2/5 alpha^{1}_1
$
$
alpha^{3}_2 = (3/5) + (- 3/2) . (-1/4) + (2/5).(-1/4) = 0,666
$

Portanto, temos que: 

$
alpha^{3}_1 = -0,5, alpha^{3}_2 = 0,666, alpha^{3}_3 = 0,666
$

Desta forma, a equação no tempo é dada por: 

$
y[n] = 1x[n] + 0,5x[n-1] - 0,666x[n-2] - 0,666x[n-3]
$

Realizando a transformada Z, temos que: 

$
Y[Z] = X[Z] . (1 + 0,5Z^{-1} - 0,666Z^{-2} - 0,666Z^{-3})
$

Rearranjando a equação, temos que:
$
H[Z] = Y[Z]/X[Z] = 1 + 0,5Z^{-1} - 0,666Z^{-2} - 0,666Z^{-3}
$

Podemos também encontrar a equação de transferência utilizando a forma recursiva, para isso temos que:

$
\k1= -1/4, \k2 = 3/5, \k3 = 2/3 
$
$
A^{0}(Z) = B^{0}(Z) = 1
$
$
A^{i}(Z) = A{i-1}(Z) - \k{i}Z^{-1}B{i-1}(Z)
$
$
B^{i}(Z) = -\k{i}A^{i-1}(Z) + Z^{-1}B^{i-1}(Z)
$

Dessa forma, Para $i = 1$ temos que:

$
A^{1}(Z) = A{0}(Z) - \k_1 Z^{-1}B{0}(Z)
$
$
A^{1}(Z) = 1 - (-1/4)Z^{-1}
$
$
A^{1}(Z) = 1 + 1/4Z^{-1}
$
\
\
$
B^{1}(Z) = -\k_1A^{0}(Z) + Z^{-1}B^{0}(Z)
$
$
B^{1}(Z) = -(-1/4)Z^{-1} + Z^{-1}
$
$
B^{1}(Z) = 1/4 + Z^{-1}
$
\
\
Para $i = 2$ temos que:

$
A^{2}(Z) = A{1}(Z) - \k_2 Z^{-1}B{1}(Z)
$
$
A^{2}(Z) = 1 - (-1/4)Z^{-1} - (3/20)Z^{-1} - 3/5Z^{-2}
$
$
A^{2}(Z) = 1 + 1/10Z^{-1} - 3/5Z^{-2}
$
\
\
$
B^{2}(Z) = -\k_2A^{1}(Z) + Z^{-1}B^{1}(Z)
$
$
B^{2}(Z) = -3/5(1 + 1/4Z^{-1}) + Z^{-1}(1/4 + Z^{-1})
$
$
B^{2}(Z) = -3/5 - 3/20Z^{-1} + 1/4Z^{-1} + Z^{-2}
$
$
B^{2}(Z) = -3/5 + 1/10Z^{-1} + Z^{-2}
$

Para $i = 3$, temos que:

$
A^{3}(Z) = A{2}(Z) - \k_3 Z^{-1}B{2}(Z)
$
$
A^{3}(Z) = 1 - (-1/10)Z^{-1} - 3/5Z^{-2} - 2/3Z^{-1} (-3/5 + 1/10Z^{-1} + Z^{-2})
$
$
A^{3}(Z) = 1 + 1/10Z^{-1} - 3/5Z^{-2} + 6/15Z^{-1} - 2/30Z^{-2} - 2/3Z^{-3}
$
$
A^{3}(Z) =  1 + 1/2Z^-1 - 20/30Z^{-2} - 2/3Z^{-3}
$

Desta forma, temos que

$
A^{3}(Z) = H[Z] =  1 + 1/2Z^-1 - 2/3Z^{-2} - 2/3Z^{-3}
$

== Item B:
Desenhe o diagrama de fluxo de sinais na forma direta I.

O diagrama de fluxo de sinais na forma direta I é apresentado abaixo:

#figure(
  figure(
    image("./pictures/q1-2.svg",width: 60%),
    numbering: none,
    caption: [Diagrama de Fluxo de Sinais na Forma Direta I]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Item C:
=== Desenvolvimento: 
Determine e trace o gráfico da resposta ao impulso unitário.

Conforme obtido no Item A, temos que: 

$
H[Z] = 1 + 1/2Z^-1 - 2/3Z^{-2} - 2/3Z^{-3}
$

Portanto, aplicando um impulso unitário, temos que a resposta ao impulso é dada por:

$
H[n] = delta[n] + 1/2delta[n-1] - 2/3delta[n-2] - 2/3delta[n-3]
$

Assim, realizando um plot em octave, temos o seguinte gráfico para a resposta ao impulso:

#figure(
  figure(
    image("./pictures/q1-c.png"),
    numbering: none,
    caption: [Resposta ao Impulso Unitário]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Script Utilizado: 

Para o desenvolvimento desta questão, utilizei o seguite script octave: 

#sourcecode[```matlab
% Definindo a resposta ao impulso H[n]

% Criando um vetor com 10 amostras
n = 0:10;

% Adicionando a resposta ao impulso e algumas amostras com zero para melhor visualização
H = [1, 1/2, -2/3, -2/3, 0, 0, 0, 0, 0, 0, 0];

% Realizando o plot com stem da resposta: 
stem(n, H, 'filled');
xlabel('n');
ylabel('H[n]');
title('Resposta ao Impulso H[n]');
grid on;
```]

== Item D:
Desenhe a estrutura do filtro em treliça para o filtro só-pólos $1/𝐻[𝑧]$
\

Para desenhar a estrutura, podemos determinar o filtro só polos $1/H[z]$ utilizando: 

$
F(Z) = 1/H[Z] = F(Z) = 1/((1 + 1/2Z^-1 - 2/3Z^{-2} - 2/3Z^{-3}))
$

Desta forma, a estrutura é dada pela seguinte ilustração: 

#figure(
  figure(
    image("./pictures/q1-d.svg"),
    numbering: none,
    caption: [Estrutura do Filtro em Treliça Só-Polos]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 2: 

Um sistema LIT causal é definido pelo diagrama de fluxo de sinais mostrado na Figura a seguir, que representa o sistema como uma cascata de um sistema de segunda ordem com um sistema de primeira ordem.

#figure(
  figure(
    image("./pictures/q2.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Item A: 
=== Desenvolvimento:
Qual é a função de transferência do sistema em cascata global? 

Para encontrarmos a função de transferência do sistema em cascata global, primeiramente, os nós somadores foram identificados e o sistema foi dividido em duas partes, onde o $y_1[n]$ do primeiro sistema é o $x_2[n]$ do segundo sistema: 

#figure(
  figure(
    image("./pictures/q2-2.png"),
    numbering: none,
    caption: [Nós somadores identificados]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Desta forma, podemos obter as expressões abaixo: 

$
a[n] = 0,3b[n-1] + 0,4b[n-2] 
$
$
b[n] = x[n] + a[n]
$
$
\y1[n] = b[n] + 0,81b[n-2]
$

Passando as expressões para o dominio Z, tem os que: 

$
A[Z] = 0,3Z^{-1}B[Z] + 0,4Z^{-2}B[Z]
$
$
B[Z] = X[Z] + A[Z]
$
$
\Y1[Z] = B[Z] + 0,81Z^{-2}B[Z]
$

Isolando $B[Z]$ nas expressões, temos que: 

$
B[Z] = X[Z] + 0,3Z^{-1}B[Z] + 0,4Z^{-2}B[Z]
$
$
X[Z] = B[Z] (1 - 0,3Z^{-1} - 0,4Z^{-2})
$
$
Y[Z] = B[Z] (1 + 0,81Z^{-2})
$

Portanto, podemos calcular a função de transferência $\H1$ do primeiro sistema: 

$
\H1[Z] = \Y1[Z]/X[Z] = (B[Z](1 + 0,81Z^{-2})) / (B[Z](1 - 0,3Z^{-1} - 0,4Z^{-2}))
$

$
\H1[Z] = (1 + 0,81Z^{-2}) /(1 - 0,3Z^{-1} - 0,4Z^{-2})
$

Para o segundo sistema, temos as seguintes equações: 

$
c[n] = 2x[n] - 0,8y[n]
$
$
y[n] = x[n] + c[n-1]
$

Passando para o dominio Z, temos as seguintes expressões: 

$
C[Z] = 2X[Z] - 0,8Y[Z]
$
$
Y[Z] = X[Z] + C[Z]Z^{-1}
$

Aplicando C[Z] em Y[Z], temos que:

$
Y[Z] = X[Z] + 2Z^{-1}X[Z] - 0,8Z^{-1} Y[Z] 
$

Isolando Y[Z], temos que:

$
Y[Z] + 0,8Z^{-1}Y[Z] = X[Z] + 2Z^{-1}X[Z]
$

$
Y[Z] (1 + 0,8Z^{-1}) = X[Z] (1 + 2Z^{-1})
$

Desta forma, podemos calcular a função de transferência $\H2$ do segundo sistema:

$
\H2[Z] = Y[Z]/X[Z] = (1 + 2Z^{-1}) / (1 + 0,8Z^{-1}) 
$

$
\H2[Z] = (1 + 2Z^{-1}) / (1 + 0,8Z^{-1}) 
$

Assim, podemos calcular a função de transferência global do sistema em cascata, realizando a multiplicação de $\H1[Z]$ por $\H2[Z]$:

$
H[Z] = ((1 + 0,81Z^{-2})) /((1 - 0,3Z^{-1} - 0,4Z^{-2})) . ((1 + 2Z^{-1})) / ((1 + 0,8Z^{-1}))
$

Desta forma, a equação de transferência do sistema em cascata(calculada através do script ocateve) é dada por:

$
H[Z] = (1 + 2Z^{-1} + 0,81Z^{-2} + 1,62Z^{-3}) / (1 + 0,5Z^{-1} - 0,64Z^{-2} - 0,32Z^{-3})
$

=== Script Utilizado:

Para o desenvolvimento desta questão, utilizei o seguinte script em octave:

#sourcecode[```matlab
clear all; close all; clc;
pkg load signal

% Definindo as variáveis de entrada dadas pelo calculo de H1 e H2
y1 = roots([1 0 0.81]);
x1 = roots([1 -0.3 -0.4]);
y2 = roots([1 2]);
x2 = roots([1 0.8]);

% Calculando os polos e zeros da função de transferência:
polos_H = poly([0+0.9000i 0-0.9000i -2])
zeros_H = poly([0.8000 -0.5000 -0.8000])
```]

== Item B:
=== Desenvolvimento:
O sistema global é estável? Explique resumidamente. 

Sim, o sistema é estável. Para determinar a estabilidade do sistema, é necessário analisar os polos da função de transferência.

Para isso, a função de transferência calculada no item anterior teve seus polos e zeros plotados, conforme apresentado abaixo. Note que como *todos os polos  encontram-se dentro do circulo de raio unitário, o sistema é considerado estável*

#figure(
  figure(
    image("./pictures/q2-b.png"),
    numbering: none,
    caption: [Polos e Zeros da Função de Transferência]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Script Utilizado:

Para o desenvolvimento desta questão, utilizei o seguinte script em octave:

#sourcecode[```matlab
clear all; close all; clc;
pkg load signal

% Definindo as variáveis de entrada dadas pelo calculo de H1 e H2
y1 = roots([1 0 0.81]);
x1 = roots([1 -0.3 -0.4]);
y2 = roots([1 2]);
x2 = roots([1 0.8]);

% Calculando os polos e zeros da função de transferência:
polos_H = poly([0+0.9000i 0-0.9000i -2])
zeros_H = poly([0.8000 -0.5000 -0.8000])

% Plotar o gráfico de polos e zeros
figure(1)
zplane([polos_H],[zeros_H]);
title('Pólos e zeros da função de transferência');
set(findall(gcf, 'type', 'line'), 'linewidth', 2);
```]	

== Item C:
Desenhe o diagrama de fluxo de sinais de uma implementação na forma direta II transposta desse sistema.

A partir da função de transferência obtida no item A, podemos desenhar o diagrama de fluxo de sinais de uma implementação na forma direta II transposta do sistema.

#figure(
  figure(
    image("./pictures/q2-3.svg", width: 80%),
    numbering: none,
    caption: [Implementação na Forma Direta II Transposta]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 3: 

== Solucionando a questão:

A figura a seguir mostra uma implementação em forma direta II de um sistema: 

#figure(
  figure(
    image("./pictures/q3.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Item A:
Determine a função de transferência $𝐻[𝑧]$.

A função de transferência do sistema pode ser obtida analisando diretamente o diagrama conforme apresentado abaixo: 

#figure(
  figure(
    image("./pictures/q3-1.png"),
    numbering: none,
    caption: [Coeficientes do Sistema]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Sendo: 
$
A = 0,5
$
$
B = 0,2
$
$
C = 1
$

A função de transferência do sistema é dada por:

$
H[Z] = (C + \BZ^{-1})/ (1 - \AZ{-1}) = (1 + 0,2Z^{-1})/ (1 - 0,5Z^{-1})
$

== Item B:
Determine a resposta ao impulso.

A resposta ao impulso até o primeiro nó é dada por:

$
\h1[n] = 0,5^{n-1} u[n]
$

Para o segundo nó, a resposta ao impulso é dada pela seguinte expressão (baseada na resposa ao impulso até o primeiro nó): 

$
\h2[n] = (0,5^{n-1} u[n]) + (0,2(0,5)^{n-1}u[n-1])
$

== Item C: 
Assumindo que o sistema seja implementado em aritmética de ponto fixo de 8 bits, e que todos os produtos sejam arredondados para 8 bits antes que uma soma qualquer tenha sido realizada. Usando o modelo linear para ruído de arredondamento, encontre a variância do ruído de arredondamento na saída do filtro. (Faça passa a passo)

Para encontrar a variância do ruido de arredondamento, considero o modelo linear do ruído de arredondamento exibido abaixo: 

#figure(
  figure(
    image("./pictures/q3-2.png"),
    numbering: none,
    caption: [Modelo Linear do Ruído de Arredondamento]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Pela definição temos que a quantidade de bits é dada por: 
$
B + 1 = 8 
$

Portanto, B = 7

Desta forma, podemos calcular a variância do ruído do ponto dada por $sigma^2_e$. Tal que: 

$
sigma^2_e = 2^{-2B} / 12
$

Assim, temos que:

$
sigma^2_e = 2^{-2.7} / 12 = 2^{-14} / 12 = 0,00006103515625/12 = 0,00000508626302
$

Agora, para calcular a variância do ruído de saida do sistema, temos que: 

c = b0 
b = b1
a = a1
$
sigma^2_f = sigma^2_e + sigma^2_e (C^2 + B^2 + 2A.B.C)/(1-A^2)
$
$
sigma^2_f = 0,00000508626302 + 0,00000508626((1^2 + 0,2^2 + 2. 0,5 . 1 . 2 ))/(1 - 0,5^2)
$
$
sigma^2_f = 0,00000508626302 + 0,00000840928
$
$
sigma^2_f = 0,00001349554302
$