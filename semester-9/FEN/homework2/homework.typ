#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Conceitos Gerais Sobre Energia 
e Transferência de Calor: Exercicios 2",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "26 de Março de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o item 1.2 até 1.2.2 (pp. 10 a 16) e em seguida assistir o vídeo explicativo, com base nisto, resolva os exercícios apresentados abaixo. 

= Questões:

== Questão 1: 

Uma taxa de transferência de calor de 3 kW atravessa uma seção de um material de isolamento, com uma área transversal de 10 m² e espessura de 2,5 cm. Se a superfície mais quente está a uma temperatura de 415°C e a condutividade térmica do material isolante é de 0,2 W/(m.K), qual é a temperatura da superfície mais fria?

Para determinar a temperatura da superfície mais fria, utilizamos a equação da taxa de transferência de calor por condução:

$
  Q = -k A (d_T/L)
$

Considerando que: 

- $Q = 3 "kW" = 3000 W$

- $A = 10 m²$

- $L = 2,5 "cm" = 0,025 m$

- $k = 0,2 W/(m.K)$

- $T_q = 415°C$

- $T_f = ?$

Alterando a equação para encontrar a temperatura da superfície mais fria, temos:

$
  Q = -k A (d_T/L) ->  L Q = -k A (Delta T) -> (L Q) / (-k A) = Delta T
$

Substituindo os valores, temos:

$
  Delta T = (0,025 . 3000) / (-0,2 . 10) -> Delta T = 75 / 2 -> Delta T = 37,5°C
$

Tendo o valor de Delta T, podemos encontrar a temperatura da superfície mais fria:

$
  Delta T = T_q - T_f -> 37,5 = 415 - T_f -> T_f = 415 - 37,5 -> T_f = 377,5°C
$

Desta forma, a temperatura da superfície mais fria é de $377,5°C$.


== Questão 2:

As temperaturas interna e externa em um vidro de janela, de 5 mm de espessura, são 24°C e 38°C respectivamente. Qual a taxa de transferência de calor através de uma janela com 1 m de altura por 3 m de largura? A condutividade térmica do vidro é de 1,4 W/m.K


Para determinar a taxa de transferência de calor através da janela, utilizamos a equação da taxa de transferência de calor por condução:

$
  Q = -k A (d_T/L)
$

Considerando que:

- $k = 1,4 W/m.K$

- $L = 5 "mm" = 0,005 m$

- $T_i = 24°C$

- $T_e = 38°C$

- $A = (1 m) . (3 m) = 3 m²$

- $Delta T = T_e - T_i = 38 - 24 = 14°C$

- $Q = ?$

Com os valores, podemos substituir na equação para encontrar a taxa de transferência de calor:

$
  Q = -k A ((Delta T)/L) -> Q = (1,4) . 3 . (14 / (0,005)) -> Q = (58,8)/(0,005) -> Q = 11760 W
$

Desta forma, a taxa de transferência de calor através da janela é de $11,760 "kW"$.



== Questão 3:

Uma câmara frigorífica possui 8m de comprimento por 4m de largura e 3m de altura. O fundo da câmara é apoiado sobre o solo e pode ser assumido como perfeitamente isolado.

Qual é a espessura mínima de espuma de uretano (k = 0,026 W/m.K) que deve ser aplicada às superfícies do topo e dos lados do compartimento para garantir um ganho de calor menor que 500 W, quando as temperaturas interna e externa são respectivamente -10°C e 35°C?

Para determinar a espessura mínima de espuma de uretano, utilizamos a equação da taxa de transferência de calor por condução:

$
  Q = -k A (d_T/L)
$

Considerando que:

- $T_i = -10°C$

- $T_e = 35°C$

- $Delta T = T_e - T_i = 35 - (-10) = 45°C$

- $Q = 500 W $ (considerando pior caso)

- $k = 0,026 W/(m.K)$

Inicialmente, devemos calcular a área total da câmara frigorífica, que é a soma das áreas do topo e dos lados:

- Área do topo: $8 m . 4 m = 32 m²$

- Área dos lados: $2 . (8 m . 3 m) + 2 . (4 m . 3 m) = 48 m² + 24 m² = 72 m²$

- Área total: $32 m² + 72 m² = 104 m²$

Com a área total, podemos isolar a incognita de espessura mínima de espuma de uretano:

$
  Q = -k A (d_T/L) -> L Q = -k A (Delta T) -> L = (-k A Delta T) / Q
$

Aplicando os valores, temos: 

$
  L = (-0,026 . 104 . 45) / 500 -> L = (-121,68) / 500 -> L = 0,24336 m -> L = 24,336 "cm"
$

Desta forma, a espessura mínima de espuma de uretano que deve ser aplicada às superfícies do compartimento é de no minimo $24,336 "cm"$.

= Referencias: 

- Fundamentos de Fenômenos de Transporte de Celso P. Livi, capítulo 8, pp 165-168