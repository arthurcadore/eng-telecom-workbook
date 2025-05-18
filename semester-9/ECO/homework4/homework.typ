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
  title: "Lista de Exercicios - Aula 6",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "18 de Maio de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

Qual o montante final obtido em uma aplicação de R\$10.000, a uma taxa nominal anual de 6%, com capitalização mensal, durante 48 meses? 

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos:

$
  M = P . (1 + i)^n
$

Dessa forma, temos: 

$
  M = 10000 . (1 + ((0,06)/12))^48 -> M = 10000 . 1,268241 -> M = 12682,41
$

Assim, o montante final obtido em uma aplicação de R\$10.000, a uma taxa nominal anual de 6%, com capitalização mensal, durante 48 meses é de R\$12.682,41.

== Questão 2 

Para cobrir uma dívida de R\$5.000 hoje, preciso contrair um financiamento pessoal a uma  taxa de 11,2% a.m., para ser pago daqui a 6 meses.Qual será o valor a pagar no final do prazo? 

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos:

$
  M = P . (1 + i)^n
$

Dessa forma, temos:

$
  M = 5000 . (1 + 0,112)^6 -> M = 5000 . 1,877 -> M = 9385,00
$

Assim, o montante a ser pago no final do prazo de 6 meses é de R\$9.385,00.

== Questão 3

Para cobrir a mesma dívida do exercício anterior, um agiota me cobraria R\$7.500 daqui a 4 meses. Qual a taxa de juros cobrada pelo agiota? 

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos reorganizada para encontrar a taxa de juros:

$
  M = P . (1 + i)^n -> (1 + i) = (M / P)^(1/n) -> i = (M / P)^(1/n) - 1
$

Assim, temos: 

$
  i = (7500 / 5000)^(1/4) - 1 -> i = 1,5^(1/4) - 1 -> i = 0,1067
$

Portanto, a taxa de juros cobrada pelo agiota é de $approx 10,67%$ ao mês.

== Questão 4

Deseja-se realizar uma viagem que custará R\$30.000 daqui a 2 anos. Quanto se deveria
aplicar agora, em um investimento com taxa de juros de 1,5%a.m., para poder pagar pela
viagem? 

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos reorganizada para encontrar o valor presente:

$
  M = P . (1 + i)^n -> P = M / (1 + i)^n
$

Assim, temos:

$
  P = 30000 / (1 + 0,015)^(2 . 12) -> P = 30000 / (1,015)^24 -> P = 30000 / (1,432364654) -> P = 21078,28
$

Portanto, o valor que se deveria aplicar agora, em um investimento com taxa de juros de 1,5% ao mês, para poder pagar pela viagem de R\$30.000 daqui a 2 anos é de R\$21.078,28.

== Questão 5

No exercício anterior, se o valor da viagem é R\$30.000 hoje, e a taxa de inflação prevista para o período é de 6%a.a., quanto deveria ser o valor investido agora? 

Primeiro devemos atualizar o valor da viagem para o futuro, considerando a inflação. Para isso, utilizamos a fórmula do montante em juros compostos:

$
  M = P . (1 + i)^n -> M = 30000 . (1 + 0,06)^(2) -> M = 30000 . (1,1236)
$

Assim, o valor atualizado da viagem é de R\$33.709,08. Agora, devemos calcular o valor presente considerando a taxa de juros de 1,5% ao mês:

$
  P = (33709,08) / (1 + 0,015)^(2 . 12) -> P = (33709,08) / (1,015)^24 -> P = 23563,73
$

Portanto, o valor que se deveria aplicar agora, em um investimento com taxa de juros de 1,5% ao mês, para poder pagar pela viagem de R\$30.000 hoje, considerando a inflação prevista de 6% ao ano, é de R\$23.563,73.

== Questão 6 

Adquiriu-se um lote de ações de uma determinada companhia por R\$9.564, que foi vendido
75 dias depois por R\$11.439. Qual a taxa de juros mensal equivalente desta operação de
compra e venda?

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos reorganizada para encontrar a taxa de juros:

$
  M = P . (1 + i)^n -> (1 + i) = (M / P)^(1/n) -> i = (M / P)^(1/n) - 1
$

Assim, temos:

$
  i = (11439 / 9564)^(1/(2,5)) - 1 -> i = 1,1953^(0,4) - 1 -> i = 0,0747  
$

Portanto, a taxa de juros mensal equivalente desta operação de compra e venda é de $approx 7,47%$ ao mês.

== Questão 7

As ações da companhia Camil Alimentos S.A. (ticker: CAML3) estavam cotadas a R\$9,97 no
dia 31/05/2021. Uma pessoa adquiriu um lote de 1.000 ações neste dia, e precisou vendê-las no dia 31/10/2021, quando a ação estava cotada a R\$9,68. Sabendo que a corretora cobra, por operação de compra ou venda, uma taxa de corretagem fixa de R\$5,00 mais 0,02% do valor movimentado, qual foi a taxa de retorno da operação? 

Para resolver essa questão, primeiro devemos calcular o valor de compra e venda das ações, incluindo as taxas de corretagem.

=== Calculo do valor de compra:

$
  V_"Bruto_compra" = 1000 . 9,97 = 9970
$

$
  V_"Taxa_compra" = 5 + ((0,02)/100) . 9970 = 5 + 1,994 = 6,994
$

$
  V_"Total_compra" = 9970 + 6,994 = 9976,994
$

=== Calculo do valor liquido de venda:

$
  V_"Bruto_venda" = 1000 . 9,68 = 9680
$

$
  V_"Taxa_venda" = 5 + ((0,02)/100) . 9680 = 5 + 1,936 = 6,936
$

$
  V_"Total_venda" = 9680 - 6,936 = 9673,064
$

=== Calculo do retorno:

$
  V_"Retorno" = "Valor_venda" - "Valor_compra" = 9673,064 - 9976,994 = -303,93
$

$
  "Taxa_Retorno" = ((-303,93) / (9976,994)) . 100 = -3,04%
$

Assim, a taxa de retorno da operação foi de $approx -3,04%$.

== Questão 8

Qual a opção mais vantajosa para se aplicar uma certa quantidade de recursos. 

Para realizar essa comparação, devemos calcular o montante final de cada opção, considerando um mesmo valor de investimento inicial e um período de 1 ano.

=== Item A) 

Taxa de 40% a.a. com capitalização mensal

$
  i_"m" = (1 + 0,4)^(1/12) - 1 -> i_"m" = 0,0283 -> i_"m" = 2,83% (a.m.)
$

Convertendo a taxa anual para mensal, temos:

$
  i_"e" = (1 + 0,0283)^(12) - 1 -> i_"e" = 0,4 -> i_"e" = 40,1% (a.a.)
$


=== Item B)

Taxa de juros de 1% a.m. com correção monetária de 3% a.t. Primeiro, devemos calcular a taxa efetiva anual considerando a correção monetária:

$
  (1 + i_"t") = 1,03 -> (1 + i_"m")^3 = 1,03 -> i_"m" = (1,03)^(1/3) - 1 -> i_"m" = 0,98% (a.m.)
$

Agora, convertendo para anual, temos: 

$
  i_"e" = (1 + 0,0098)^(12) - 1 -> i_"e" = 0,123 -> i_"e" = 12,3% (a.a.)
$



Dessa forma, a opção mais vantajosa é a opção A, com uma taxa efetiva anual de 40,1% em comparação com a opção B, que tem uma taxa efetiva anual de 12,3%.

== Questão 9

Uma dívida de R\$2.000,00 será paga 3 meses antes do seu vencimento, em 20 de dezembro.
Sabendo que a taxa de juro para essa dívida é de 5% a.m., em regime de juro composto, qual deverá ser o valor do desconto?

Para resolver essa questão, utilizamos a fórmula do montante em juros compostos reorganizada para encontrar o valor do desconto:

$
  V_P = V_F/(1 + i)^n -> V_P = 2000/(1 + 0,05)^3 -> V_P = 2000/(1,157625) -> V_P = 1727,00
$

Calculando o valor do desconto:

$
  V_D = V_F - V_P -> V_D = 2000 - 1727,00 -> V_D = 273,00
$

Assim, o valor do desconto a ser aplicado na dívida de R\$2.000,00 será de R\$273,00.

== Questão 10

Um investimento promete pagar juros de 9,0% a.a.. Se fôr feito um investimento de R\$5.000, e este investimento fôr resgatado 7 meses após, qual será o valor total resgatado? Qual será o valor dos juros? 

Inicialmente, devemos calcular a taxa efetiva mensal considerando a taxa anual de 9,0%:

$
  i_"m" = (1 + 0,09)^(1/12) - 1 -> i_"m" = 0,0072 -> i_"m" = 0,72% (a.m.)
$

Agora, devemos calcular o montante final considerando o investimento de R\$5.000,00 e o período de 7 meses:

$
  M = P . (1 + i)^n -> M = 5000 . (1 + 0,0072)^(7) -> M = 5000 . (1,0514)
$

Assim, o montante final resgatado será de R\$5.257,00. Agora, devemos calcular o valor dos juros:

$
  J = M - P -> J = 5257,00 - 5000,00 -> J = 257,00
$

Portanto, o valor total resgatado será de R\$5.257,00 e o valor dos juros será de R\$257,00.