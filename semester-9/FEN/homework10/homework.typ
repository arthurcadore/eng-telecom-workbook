#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Exercicios 10: Trocadores de Calor",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "09 de Junho de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila o item 2.3 (pp. 38 e 39) e responder as questões apresentadas abaixo.

= Questões:

== Questão 1: 

Em uma tubulação convergente, sabendo que a área na seção (1) é $30 "cm"^2$ e na seção (2) é $15 "cm"^2$ e que a velocidade do fluido triplica após a pasagem, determine qual será a massa específica na saída sabendo que o fluido de trabalho é o ar (compressível) e inicialmente ele está com uma massa específica igual a $1,2 "kg"/m^3$.

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Esquematico Questão 1],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Para resolver essa questão, utilizamos o princípio da conservação da massa, que nos diz que a massa que entra em um sistema deve ser igual à massa que sai: 

$
  m_1 = m_2 -> rho_1 A_1 v_1 = rho_2 A_2 v_2
$

Onde: 
- $m_1$ e $m_2$ são as massas na seção 1 e 2, respectivamente;
- $rho_1$ e $rho_2$ são as massas específicas na seção 1 e 2, respectivamente;
- $A_1$ e $A_2$ são as áreas na seção 1 e 2, respectivamente;
- $v_1$ e $v_2$ são as velocidades na seção 1 e 2, respectivamente.


Dessa forma, podemos reescrever a equação como:

$
  rho_2 = (rho_1 A_1 v_1)/(A_2 v_2)
$

Substituindo os valores conhecidos:

$
  rho_2 = ((1,2) . (3,0 . 10^(-3)))/ (3 . (1,5 . 10^(-3))) -> (3,6 . 10^(-3))/(4,5 . 10^(-3)) -> 0,8 "kg"/m^3
$


== Questão 2: 

Em um tanque misturador são adicionados $20 "litros/s"$ de água ($rho_"água"= 1.000 "kg"/m^3$) e $10 "litros/s"$ de um óleo ($rho_"óleo" = 900 "kg"/m^3$). O resultado da mistura escoa por um duto de saída com área igual a $30 "cm"^2$. Determine a massa específica e a velocidade da mistura no duto de saída. Considere os dois fluidos incompressíveis.

#figure(
  figure(
    rect(image("./pictures/q2.png")),
    numbering: none,
    caption: [Esquematico Questão 2],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Para resolver essa questão, precisamos calcular a massa total que entra no tanque e a massa total que sai do tanque.

Considerando que: 

- $Q_"água" = 20 "litros/s" = 20 . 10^(-3) "m^3/s"$;
- $Q_"óleo" = 10 "litros/s" = 10 . 10^(-3) "m^3/s"$;
- $rho_"água" = 1.000 "kg"/m^3$;
- $rho_"óleo" = 900 "kg"/m^3$;

A massa especifica considerando os dois fluidos é dada por:

$
  rho_"mistura" = (m_"água" + m_"óleo")/(Q_"água" + Q_"óleo") = (rho_"água" Q_"água" + rho_"óleo" Q_"óleo")/(Q_"água" + Q_"óleo")
$

Substituindo os valores conhecidos:

$
  rho_"mistura" = ((1.000 . 20 . 10^(-3)) + (900 . 10 . 10^(-3)))/(20 . 10^(-3) + 10 . 10^(-3)) = (20 + 9)/(30) = 29/30 "kg"/m^3 approx 966,67 "kg"/m^3
$

Agora, para calcular a velocidade da mistura no duto de saída, utilizamos a equação da continuidade. Primeiro calculamos a área de saída em metros quadrados:

$
  A = 30 "cm"^2 = 30 . 10^(-4) "m"^2 = 3 . 10^(-3) "m"^2
$

Agora calculamos a vazão volumétrica total:

$
  Q_"total" = Q_"água" + Q_"óleo" = 20 . 10^(-3) + 10 . 10^(-3) = 30 . 10^(-3) m^3/s
$

A velocidade da mistura no duto de saída é dada por:

$
  v = Q_"total"/A = (30 . 10^(-3))/(3 . 10^(-3)) = 10 "m"/s
$