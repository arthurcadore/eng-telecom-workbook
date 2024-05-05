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

== Solucionando a questão: 

Considere o diagrama de fluxo de sinais a seguir: 

#figure(
  figure(
    image("./pictures/q1.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Item A: 
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







  




=== Item B:
Desenhe o diagrama de fluxo de sinais na forma direta I.

=== Item C:
==== Desenvolvimento: 
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

==== Script Utilizado: 

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

=== Item D:
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

== Solucionando a questão:

Um sistema LIT causal é definido pelo diagrama de fluxo de sinais mostrado na Figura a seguir, que representa o sistema como uma cascata de um sistema de segunda ordem com um sistema de primeira ordem.

#figure(
  figure(
    image("./pictures/q2.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Determine: 

- Qual é a função de transferência do sistema em cascata global? 

- O sistema global é estável? Explique resumidamente. 

- Desenhe o diagrama de fluxo de sinais de uma implementação na forma direta II transposta desse sistema.

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

Determine: 

- Determine a função de transferência $𝐻[𝑧]$.

- Determine a resposta ao impulso.

- Assumindo que o sistema seja implementado em aritmética de ponto fixo de 8 bits, e que todos os produtos sejam arredondados para 8 bits antes que uma soma qualquer tenha sido realizada. Usando o modelo linear para ruído de arredondamento, encontre a variância do ruído de arredondamento na saída do filtro. (Faça passa a passo)


