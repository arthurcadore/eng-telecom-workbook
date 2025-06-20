#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show table.cell.where(y: 0): strong
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: (x, y) => (
    if x > 0 { center }
    else { left }
  )
)

#show: doc => report(
  title: "Exercicios 12: Equação de Bernoulli - 
  Tubo de Venturi e Tubo de Pitot",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Junho de 2025",
  doc,
)

= Introdução

O objetivo deste documento é estudar na apostila o item 2.4.2 e 2.4.3 (pp. 42 e 43) e responder a questão apresentada abaixo.

= Questões

== Questão 1

No Venturi da figura água escoa como fluido ideal. A área na seção (1) foi usado um tubo com diâmetro de $20 "mm"$, enquanto que na seção (2) o diâmetro é $5 "mm"$. Um manômetro cujo fluido manométrico é mercúrio ($rho H_g= 13600 "kg"/m^3$) é ligado entre as seções (1) e (2) e indica um desnível $h$ de $5 "cm"$. Pede-se a vazão volumétrica e velocidade do escoamento na seção (1). ($rho H_"2O"= 1.000 "kg"/m^2$).

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Esquematico Questão 1],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Resolução

Para resolver a questão, utilizamos a equação de Bernoulli entre os pontos 1 e 2 do tubo de Venturi:

$
  P_1 + 1/2 rho_1 v_1^2 = P_2 + 1/2 rho_2 v_2^2 -> P_1 - P_2 = 1/2 rho (v_2^2 - v_1^2) 
$

E também a equação de continuidade:

$
  Q = A_1 v_1 = A_2 v_2 ->  v_2 = A_1/A_2 v_1 -> v_2 = ((pi D_1^2/4)) /((pi D_2^2/4)) v_1 
$

Assim, calculando a diferença de pressão entre os pontos 1 e 2, temos:

$
  P_1 - P_2 = (rho_(H_g) - rho_(H_"2O") ) . g . h
$

Substituindo os valores:

$
  P_1 - P_2 = (13600 - 1000) . (9,81) . (0,05) = 617,13 "Pa"
$

Agora, substituindo na equação de Bernoulli:

$
  P_1 - P_2 = 1/2 rho (v_2^2 - v_1^2) ->  617,13 = 1/2 (1000) . ((A_1/A_2 v_1)^2 - v_1^2  )
$

Resolvendo a equação, temos:

$
  617,13 = 1000/2 . ((16v_1^2) - v_1^2) = 500 (256v_1^2 - v_1^2) = 500 (255v_1^2) = 127500 v_1^2
$

$
  v_1^2 = (617,13) / 127500 = 0,00484 -> v_1 = sqrt("0,00484") = 0,0696 "m/s"
$

Agora, para calcular a vazão volumétrica, utilizamos a equação de continuidade:

$
  Q = A_1 v_1 = (pi D_1^2/4) v_1 -> Q = (pi (0,02)^2)/4 . (0,0696) = 2,18 .10^(-5) m^3/s
$

Assim, a vazão volumétrica é $2,18 . 10^(-5) m^3/s$ ou $21,8 "cm"^3/s$ e a velocidade do escoamento na seção é $0,0696 "m/s"$.