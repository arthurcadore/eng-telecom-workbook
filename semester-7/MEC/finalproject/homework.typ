#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set highlight(
  fill: rgb("#c1c7c3"),
  stroke: rgb("#6b6a6a"),
  extent: 2pt,
  radius: 0.2em, 
  ) 

#show: doc => report(
  title: "Projeto Final",
  subtitle: "Mecânica dos Sólidos",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Agosto de 2024",
  doc,
)

= Introdução: 

Para este relatório, serão utilizadas as forças correspondentes a linha "A" da figura abaixo: 

#figure(
  figure(
    rect(image("./pictures/forces.png")),
    numbering: none,
    caption: [Forças a serem aplicadas no trabalho]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 1: 

Desenhe os diagramas de esforço cortante e momento fletor para a viga bi-apoiada. Considere que a viga tenha secção de 12cm x 30cm. Determine qual é a tensão máxima de flexão.

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Questão 1]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Incialmente, partimos que o somátório das forças em y é igual a 0, portanto: 

$
R_1 - 52k - 26k + R_2 = 0 
$

Desta forma, temos que: 

$ 
R_1 + R_2 = 78k
$

Em seguida, determinamos que o somatório dos momentos é 0, portanto:

$
R_2 * 12  = 52k * 4  + 26k * 8
$
Desta forma, temos que: 

$
R_2 = (52k * 4 + 26k * 8) / 12 = (416k)/12 = 34,666k
$

Como temos a relação de $R_1 + R_2 = 78k$, temos que:

$
R_1 + R_2 = 78k -> R_1 + 34,66666k = 78k -> R_1 = 43,333k
$

== Calculo de esforço cortante e Momento fletor: 

=== Seção 1 ($0 <= x <= 4$): 

Apliando a formula $-R_1 + V_(x) = 0$, temos que: 

$
-43,333k + V_(x) = 0
$

Portanto:
$
V_(x) = 43,333k
$

Em seguida, para calcular o momento fletor, temos que: 

$
M_(x) = V_(x) -> M_(x) = 43,333k_x
$

=== Seção 2 ($4 <= x <= 8$): 

Resolvendo o balanço de forças na seção:

$
-43,333k + 52k + V_(x) = 0 
$
Portanto: 
$
 V_(x) = -52k + 43,333k = -8,666k
$

Em seguida, para calcular o momento fletor, temos que:

$
52k (4 - 0) - 8,666k + M_(x) = 0
$

Portanto:

$
M_(x) = 208k - 8,666k_x
$

=== Seção 3 ($8 <= x <= 12$): 

Resolvendo o balanço de forças na seção:

$
-43,333k + 52k + 26k + V_(x) = 0
$

Portanto: 

$
V_(x) = -52k - 26k + 43,333k = -34,666k
$

Em seguida para calcular o momento fletor, temos que:

$
52k (4 - 0) + 26k (8 - 0) - 34,666k + M_(x) = 0
$ 

Portanto: 

$
M_(x) = 416k - 34,666k_x
$

=== Gráficos: 

A partir dos valores vistos acima, temos o seguinte gráfico de esforço cortante: 

#figure(
  figure(
    rect(image("./pictures/r1.1.png")),
    numbering: none,
    caption: [Diagrama de esforço cortante]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

E também, apresentado abaixo, o gráfico de momento fletor:

#figure(
  figure(
    rect(image("./pictures/r1.2.png")),
    numbering: none,
    caption: [Diagrama de momento fletor]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Tensão máxima de flexão:


Primeiramente, calculamos o centro de gravidade "y" na secção transversal da viga:  

$
y = h / 2 = 30 / 2 = 15"cm" -> y = 0,15m
$

Agora calculamos o momento de inércia: 

$
I = (b * h^3) / 12 = (0,12 * 0,3^3) / 12 = (0,12 * 0,027) / 12 = 0,00027 
$

Para calcular a tensão máxima de flexão, utilizamos a fórmula:

$
sigma = (M * y) / I
$

Aplicando aos valores obtidos na questão, temos que: 

$
sigma = (173,33k * 0,15) / (0,00027) = (25,999k) / (0,00027) = 96294444,44 N/m^2
$

= Questão 2: 

Desenhe os diagramas de esforço cortante e momento fletor para a viga bi-apoiada. A viga tem perfil retangular com medidas de 8cm x 25cm. Determine também qual é a tensão máxima de flexão.


#figure(
  figure(
    rect(image("./pictures/q2.png")),
    numbering: none,
    caption: [Questão 2]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Inicialmente, partimos que o somátório das forças em y é igual a 0, portanto:

$
R_1 - 52k + R_2 = 0 
$

Desta forma, temos que:

$
R_1 + R_2 = 52k
$

Em seguida, determinamos que o somatório dos momentos é 0, portanto:

$
R_2 * 6 = 52k * 4 -> R_2 = (52k * 4) / 6 = 34,666k
$

Como temos a relação de $R_1 + R_2 = 52k$, temos que:

$
R_1 + R_2 = 52k -> R_1 + 34,666k = 52k -> R_1 = 17,333k
$

== Calculo de esforço cortante e Momento fletor:

=== Seção 1 ($0 <= x <= 4$):

Apliando a formula $-R_1 + V_(x) = 0$, temos que:

$
-17,333k + V_(x) = 0
$

Portanto: 

$
V_(x) = 17,333k
$

Em seguida, para calcular o momento fletor, temos que:  

$
M_(x) = V_(x) -> M_(x) = 17,333k_x
$
=== Seção 2 ($4 <= x <= 6$):

Resolvendo o balanço de forças na seção:

$
-17,333k + 52k + V_(x) = 0
$

Portanto: 

$
V_(x) = -52k + 17,333k = -34,666k
$

Em seguida, para calcular o momento fletor, temos que:

$
52k (4 - 0) - 34,666k + M_(x) = 0
$

Portanto: 

$
M(x) = 208k - 34,666k_x
$

=== Gráficos: 

A partir dos valores vistos acima, temos o seguinte gráfico de esforço cortante:

#figure(
  figure(
    rect(image("./pictures/r2.1.png")),
    numbering: none,
    caption: [Diagrama de esforço cortante]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

E também, apresentado abaixo, o gráfico de momento fletor:

#figure(
  figure(
    rect(image("./pictures/r2.2.png")),
    numbering: none,
    caption: [Diagrama de momento fletor]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Tensão máxima de flexão:

Primeiramente, calculamos o centro de gravidade "y" na secção transversal da viga:

$
y = h / 2 = 25 / 2 = 12,5"cm" -> y = 0,125m
$

Agora calculamos o momento de inércia:

$
I = (b * h^3) / 12 = (0,08 * 0,25^3) / 12 = (0,08 * 0,015625) / 12 = 0,010416
$

Para calcular a tensão máxima de flexão, utilizamos a fórmula:

$
sigma = (M * y) / I
$

Aplicando aos valores obtidos na questão, temos que:

$
sigma = (69,333k * 0,125) / (0,010416) = (8,666k) / (0,010416) = 832049,251 N/m^2
$

= Questão 3:

Desenhe os diagramas de esforço cortante e momento fletor para a viga mostrada abaixo:

#figure(
  figure(
    rect(image("./pictures/q3.png")),
    numbering: none,
    caption: [Questão 3]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Calculo de esforço cortante e Momento fletor: 

Inicialmente, partimos que o somátório das forças em y é igual a 0, portanto:

$
R_1 - 52k - 26k + R_2 - 34k = 0 
$

Desta forma, temos que:

$
R_1 + R_2 = 52k + 26k + 34k = 112k
$

Em seguida, determinamos que o somatório dos momentos é 0, portanto:

$
R_2 * 14 = 52k * 6 + 26k * 14 + 34k * 22
$

Desta forma, temos que:

$
R_2 = (52k * 6 + 26k * 14 + 34k * 22) / 14 = (1424k )/ 14 = 101,714k
$

Como temos a relação de $R_1 + R_2 = 112k$, temos que:

$
R_1 + R_2 = 112k -> R_1 + 101,714k = 112k -> R_1 = 10,286k
$


=== Seção 1 ($0 <= x <= 6$):

Apliando a formula $-R_1 + V_(x) = 0$, temos que:

$
-10,286k + V_(x) = 0
$

Portanto:

$
V_(x) = 10,286k
$

Em seguida, para calcular o momento fletor, temos que:

$
M(x) = V_(x) -> M_(x) = 10,286k_x
$

=== Seção 2 ($6 <= x <= 14$):

Resolvendo o balanço de forças na seção:

$
- 10,286k + 52k + V_(x) = 0
$
Portanto: 
$
V_(x) = -52k + 10,286k = -41,714k
$

Em seguida, para calcular o momento fletor, temos que:

$
52k (6 - 0) - 41,714k + M_(x) = 0
$

Portanto:

$
M_(x) = 312k - 41,714k_x
$

=== Seção 3 ($14 <= x <= 22$):

Resolvendo o balanço de forças na seção:

$
+10,286k + 101,714k - 52k - 26k + V_(x) = 0
$

Portanto: 

$ 
V_(x) = -52k - 26k + 101,714k + 10,286k = 34k
$

Em seguida para calcular o momento fletor, temos que:

$
52k (6 - 0) + 26k (14 - 0) - 34k + M_(x) = 0
$

Portanto:

$
M_(x) = - 748k + 34k_x
$

=== Gráficos: 

A partir dos valores vistos acima, temos o seguinte gráfico de esforço cortante:


#figure(
  figure(
    rect(image("./pictures/r3.1.png")),
    numbering: none,
    caption: [ Diagrama de esforço cortante]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

E também, apresentado abaixo, o gráfico de momento fletor:

#figure(
  figure(
    rect(image("./pictures/r3.2.png")),
    numbering: none,
    caption: [ Diagrama de momento fletor]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Questão 4: 

Determine a Tensão de cisalhamento do eixo vazado abaixo quando submetido ao momento de torção T3. \

Nota: Foi solicitado considerar outro valor para o material do eixo: Aço com modulo de elasticidade de 77GPa. 

#figure(
  figure(
    rect(image("./pictures/q4.png")),
    numbering: none,
    caption: [Questão 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Para calcular a tensão de cisalhamento, inicialmente, precisamos calcular o momento polar de inércia, para isso temos que:

$
tau = pi / 2 (R_2^4 - R_1^4) 
$

Aplicando os valores da questão na formula, ficamos com a seguinte expressão: 

$
tau = pi / 2 (0,019^4 - 0,013^4) -> tau = pi / 2 (1,30321 * 10^(-7) - 0,28561 * 10^(-7)) 
$

Portanto, temos que: 

$
tau = pi / 2 [(1,30321 - 0,28561) * 10^(-7) ] = 1,59844 * 10^(-7)
$

Agora podemos calcular a Tensão de cisalhamento aplicando a seguinte formula: 

$
T = (epsilon * J ) / C
$

Portanto: 

$
8k = (epsilon * 1,59844 * 10^(-7)) / (0,019) -> 0,0152 = epsilon * 1,59844 * 10^(-7)
$

E assim calculamos a tensão de cisalhamento admissível: 
$
epsilon = (0,152) / (1,59844 * 10^(-7)) = 950927.153 N/m^2
$



= Questão 5:

Considere o eixo mostrado abaixo. A tensão de cisalhamento máxima admissível para o latão é de 55MPa. Dimensione os diâmetros mínimos dos eixos AB e BC.

#figure(
  figure(
    rect(image("./pictures/q5.png")),
    numbering: none,
    caption: [Questão 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Diâmetros dos eixos BC:

Primeiramente, calculamos o momento polar de inércia para o eixo BC, para isso temos que: 

$
J = pi / 2 ((d_"BC"/2)^4) -> J = pi / 2 (d_"BC"^4) / 16
$

Em seguida, podemos utilizar a formula de tensão de cisalhamento para realizar o calculo: 

$
T = (epsilon * J) / C -> T = (epsilon * J) / (d/2)
$

Agora, aplicamos a formula de calculo de inércia para o eixo BC:

$
12k = (55 * 10^6 * J) / (d_"BC"/2) -> 12k = (55 * 10^6 * (pi / 2 (d_"BC"^4) / 16)) / (d_"BC"/2)
$

Desta forma, temos que: 

$
12k = (55 * 10^6 * (pi / 2 (d_"BC"^4) / 16)) / (d_"BC"/2) -> 12k * d_"BC" = 2 * 55 * 10^6 * (pi / 2 (d_"BC"^4) / 16)
$

$
12k * d_"BC" = 2 * 55 * 10^6 * (pi / 2) * (d_"BC"^4) / 16 -> (12k ) / (2 * 55 * 10^6 * (pi / 32)) = d_"BC"^4 / d_"BC"
$

$
(12 * 10^3) / (110 * 10^6 * (pi / 32)) = d_"BC"^3 -> (12) / (110 * 10 ^ 3 * (pi / 32)) = d_"BC"^3 
$

$
d_"BC"^3 = 0.00111119087 -> d_"BC" = 0.00111119087^(1/3) = 0.103576m "ou" 103,576"mm"
$

== Diâmetros dos eixos AB:

Para calcular o diâmetro do eixo AB, da mesma forma, iniciamos calculando o momento polar de inercia para o eixo AB, para isso temos que:

$
J = pi / 2 ((d_"AB"/2)^4) -> J = pi / 2 (d_"AB"^4) / 16
$

Em seguida, podemos utilizar a formula de tensão de cisalhamento para realizar o calculo:

$
T = (epsilon * J) / C -> T = (epsilon * J) / (d/2)
$

Agora, aplicamos a formula de calculo de inércia para o eixo AB:

$
4k = (55 * 10^6 * J) / (d_"AB"/2) -> 4k = (55 * 10^6 * (pi / 2 (d_"AB"^4) / 16)) / (d_"AB"/2)
$

$
2 * 55* 10^6 * (pi / 32) * d_"AB"^4 = 4k * d_"AB" -> 110 * 10^6 * (pi / 32) * d_"AB"^4 = 4k * d_"AB"
$

$
 d_"AB"^4 / d_"AB"  = (4k) / (110 * 10^6 * (pi / 32)) ->   d_"AB"^4 / d_"AB"  = (4 * 10^3) / (110 * 10^6 * (pi / 32)) -> d_"AB"^3 = 4 / (110 * 10^3 * (pi / 32))
$

$
d_"AB"^3 = 0.00037039695 -> d_"AB" = 0.00037039695^(1/3) = 0.071816m "ou" 71,816"mm"
$
= Questão 6:

Observe as ilustrações da estrutura apresentada abaixo. 

- A Carga adicional sobre a laje localizada bem no centro tem valor 52 (kN). 
- Considere a densidade do concreto armado como sendo de 2.300kg/m³. 
- As paredes têm largura de 15cm e densidade de 1300kg/m³. 
- Desconsidere a porta e a janela para calcular a carga das paredes. 
- A espessura da laje de cobertura e da laje de piso é de 15cm. 
- Os 4 pilares têm medidas de secção de 40cm x 15cm. 
- As vigas de cobertura e baldrames têm secções de 15cm por 30cm. 
- As sapatas (ou blocos de fundação) têm medidas de 1m x 1m x 0,50m de altura. 
- Os pilares são armados com 6 barras de aço de diâmetro “d”. 

Considere:
 - E_aço= 200GPa
 - E_conc= 20GPa. 
 - A carga das lajes e do peso P são descarregadas igualmente em todo o perímetro das vigas.


Determine:

- Qual a pressão exercida pelas sapatas no solo (kN/m²). 
- Para as vigas, determine qual a Tensão máxima de flexão decorrente do peso próprio e da carga das paredes / lajes. 
- Determine o diâmetro dos pilares considerando que a carga da laje e da viga de cobertura é descarregada 75% no concreto e 25% no aço.


#figure(
  figure(
    rect(image("./pictures/q6.1.png")),
    numbering: none,
    caption: [Questão 6 - Perspectiva Isometrica]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/q6.2.png")),
    numbering: none,
    caption: [Questão 6 - Corte da Estrutura]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/q6.3.png")),
    numbering: none,
    caption: [Questão 6 - Planta Baixa]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Peso próprio da laje (sem vigas):

Inicialmente precisamos determinar o volume da laje, para isso temos que:

$
V_"laje" = B * H * L ->  V_"laje" =  4 * 0,15 * 4 = 2,4m^3
$

Em seguida, podemos calcular a massa da laje através do coeficiente de densidade do concreto armado: 

$
M = V_"laje" * D_"concreto" -> P = 2,4 * 2300 = 5520"kg" 
$

Utilizando o coeficiente graviacional como "g" = 9,807 m/s², temos que o peso é dado por: 

$
P_"laje" = 5520 * 9,807 = 54134,64N -> P = 54,13464"kN"
$

=== Peso próprio de todas as vigas:

Para calcular o peso das vigas, precisamos determinar o volume das vigas, para isso temos que:

$
V_"viga" = B * H * L -> V_"viga" = 0,15 * 0,3 * 4 = 0,18m^3
$

Em seguida, podemos calcular a massa das vigas através do coeficiente de densidade: 

$
M = V_"viga" * D_"concreto" -> P = 0,18 * 2300 = 414"kg"
$

Utilizando o coeficiente graviacional como "g" = 9,807 m/s², temos que o peso é dado por:

$
P_"viga" = 414 * 9,807 = 4057,98N -> P = 4,05798"kN" 
$

Agora, como são utilizadas no total 8 vigas para a construção da estrutura, temos seu peso final multiplicado por 8: 

$
P_"viga" = 4,05798 * 8 = 32,46384"kN"
$

=== Peso próprio dos pilares:

Para calcular o peso dos pilares, precisamos determinar o volume dos pilares, para isso temos que:

$
V_"pilar" = B * H * L -> V_"pilar" = 0,4 * 0,15 * 2,6 = 0,156m^3
$

Em seguida, podemos calcular a massa dos pilares através do coeficiente de densidade:

$
M = V_"pilar" * D_"concreto" -> P = 0,156 * 2300 = 358,8"kg"
$

Utilizando o coeficiente graviacional como "g" = 9,807 m/s², temos que o peso é dado por: 

$
P_"pilar" = 358,8 * 9,807 = 3520,476N -> P = 3,520476"kN"
$

Como são utilizados 4 pilares para a construção da estrutura, temos seu peso final multiplicado por 4:

$
P_"pilar" = 3,520476 * 4 = 14,081904"kN"
$

=== Peso próprio das paredes:

Para calcular o peso das paredes, precisamos determinar o volume das paredes, para isso temos que:

$
V_"paredes" = B * H * L -> V_"paredes" = 0,15 * 2,6 * 4 = 1,56m^3
$

Em seguida, podemos calcular a massa das paredes através do coeficiente de densidade:

$
M = V_"paredes" * D_"paredes" -> P = 1,56 * 1300 = 2028"kg"
$

Utilizando o coeficiente graviacional como "g" = 9,807 m/s², temos que o peso é dado por:

$
P_"paredes" = 2028 * 9,807 = 19899,816N -> P = 19,899816"kN"
$

Como são utilizadas 4 paredes para a construção da estrutura, temos seu peso final multiplicado por 4:

$
P_"paredes" = 19,899816 * 4 = 79,599264"kN"
$

=== Peso próprio das sapatas:

Para calcular o peso das sapatas, precisamos determinar o volume das sapatas, para isso temos que:

$
V_"sapatas" = B * H * L -> V_"sapatas" = 1 * 1 * 0,5 = 0,5m^3
$

Em seguida, podemos calcular a massa das sapatas através do coeficiente de densidade:

$
M = V_"sapatas" * D_"concreto" -> P = 0,5 * 2300 = 1150"kg"
$

Utilizando o coeficiente graviacional como "g" = 9,807 m/s², temos que o peso é dado por:

$
P_"sapatas" = 1150 * 9,807 = 11278,5N -> P = 11,2785"kN"
$

Como são utilizadas 4 sapatas para a construção da estrutura, temos seu peso final multiplicado por 4:

$
P_"sapatas" = 11,2785 * 4 = 45,114"kN"
$

=== Diâmetro das barras de aço do pilar:

=== Tensão exercida sobre o solo pelas sapatas:

=== Diâmetro das barras de aço do pilar:





== Tabela de resultados: 

#figure(
  figure(
    table(
     columns: (1fr, 1fr, 1fr),
    align: (left, center, center),
    table.header[Item][Estrutura][Resultado],
    [1], [peso próprio da laje (sem vigas)], [kN],
    [2], [peso próprio de todas as vigas], [kN],
    [3], [peso próprio dos pilares], [kN],
    [4], [peso próprio das paredes], [kN],
    [5], [peso próprio das sapatas], [kN],
    [6], [Tensão exercida sobre o solo pelas sapatas], [MPa],
    [7], [Diâmetro das barras de aço do pilar], [mm],
    ),
    numbering: none,
    caption: [Tabela de resultados obtidos]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Referências Bibliográficas: 

- Jesué Graciliano da Silva. Momento fletor. Youtube - JESUE REFRIGERACAO CLIMATIZACAO, 2018.

- Jesué Graciliano da Silva. Aula resumo sobre torção - versão preliminar. Youtube - Jesue Graciliano da Silva, 2023.

- Jesué Graciliano da Silva. Diametro das barras de aço. Youtube - JESUE REFRIGERACAO CLIMATIZACAO, 2018.