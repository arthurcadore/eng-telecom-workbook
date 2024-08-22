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

Para calcular a tensão máxima de flexão, utilizamos a fórmula:

$
sigma = (M * y) / I
$

Primeiramente, calculamos a área: 
$

$

Aplicando aos valores obtidos na questão, temos que: 

$
sigma = (M * y) / 12
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

Para calcular a tensão máxima de flexão, utilizamos a fórmula:

$
sigma = (M * y) / I
$

Primeiramente, calculamos a área: 
$

$

Aplicando aos valores obtidos na questão, temos que: 

$
sigma = (M * y) / 12
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

Determine a Tensão de cisalhamento do eixo vazado abaixo quando submetido ao momento de torção T3.

#figure(
  figure(
    rect(image("./pictures/q4.png")),
    numbering: none,
    caption: [Questão 4]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Tensão de cisalhamento:

= Questão 5:

Considere o eixo mostrado abaixo. A tensão máxima admissível para o latão é de 55MPa. Dimensione os diâmetros mínimos dos eixos AB e BC.

#figure(
  figure(
    rect(image("./pictures/q5.png")),
    numbering: none,
    caption: [Questão 5]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Diâmetros dos eixos AB:

== Diâmetros dos eixos BC:

= Questão 6:

Observe a estrutura. Determine qual a pressão exercida pelas sapatas no solo (kN/m²). 

- A Carga adicional sobre a laje localizada bem no centro tem valor P(kN). 
- Considere a densidade do concreto armado como sendo de 2.300kg/m³. 
- As paredes têm largura de 15cm e densidade de 1300kg/m³. 
- Desconsidere a porta e a janela para calcular a carga das paredes. 
- A espessura da laje de cobertura e da laje de piso é de 15cm. 
- Os 4 pilares têm medidas de secção de 40cm x 15cm. 
- As vigas de cobertura e baldrames têm secções de 15cm por 30cm. 
- As sapatas (ou blocos de fundação) têm medidas de 1m x 1m x 0,50m de altura. 
- Os pilares são armados com 6 barras de aço de diâmetro “d”. (Determine esse diâmetro considerando que a carga da laje e da viga de cobertura é descarregada 75% no concreto e 25% no aço.)

Considere:
Eaço = 200GPa e Econc=20GPa. 

Para as vigas, determine qual a Tensão máxima de flexão decorrente do peso próprio e da carga das paredes / lajes. 

Considere que a carga das lajes e do peso P são descarregadas igualmente em todo o perímetro das vigas.


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
