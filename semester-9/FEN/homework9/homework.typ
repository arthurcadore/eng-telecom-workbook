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
  title: "Exercicios 9: Trocadores de Calor",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "01 de Junho de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila os itens 2.1 e 2.2 (pp. 35 a 38) e responder as questões apresentadas abaixo.

= Questões:

== Questão 1: 

Qual a pressão total que atua em mergulhador que está a 20 m deprofundidade? Caso o mergulhador escale uma montanha com 2.000 m de altura, qual a nova pressão que atuará sobre ele? Considere a massa específica da água como sendo 1.000 kg/m3, a massa específica do ar como sendo 1,2 kg/m3, a aceleração gravitacional é 9,81 m/s2 e a pressão atmosférica é 101,3 kPa.

=== Pressão a 20 m de profundidade:

A pressão total que atua sobre o mergulhador a 20 m de profundidade pode ser calculada pela fórmula:

$
  P_"agua" = rho_"agua" . g . h 
$

onde:

- $ P_"agua"$: Pressão da água
- $ rho_"agua"$: Massa específica da água (1.000 kg/m³)
- $ g$: Aceleração gravitacional (9,81 m/s²)
- $ h$: Profundidade (20 m)

Desta forma, substituindo os valores:

$
  P_"agua" = 1000 . 9,81 . 20 = 196200 "Pa"
$

A pressão total a 20 m de profundidade é a soma da pressão atmosférica e da pressão da água:

$
  P_"total" = P_"atmosferica" + P_"agua"
$

onde:
- $ P_"atmosferica"$: Pressão atmosférica (101,3 kPa = 101300 Pa)
- $ P_"agua"$: Pressão da água (196200 Pa)

Substituindo os valores:
$
  P_"total" = 101300 + 196200 = 297500 "Pa"
$

Dessa forma, a pressão total que atua sobre o mergulhador a 20 m de profundidade é de 297.500 Pa ou 297,5 kPa.

=== Pressão a 2.000 m de altura:

A pressão atmosférica diminui com a altitude, e pode ser calculada pela fórmula:

$
  P_"altura" = P_"atmosferica" - rho_"ar" . g . h
$

onde:
- $ P_"altura"$: Pressão a uma determinada altura
- $ rho_"ar"$: Massa específica do ar (1,2 kg/m³)
- $ g$: Aceleração gravitacional (9,81 m/s²)
- $ h$: Altura (2.000 m)

Substituindo os valores:

$
  P_"altura" = 101300 - (1,2 . 9,81 . 2000) = 101300 - 23544 = 77856 "Pa"
$

Dessa forma, a nova pressão que atuará sobre o mergulhador ao escalar uma montanha com 2.000 m de altura é de 77.856 Pa ou 77,9 kPa.

== Questão 2: 

Considerando um elevador hidráulico, estime o peso e a massa possíveis de serem sustentados pelo peso de uma criança de 30kg se a relação de entre as áreas dos êmbolos é de 1 para 8.

Para resolver essa questão utilizamos a formula da pressão em um fluido combinada com a força transmitida pelo fluido:

$
  F_"m" = m_"c" . g -> F_"m" = 30 . 9,81 = 294,3 "N"
$

A pressão do fluido é: 

$
  P = F_"m" / A_"m"
$

Dessa forma, seguindo o principio de Pascal, a pressão é a mesma em ambos os êmbolos: 

$
  P = F_"m" / A_"m" = F_"M" / A_"M"
$

$
  F_"M" = P . A_"M" = F_"m" / A_"m" . A_"M" -> F_"M" = F_"m" . 8
$

$
  F_"M" = 294,3 . 8 = 2354,4 "N"
$

Convertendo a força em peso:

$
  m_"M" = F_"M" / g = (2354,4) / (9,81) = 239,2 "kg"
$

Dessa forma, o peso que pode ser sustentado pelo elevador hidráulico é de 2.354,4 N ou 239,2 kg.

== Questão 3: 

Se o pistão menor de um elevador hidráulico tem diâmetro de 3,72cm e o maior tem um diâmetro de 51,3cm, que peso colocado sobre o menor será capaz de sustentar 18,6 kN (carro) aplicados sobre o pistão maior? Qual a distância que o pistão menor percorrerá para levantar o carro de 1,65m? Qual o trabalho realizado pelo elevador?

=== Calculando o peso no pistão: 

Para resolver essa questão inicialmente calculamos as áreas dos pistões:

$
  A_"m" = (pi (0,0372)^2 )/ 4 = 0,001089 "m^2"
$

$
  A_"M" = (pi (0,513)^2 )/ 4 = 0,206 "m^2"
$


A pressão no pistão maior é dada por:

$
  F_"m" / A_"m" = F_"M" / A_"M" -> F_"m" = F_"M" . A_"m" / A_"M"
$

$
  F_"m" = (18600 . (0,001089)) / (0,206 )= 96,6 "N"
$

Convertendo a força em peso:

$
  m_"m" = F_"m" / g = (96,6) / (9,81) = 9,85 "kg"
$

Dessa forma, o peso colocado sobre o pistão menor que será capaz de sustentar 18,6 kN no pistão maior é de 9,85 kg.

=== Calculando a distância percorrida pelo pistão: 

A distância percorrida pelo pistão menor pode ser calculada pela relação entre os volumes deslocados pelos pistões:

$
  A_"m" . h_"m" = A_"M" . h_"M"
$

onde:
- $ A_"m"$: Área do pistão menor
- $ h_"m"$: Distância percorrida pelo pistão menor
- $ A_"M"$: Área do pistão maior
- $ h_"M"$: Distância percorrida pelo pistão maior (1,65 m)

Substituindo os valores:

$
  h_"m" = (1,65 . 0,206) / (0,001089 )= 315,2 "m"
$

Dessa forma, a distância que o pistão menor percorrerá para levantar o carro de 1,65 m é de 315,2 m.

=== Calculando o trabalho realizado pelo elevador:

O trabalho realizado pelo elevador pode ser calculado pela fórmula:

$
  W = F_"M" . h_"M"
$
onde:
- $ W$: Trabalho realizado
- $ F_"M"$: Força no pistão maior (18,6 kN = 18600 N)
- $ h_"M"$: Distância percorrida pelo pistão maior (1,65 m)

Substituindo os valores:

$
  W = 18600 . 1,65 = 30690 "J"
$

Dessa forma, o trabalho realizado pelo elevador é de 30.690 J ou 30,7 kJ.

== Questão 4: 

Calcule qual o volume total de um iceberg, cujo volume visível é de  200m3. Qual a massa do iceberg? Dados massa específica da água do mar: líquida: 1.030 kg/m3; sólida: 917 kg/m3.

=== Calculando o volume total do iceberg:

Para resolver essa questão, utilizamos o princípio de Arquimedes, que nos diz que o volume submerso de um corpo flutuante é igual ao volume do fluido deslocado: 

$

  V_"submerso" / V_"total" = rho_"gelo" / rho_"agua" -> V_"submerso" = V_"total" . (rho_"gelo" / rho_"agua")
$

Volume fora da água:

$
  V_"visivel" = V_"total" - V_"submerso"
$

Substituindo a relação do volume submerso:

$
  V_"visivel" = V_"total" - V_"total" . (rho_"gelo" / rho_"agua") -> V_"visivel" = V_"total" . (1 - (rho_"gelo" / rho_"agua")) 
$

Dessa forma, isolando o volume total:

$
  V_"visivel" = V_"total" . (1 - (rho_"gelo" / rho_"agua")) = V_"total" = V_"visivel" / (1 - (rho_"gelo" / rho_"agua"))
$

Substituindo os valores:

$
  V_"total" = 200 / (1 - (917 / 1030)) = 200 / (1 - 0,8903) = 200 / (0,1097) = 1825,2 m^3
$

Dessa forma, o volume total do iceberg é de 1.825,2 m³. 

=== Calculando a massa do iceberg:

$
  m_"iceberg" = V_"total" . rho_"gelo" = 1825,2 . 917 = 1673,6 "kg"
$

A massa do iceberg é de 1.673,6 kg.


== Questão 5:

Um bloco de madeira flutua na água com 64,6% do seu volume submerso. No óleo 91,8% do seu volume fica submerso. Considere a massa específica da água 1.000 kg/m3. Determine: a) massa específica da madeira e b) do  óleo.


$
  P_"corpo" = P_"agua" . V_"submerso" -> rho_"corpo" = P_"corpo" / g = P_"agua" . V_"submerso" / g
$

Calculando a massa específica da madeira:

$
  rho_"madeira" = (1000 . (0,646)) / (9,81) = 65,8 "kg/m^3"
$

Calculando a massa específica do óleo:

$
  rho_"oleo" = (1000 . (0,918)) / (9,81) = 93,6 "kg/m^3"
$

= Referências: 

- INCROPERA, Frank P. Fundamentos de transferência de calor e de massa. 8. ed. Rio de Janeiro: LTC, 2017 