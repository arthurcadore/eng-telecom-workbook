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
  title: "Exercicios 13: Equação de Bernoulli - 
  Máquinas Hidráulicas",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "25 de Junho de 2025",
  doc,
)

= Introdução

O objetivo deste documento é estudar na apostila o item 2.4.4 e 2.4.3 (pp. 43  45) e responder a questão apresentada abaixo.

= Questões

== Questão 1

Na instalação da figura a máquina é uma bomba e o fluido é água. A bomba tem potência de $3600 W$ e sua eficiência é $80%$. A água é descarregada na atmosfera a uma velocidade de $5 m/s$ pelo tubo, cuja área da seção é $10 "cm"^2$. Considerando o reservatório de grandes dimensões e o fluído ideal, determine a altura do reservatório.

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Esquematico Questão 1],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Resolução

Para resolver a questão, utilizamos a equação de Bernoulli entre os pontos 1 (reservatório) e 2 (saída do tubo):

$
  P_1 + 1/2 rho v_1^2 + rho g h_1 = P_2 + 1/2 rho v_2^2 + rho g h_2
$

Como o reservatório é de grandes dimensões, $v_1 ≈ 0$ e $P_1 = P_2 = P_"atm"$ (pressão atmosférica). Assim:

$
  rho g h_1 = 1/2 rho v_2^2 + rho g h_2
$

$
  g h_1 = 1/2 v_2^2 + g h_2
$

$
  h_1 - h_2 = v_2^2 / (2g)
$

A altura do reservatório é $h = h_1 - h_2$, então:

$
  h = v_2^2 / (2g) = (5^2) / (2 . 9,81) = 25 / (19,62) = 1,27 "m"
$

Agora, precisamos considerar a potência da bomba. A potência útil da bomba é:

$
  P_"útil" = eta P_"total" = 0,8 . 3600 = 2880 "W"
$

A potência útil também pode ser expressa como:

$
  P_"útil" = rho g Q h_"bomba"
$

Onde $Q$ é a vazão volumétrica e $h_"bomba"$ é a altura fornecida pela bomba.

Calculando a vazão:

$
  Q = A_2 v_2 = 10 "cm"^2 . 5 "m/s" = 0,001 "m"^2 . 5 "m/s" = 0,005 "m"^3/s
$

Assim:

$
  h_"bomba" = P_"útil" / (rho g Q) = 2880 / (1000 . 9,81 . 0,005) = 2880 / (49,05) = 58,7 "m"
$

A altura total do reservatório é a soma da altura hidrostática e a altura fornecida pela bomba:

$
  h_"total" = h + h_"bomba" = 1,27 + 58,7 = 60,0 "m"
$

Portanto, a altura do reservatório é $60,0 "m"$.

== Questão 2

A usina hidrelétrica de Itaipu possui 20 turbinas de $700 "MW"$ totalizando $14 "GW"$ de potência. A vazão volumétrica nominal individual das turbinas é $645 m^3/s$. Sabendo que o projeto hidráulico é para uma altura de $118 m$, determine qual o diâmetro da tubulação de saída de cada uma das turbinas. Considere o fluido ideal e a eficiência da turbina igual a $100%$.

=== Resolução

Para resolver a questão, utilizamos a equação de potência de uma turbina hidráulica:

$
  P = eta rho g Q H
$

Onde:
- $P$ é a potência da turbina
- $eta$ é a eficiência (100% = 1)
- $rho$ é a densidade da água ($1000 "kg/m"^3$)
- $g$ é a aceleração da gravidade ($9,81 "m/s"^2$)
- $Q$ é a vazão volumétrica
- $H$ é a altura de queda

Substituindo os valores conhecidos:

$
  700 . 10^6 = 1 . 1000 . 9,81 . 645 . 118
$

$
  700 . 10^6 = 746,9 . 10^6
$

A diferença entre a potência calculada e a potência nominal indica que há perdas ou que a eficiência não é exatamente 100%. Vamos calcular a velocidade de saída da água na tubulação.

A potência cinética da água na saída é:

$
  P_"cinética" = 1/2 rho Q v^2
$

Onde $v$ é a velocidade de saída. Assumindo que toda a energia potencial se converte em energia cinética:

$
  rho g Q H = 1/2 rho Q v^2
$

$
  g H = 1/2 v^2
$

$
  v = sqrt(2 g H) = sqrt(2 . (9,81) . (118)) = sqrt((2315,16)) = 48,1 "m/s"
$

Agora, calculando o diâmetro da tubulação de saída:

$
  Q = A v = (pi D^2/4) v
$

$
  D^2 = (4Q) / (pi v) = (4 . 645) / (pi . 48,1) = 2580 / (151,1) = 17,1
$

$
  D = sqrt((17,1)) = 4,13 "m"
$

Portanto, o diâmetro da tubulação de saída de cada turbina é $4,13 "m"$.