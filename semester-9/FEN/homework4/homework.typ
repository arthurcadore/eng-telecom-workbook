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
e Transferência de Calor: Exercicios 4",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "07 de Abril de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o item 1.3 (pp. 19 a 22) e em seguida responder as questões apresentadas abaixo.

= Questões:

== Questão 1:

Uma barra de 2,5cm de diâmetro e 15cm de comprimento é mantida a 260°C. A temperatura do ambiente é 16°C e o coeficiente de transferência de calor por convecção é 15 W/m².C. Calcule o calor perdido pela barra (taxa de transferência de calor).

Para resolver essa questão, utilizaremos a seguinte fórmula:

$
  Q = h . A . (T_s - T_infinity)
$

Onde: 

- Q = taxa de transferência de calor (W)
- h = coeficiente de transferência de calor por convecção (W/m².C)
- A = área superficial da barra (m²)
- T_s = temperatura da superfície da barra (°C)
- T_infinity = temperatura do ambiente (°C)

Inicialmente, precisamos calcular a área superficial da barra: 

$
  A = pi . D . L -> A = pi . (0,025) . (0,15) -> A = 0,01177 m²
$

Em seguida, substituímos os valores na fórmula:

$
  Q = 15 . 0,01177 . (260 - 16) -> Q = 15 . 0,01177 . 244 -> Q = 43.1148 W
$

Assim, a taxa de transferência de calor da barra é de aproximadamente 43,11 W.

== Questão 2:

Uma placa metálica colocada na horizontal, e perfeitamente isolada na parte de trás absorve um fluxo de radiação solar de 700 W/m². Se a temperatura ambiente é de 30°C, e não havendo circulação forçada do ar, calcule a temperatura da placa nas condições de equilíbrio (isto é, quando todo o calor que está sendo recebido é eliminado). Para obter o coeficiente de convecção, consulte a Tabela H da apostila.

Para resolver essa questão, utilizaremos a seguinte fórmula:

$
  q_"absorvido" = h . (T_s - T_infinity)
$

Onde: 

- $q_"absorvido"$ = fluxo de radiação solar (W/m²) -> 700 W/m²
- h = coeficiente de transferência de calor por convecção (W/m².C)
- T_s = temperatura da superfície da placa (°C)
- T_infinity = temperatura do ambiente (°C) -> 30°C

Consultando a Tabela H da apostila, encontramos que o coeficiente de convecção h é de 29 W/m².C (Correspondente á "placa metálica colocada na horizontal, sem circulação forçada").

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Questão 3:

Uma parede de concreto em um prédio comercial tem uma área superficial de 30 m² e uma espessura de 0,30 m. No inverno, o ar ambiente (interno) é mantido a 25°C enquanto o ar externo encontra-se a 0°C. Qual é a perda de calor através da parede? A condutividade do concreto é de 0,72 W/m.K