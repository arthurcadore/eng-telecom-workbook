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
  title: "Conceitos Gerais Sobre Energia 
e Transferência de Calor: Exercicios 6",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "05 de Maio de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o item 1.4 (1.4.1-1.4.3) (pp. 23 a 27) e em seguida responder as questões apresentadas abaixo.

= Questões:

== Questão 1:

Um corpo cuja superfície externa tem área 0,5 m², emissividade 0,8 e temperatura 150°C é colocado em uma câmara evacuada, muito maior que o corpo. As paredes da câmara são mantidas a 25°C. Qual a taxa de troca líquida de radiação entre o corpo e as paredes da câmara?

$
  Q_"liquido" = epsilon . sigma . A . (T_"corpo"^4 - T_"parede"^4)
$

Onde:

- $Q_"liquido"$ = taxa de troca líquida de radiação (W) 
- $epsilon$ = emissividade da superfície do corpo 
- $sigma$ = constante de Stefan-Boltzmann (5,67 x 10^-8 W/m².K^4)
- $A$ = área da superfície do corpo (m²)
- $T_"corpo"$ = temperatura do corpo (K)
- $T_"parede"$ = temperatura da parede (K)

Substituindo os valores:

$
  Q_"liquido" = 0,8 . (5,67 . 10^-8) . 0,5 . ((150 + 273)^4 - (25 + 273)^4)
$

$
  Q_"liquido" = 0,8 . (5,67 . 10^-8) . 0,5 . (423^4 - 298^4)
$

$
  Q_"liquido" = 0,4 . (1,367 . 10^-3) = 547,2 W
$

Portanto, a taxa de troca líquida de radiação entre o corpo e as paredes da câmara é de aproximadamente 547,2 W.

== Questão 2: 

Uma placa horizontal e opaca, totalmente isolada em sua parte traseira, recebe um fluxo de radiação de 2500 W/m², dos quais 500 W/m² são refletidos. Calcule a refletividade, a absortividade, transmissividade e a emissividade da placa.

=== Refletividade: 

A refletividade é dada pela fórmula:

$
  rho = Q_"refletido" / Q_"incidente" -> rho = 500 / 2500 = 0,2
$

Portanto, a refletividade da placa é 0,2 ou 20%.

=== Transmissividade:

A transmissividade é dada pela fórmula: 

$
  tau = Q_"transmitido" / Q_"incidente" -> tau = 0 / 2500 = 0
$
Como não há radiação transmitida, a transmissividade é 0. 

=== Absortividade: 

A absortividade é dada pela fórmula:

$
  alpha = rho + tau = 1 -> alpha = 1 - rho = 1 - 0,2 = 0,8
$

Portanto, a absortividade da placa é 0,8 ou 80%.

=== Emissividade:

Agora, para a emissividade, como a superfície está em equilíbrio térmico, podemos relacionar a emissividade com a absortividade:

$
  epsilon = alpha = 0,8
$
Portanto, a emissividade da placa é 0,8 ou 80%.


== Questão 3: 

Um"chip de computador" quadrado, de lado igual a 5 mm, isotérmico, é montado em um substrato de modo que as suas superfícies laterais e traseira estejam perfeitamente isoladas, enquanto a superíficie frontal está exposta ao ar, à temperatura 15°C, e coeficiente de convecção de 200 W/m².K. Devido a critérios de confiabilidade, a temperatura da superfície do chip não pode exceder 85°C.

=== a) 

Calcule a taxa de transferência de calor liberada pelo chip, considerando apenas a convecção;

Primeiro, precisamos calcular a área da superfície frontal do chip. Como o chip é quadrado, a área é dada por:

$
  A = "lado"^2 = (0,005)^2 = 0,000025 -> 2,5 . 10^-5 m² 
$

Os demais parâmetros são:

- $T_"chip"$ = 85°C = 358 K

- $T_"ar"$ = 15°C = 288 K

- $h$ = 200 W/m².K

- $epsilon$ = 0,9 (emissividade do chip)

- $sigma$ = 5,67 x 10^-8 W/m².K^4

Agora, a trasferência de calor por convecção é dada pela fórmula:

$
  Q_"conv" = h . A . (T_"s" - T_infinity)
$

Substituindo os valores, temos: 

$
  Q_"conv" = 200 . (2,5 . 10^-5) . (358 - 288) -> 200 . 1,75 . 10^-3 = 0,35 W
$

Portanto, a taxa de transferência de calor liberada pelo chip, considerando apenas a convecção, é de 0,35 W.

=== b)

Calcule o acréscimo percentual na taxa de transferência de calor, levando-se em conta também a taxa de transferência de calor liberada pelo chip por radiação. Considere que todo o meio circundante esteja a 15°C. A superfície do chip tem emissividade 0,9.

Agora, precisamos calcular a taxa de transferência de calor por radiação. A fórmula para a transferência de calor por radiação é:

$
  Q_"rad" = epsilon . sigma . A . (T_"s"^4 - T_"ar"^4)
$

Substituindo os valores, temos:

$
  Q_"rad" = 0,9 . (5,67 . 10^-8) . (2,5 . 10^-5) . ((358)^4 - (288)^4)
$

$
  Q_"rad" = 0,9 . 5,67 . 10^-8 . 2,5 . 10^-5 . 9,552 . 10^9
$

$
  Q_"rad" = 0,0122W
$

Aplicando a fórmula do acréscimo percentual:
$
  %_"acrescimo" = (Q_"total" - Q_"conv") / Q_"conv" * 100 -> 0,0122 / 0,35 * 100 = 3,49%
$

Portanto, o acréscimo percentual na taxa de transferência de calor, levando-se em conta também a taxa de transferência de calor liberada pelo chip por radiação, é de aproximadamente 3,49%.

== Questão 4:

Uma placa horizontal de alumínio, oxidada, de 3m de comprimento por 2m de largura, mantém uma temperatura de 77°C em sua superfície e está exposta a uma corrente de ar com temperatura de 27°C e coeficiente de transferência de calor por convecção de 28,0 W/m².K. Calcule a taxa total de transferência de calor.

Para solucionar essa questão, podemos utilizar a fórmula da transferência de calor por convecção:

$
  Q_"conv" = h . A . (T_"s" - T_infinity)
$

Onde, substituindo temos:

$
  Q_"conv" = 28,0 . 6 . (77 - 27) -> 28,0 . 6 . 50 = 8400 W 
$

Portanto, a taxa total de transferência de calor é de 8400 W.

= Referências: 

- INCROPERA, Frank P. Fundamentos de transferência de calor e de massa. 8. ed. Rio de Janeiro: LTC, 2017 