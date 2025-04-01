#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Conceitos Gerais Sobre Energia 
e Transferência de Calor: Exercicios 3",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "01 de Abril de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o item 1.2.2 (pp. 13 a 18) e em seguida responder as questões apresentadas abaixo.

= Questões: 

== Questão 1: 

Um vidro duplo de janela é constituído por duas placas de vidro de 7 mm de espessura, com um espaço selado cheio de ar entre elas, também com espessura de 7 mm. Considere que o ar entre os vidros permane parado. Considere que a janela tem 0,8 m de comprimento e 0,5 m de largura.

=== Item A: 

Monte o circuito elétrico equivalente e calcule a resistência térmica total da janela. A condutividade térmica do ar estagnado (parado) é de 0,02624 W/m.K e a do vidro é de 0,8 W/m.K.

A representação da janela pode ser feita com um cicuito elétrico equivalente, onde temos: 

1ª Camada: Vidro (Placa 1)
2ª Camada: Ar (entre as placas)
3ª Camada: Vidro (Placa 2)

Cada camada tem uma resistência térmica, que pode ser calculada pela equação:

$ R = L / (k A) $

Dessa forma, a resistência térmica total é dada pela soma das resistências térmicas de cada camada:

$ R_"total" = R_"vidro1" + R_"ar" + R_"vidro2" $

Substituindo os valores, temos: 

$
  R_"vidro" = (0,007) / (0,8 . (0,8 . 0,5))
$

$
  R_"vidro" = (0,007) / (0,32) = 0,021875
$

$
  R_"ar" = (0,007) / (0,02624 . (0,8 . 0,5))
$
$
  R_"ar" = (0,007) / (0,01056) = 0,6625
$

Dessa forma, podemos obter a resistência térmica total:

$ R_"total" = 0,021875 + 0,6625 + 0,021875 = 0.7106707 K/W $

Tal que o circuito elétrico equivalente é dado por:


#align(center)[
  [R'vidro1'] -- [R'ar'] -- [R'vidro2']
]

=== Item B: 

Qual a perda de calor através da janela para um ΔT de 20°C?

Para calcular a perda de calor, podemos aplicar a seguinte equação: 

$
  Q = (Delta T) / (R_"total")
$

Substituindo os valores, temos: 

$
  Q = (20) / (0,7106707) = 28.1424281 W
$

== Questão 2: 

Qual a espessura necessária para uma parede de argamassa, que tem uma condutividade térmica de 0,75 W/m.K, se a taxa de transferência de calor deve ser 75% da taxa de transferência através de uma parede de material estrutural composto que tem uma condutividade térmica de 0,25 W/m.K e uma espessura de 100 mm? Considere que ambas as paredes estão sujeitas à mesma diferença de temperatura.

Para resolver a questão, utilizamos a equação da taxa de transferência de calor por condução, que é dada por:

$ Q = -k A (d_T/L) $


Como a questão deseja determinar o comprimento $L$ do material, tendo com base duas taxas de transferência de calor, podemos igualar as duas equações:

$ Q_2 = 0,75 Q_1 $

$ K_2 A (Delta T)/L_2 = K_1 A (Delta T)/L_1 $

$ K_2/L_2 = 0,75 K_1/L_1 $

Desta forma, substituindo os valores, temos:

$ (0,75 )/L_2 = 0,75 ((0,25) / (0,1)) $

$ (0,75)/ L_2 = 0,75 . 2,5 $

$ L_2 = (0,75)/ (1,875) $

$ L_2 = 0,4 m -> 400 "mm" $



== Questão 3:

Uma parede de 2 cm de espessura deve ser construída com um material que tem uma condutividade térmica média de 1,3 W/m.°C. A parede deve ser isolada com um material cuja condutividade térmica média é 0,35 W/m.°C, de tal forma que a perda de calor por metro quadrado de área não seja superior a 1830 W. Considerando que as temperaturas das superfícies interna e externa da parede composta são 1300 e 30 °C, calcule a espessura do isolamento.

Para calcular a espessura do isolamento, devemos inicialmente determinar a taxa de transferência de calor através da parede composta: 

$ Q = (Delta T) / R_"total" $

Dessa forma; 

$ R_"total" = R_"parede" + R_"isolamento" $

Dessa forma, cada resistência térmica é dada por:

$ R = L / (k A) $

Onde: 

- $L$ é a espessura do material (m)
- $k$ é a condutividade térmica do material (W/m.°C)
- $A$ é a área de transferência de calor (m²)

Assim, substituindo na equação temos: 

$ R_"total" = (0,02) / (1,3 A) + L_2 / (0,35 A) $

Calculando o $Delta T$, temos: 

$ Delta T = 1300 - 30 = 1270 °C $

Substituindo na equação original, temos:

$ (0,02)/(1,3) + L_2 / (0,35) = 1270/1830 $

$ (0,01538) + L_2 / (0,35) = 0,69399 $

$ L_2 /(0,35) = 0,69399 - 0,01538 $

$ L_2 = 0,67861 . 0,35 $

$ L_2 approx 0,2375 -> 23,75 "cm" $

== Questão 4: 

Calcule a taxa de transferência de calor através da parede composta esquematizada abaixo. A temperatura na face esquerda é de 370 °C, e na face direita de 66 °C. Considere fluxo de calor unidimensional. As cotas de espessura estão em centímetros.


#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Onde: 

- $K_a = 175 W/(m.C°)$

- $K_b = 30 W/(m.C°)$

- $K_c = 40 W/(m.C°)$

- $K_d = 80 W/(m.C°)$

- $K_e = 100 W/(m.C°)$

- $A_a = 1 m^2$

- $A_b = A_c $

- $A_e = 3 A_d$

== Questão 5:

Uma tubulação de cobre, de 3 cm de diâmetro externo e 1,5 de diâmetro interno, conduz refrigerante R-22 a uma temperatura de -5°C. A temperatura do ambiente em que se encontra a tubulação é de 28°C e pode ser considerada igual a temperatura da parede externa.

=== Item A: 

Quanto calor é absorvido pelo refrigerante em 5 metros de tubo?

Para calcular a quantidade de calor absorvido pelo refrigerante, utilizamos a equação de condução de calor para uma tubulação cilíndrica:

$ Q = (2 pi k L (Delta T)) /  ln(R_e/R_i) $

Onde: 

- $k $ é a condutividade térmica do material (W/m.°C). Considerando que o tubo é de cobre, temos $k = 385 W/(m.°C)$

- $L$ é o comprimento do tubo (m) = 5 m
- $Delta T$ é a diferença de temperatura entre o refrigerante e o ambiente (°C) = $28 - (-5) = 33 °C$
- $R_e $ é o raio externo do tubo (m) = $0,03 m$
- $R_i $ é o raio interno do tubo (m) = $0,015 m$

Substituindo os valores, temos:

$ Q = (2 . pi . 385 . 5 . 33) / ln((0,03)/(0,015)) $

$
  Q = (127050 . pi ) / ln(2)
$

$ 
  Q = 575836.356019145W -> 575,836 "kW"
$

=== Item B:

Utilizando um isolamento de lã de vidro, de 1 cm de espessura, de quanto será o valor do calor absorvido?

Seguindo a mesma forma de resolução utilizada na questão 3, primeiro precisamos decompor as resistências térmicas:

$ R_"total" = R_"isolamento" + R_"tubo" $

Onde cada resistência térmica é dada pela modificação da equação anterior:

$ R = ln(R_e / R_i) / (2 pi k L) $

Dessa forma, calculamos a resistência separadamente para o isolamento e para o tubo:

$ 
  R_"isolamento" = ln((0,01)/R_e) / (2 pi 0,035 * 5) 
$

$
  R_"isolamento" = ln((0,01)/R_e) / (0,35 pi) -> 0,2409790729
$

Agora aplicando a mesma equação para o tubo, temos:

$
  R_"tubo" = ln(R_e/R_i) / (2 pi 385 5)
$

$
  R_"tubo" = ln(2) / (3850 pi )
$

$
  R_"tubo" = (0,693147181) / (3850 pi ) -> 0,000057308
$

Dessa forma, podemos calcular a resistência total, e substituindo na equação original, temos:

$
  Q = (Delta T) / (R_"tubo" + R_"isolamento") -> (Delta T) / (0,000057308 + 0,2409790729)
$

$
  Q = 33 / (0,241036381) -> 136,90879306 W 
$

= Referências:

-  Fundamentos de Fenômenos de Transporte de Celso P. Livi (disponível no Minha Biblioteca) o capítulo 8, pp 168-183