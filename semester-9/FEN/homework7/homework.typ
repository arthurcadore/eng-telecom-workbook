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
e Transferência de Calor: Exercicios 7",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "05 de Maio de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o item 1.4 (1.4.4-1.4.6) (pp. 27 a 30) e em seguida responder as questões apresentadas abaixo.

= Questões:

== Questão 1: 

Um tubo horizontal de 125 mm de diâmetro passa através de uma sala onde as paredes se encontram a uma temperatura de 37°C, e o ar tem uma temperatura de 25°C. A temperatura da superfície externa do tubo, que é de ferro fundido, é medida e está a 125°C. Considere o coeficiente de convecção ao redor do tubo igual a 20 W/(m².K).

=== a): 

Calcule a perda de calor por metro de comprimento do tubo, por convecção e radiação. (considere convecção natural);


Para resolver essa questão, precisamos primeiramente calcular a área do tubo. A área de um cilindro é dada pela fórmula:

$
  A = pi . D . L -> pi . 0,125 . 1 = 0,3927 m²
$

Em seguida, podemos calcular a perda de calor por convecção e radiação. A perda de calor por convecção é dada pela fórmula:

$
  Q_"conv" = h . A . (T_s - T_infinity)
$

Subistituindo os valores, temos: 

$
  Q_"conv" = 20 . 0,393 . (398,15 - 298,15) = 20 . 0,393 . 100 = 786,3 W
$

Agora, calculando a perda de calor por radiação, utilizamos a fórmula:

$
  Q_"rad" = epsilon . sigma . A . (T_s^4 - T_infinity^4)  
$

Subistituindo os valores, temos:

$
  Q_"rad" = 0,94 . 5,67 . 10^(-8) . (0,3927) . 1,590 . 10^10
$

$
  Q_"rad" = 0,94 . 0,3927 . (5,67 . 10^(-8) . 1,590 . 10^10) = 0,94 . 0,3927 . 9,01 = 332,5 W
$

Somando os dois resultados, temos:

$
  Q = Q_"conv" + Q_"rad" = 786,3 + 332,5 = 1118,8 W
$

Portanto, a perda de calor por metro de comprimento do tubo, por convecção e radiação, é de 1118,8 W.

=== b): 

De quanto seria a redução percentual da perda de calor por radiação, ao se revestir este tubo com uma película de alumínio?

Para calcular a redução percentual da perda de calor por radiação ao revestir o tubo com uma película de alumínio, precisamos primeiro calcular a nova perda de calor por radiação com o novo valor de emissividade.

$
  Q_"rad" = epsilon . sigma . A . (T_s^4 - T_infinity^4)  
$

Subistituindo, temos: 

$
  Q_"rad" = 0,04 . 5,67 . 10^(-8) . (0,3927) . 1,590 . 10^10 
$

$
  Q_"rad" = 0,04 . 0,3927 . (5,67 . 10^(-8) . 1,590 . 10^10) = 0,04 . 0,3927 . 9,01 = 14,1 W
$

Agora, para calcular a redução percentual, utilizamos a seguinte fórmula:

$
  %_"reducao" = Q_"rad-ferro" - Q_"rad-aluminio" / Q_"rad-ferro" . 100 -> ((332,5) - (14,1)) / (332,5) . 100 -> 95,7%
$

Portanto, a redução percentual da perda de calor por radiação ao revestir o tubo com uma película de alumínio é de 95,7%.


== Questão 2: 

Uma pessoa se encontra em uma sala climatizada, mantida a 24°C. Sabendo-se que um ser humano tem no total aproximadamente 3,0 m² de área de pele, que a temperatura superficial da pele é de 32°C em média, e que essa pessoa tem 15% do corpo descoberto (isto é, não coberto por roupas), calcule a quantidade de calor que essa pessoa emite para o ambiente, por radiação.

Para resolver a questão, precisamos primeiramente calcular a área exposta da pele. A área exposta é dada por:

$
  A_"exposta" = A_"total" . f = 3,0 m² . 0,15 = 0,45 m²
$

Em seguida, podemos calcular a perda de calor por radiação utilizando a fórmula:

$
  Q_"rad" = epsilon . sigma . A . (T_s^4 - T_infinity^4)
$

Substituindo os valores, temos:

$
  Q_"rad" = 0,97 . 5,67 . 10^(-8) . (0,45) . (0,953 . 10^9)
$

$
  Q_"rad" = 0,97 . 0,45 . (5,67 . 10^(-8) . 0,953 . 10^9) = 0,97 . 0,45 . 54,1 = 23,7 W
$

Portanto, a quantidade de calor que essa pessoa emite para o ambiente por radiação é de 23,7 W.


== Questão 3: 

Numa usina nuclear, o tubo contendo o combustível nuclear, de 15 mm de diâmetro, passa pelo interior de outro tubo, de 40 mm de diâmetro. Entre os dois tubos escoa a água de refrigeração. Supondo a água transparente à radiação (isto é, a água não absorve nem emite calor por radiação), calcule a transferência de calor por radiação, por metro linear de tubo (problema dos cilindros concêntricos). Ambos os tubos são de aço inoxidável comum limpo, porém o tubo interno é revestido com uma camada de tinta negra. A temperatura da superfície externa do tubo que contém o combustível nuclear é de 250°C, e o fluxo de água é tal que mantém a temperatura da superfície interna do tubo externo a 80 °C.

Para resolver essa questão, precisamos primeiramente calcular a área dos tubos. A área de um cilindro é dada pela fórmula:

$
  A = pi . D . L -> pi . 0,015 . 1 = 0,0471 m²
$

Em seguida, podemos calcular a perda de calor por radiação. A perda de calor por radiação entre dois cilindros concêntricos é dada pela fórmula:

$
  Q_"rad" = (sigma . A_1 . (T_1^4 - T_2^4)) / (1/epsilon_1 + A_1 / A_2 . (1/epsilon_2 - 1)) 
$

Calculando as áreas dos cilindros, temos:

$
  A_2 = pi . D_2 . L -> pi . 0,04 . 1 = 0,1257 m²
$

$
  A_1/A_2 = 0,0471 / 0,1257 = 0,374
$

Agora, calculando os termos de resistência térmica, temos:

$
  R = 1/epsilon_1 + A_1 / A_2 . (1/epsilon_2 - 1) = 1/(0,95) + 0,374 . (1/(0,17)-1) -> 2,882
$

Calculando a perda de calor por radiação, temos:

$
  Q_"rad" = (5,67 . 10^(-8) . 0,0471 . 5,961.10^10 )/ (2,882) -> (159,1) / (2,882) = 55,3 W/m
$

Portanto, a transferência de calor por radiação entre os dois tubos é de 55,3 W/m.

= Referências: 

- INCROPERA, Frank P. Fundamentos de transferência de calor e de massa. 8. ed. Rio de Janeiro: LTC, 2017 