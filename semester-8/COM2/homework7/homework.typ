#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#import "@preview/fletcher:0.5.4" as fletcher: diagram, node, edge
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Exercicios de Canal Binário Assimétrico",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "14 de Fevereiro de 2025",
  doc,
)

= Introdução 

O objetivo deste documento é resolver um exercício de canal binário assimétrico.

= Questões: 

== Determine a capacidade do canal

Seja uma fonte binária assimetrica com as seguintes probabilidades:

- $p(x = 0) = 0,65$

- $p(x = 1) = 0,35$

Seja o canal dado abaixo: 

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Considere: 

- P1 = 0,25

- P2 = 0,10 

- q = 0,05

Calcule a capacidade do canal.

== Resolução:


A capacidade do canal é dada originalmente pela maxima informação mutua entre a entrada $X$ e a saída $Y$ do canal, ou seja:

$
  I(X;Y) = H(Y) - H(Y|X)
$

Onde:

- $H(Y)$ é a entropia da saída do canal

- $H(Y|X)$ é a entropia condicional da saída do canal dado a entrada


=== Calcular H(X|Y)

O primeiro passo é calcular a entropia condicional da saída do canal dado a entrada, ou seja, $H(Y|X)$.


Dado o canal acima, temos que as probabilidades de transição são dadas por:

- Para $x = 0$

$
  P(y = 0) = 1 - q = 0,95 \
  P(y = 1) =  q = 0,05
$
- Para $x = 1$

$
  P(y = 0) = P_1 = 0,25 \
  P(y = 1) =  1 - P_1 = 0,75
$

Assim, temos que a entropia condicional é dada por:

$
  H(Y|X) = p(x = 0) dot H(Y|X = 0) + p(x = 1) dot H(Y|X = 1)
$

Dessa forma: 

$
  H(Y|X = 0) = -[0,95 dot log_2(0,95) + 0,05 dot log_2(0,05)] = 0,2864 \
  H(Y|X = 1) = -[0,25 dot log_2(0,25) + 0,75 dot log_2(0,75)] = 0,8113
$

Assim, temos que:

$
  H(Y|X) = 0,65 dot 0,2864 + 0,35 dot 0,8113 = 0.470115
$

=== Calcular H(Y)

Agora é necessário calcular a entropia da saída do canal, ou seja, $H(Y)$.

Dado o canal acima, temos que as probabilidades de transição são dadas por:

$
  P(y=0) = p(x=0) dot P(y=0|x=0) + p(x=1) dot P(y=0|x=1) \
  P(y=0) = 0,65 dot 0,95 + 0,35 dot 0,25 = 0,6175 + 0,0875 = 0,705 \
  P(y=1) = 1 - P(y=0) = 1 - 0,705 = 0,295
$

Agora calculando H(Y):

$
  H(Y) = -[0,705 dot log_2(0,705) + 0,295 dot log_2(0,295)] \
  H(Y) = -[0,705 dot (-0,514) + 0,295 dot (-1,76)] = 0,879
$

=== Calcular I(X;Y)

Por fim, calculamos a informação mútua entre a entrada e a saída do canal:

$
  I(X;Y) = H(Y) - H(Y|X) = 0,879 - 0,470115 = 0,4088 "bits / uso canal"
$

= Conclusão

A capacidade do canal é de 0,4088 bits por uso do canal.