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
  title: "Flexão Máxima em Vigas Bi-Apoiadas",
  subtitle: "Mecânica dos Sólidos",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "08 de Agosto de 2024",
  doc,
)

= Questões: 

== Questão 1: 

Determine qual é a Tensão máxima de flexão atua na viga bi-apoiada mostrada a seguir. Desenhe o diagrama de Momento Fletor e de esforço cortante. Fazer manualmente e enviar foto da solução.

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Representação da viga bi-apoiada - Primeira Questão] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Questão 2: 

Desenhe o diagrama de momento fletor, o diagrama de esforço cortante e a tensão de flexão máxima. O momento de inércia para vigas retangulares é b.h³ /12. Use medidas em metros para obter I (MOMENTO DE INÉRCIA) em m4.

#figure(
  figure(
    rect(image("./pictures/q2.png")),
    numbering: none,
    caption: [Representação da viga bi-apoiada - Segunda Questão] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Calculo das Reações: 

Aplicando no Viga-Online temos:

$
X = (x_i + x_f)/2 = (0 + 10)/2 = 5m
$

Substituindo na fórmula, encontra-se 

$
R_1 + R_2 = 50000N ; 10R_2 = 250000N 
$

Portanto: 

$ 
R_1 = 25000N ; R_2 = 25000N
$


=== Esforço de viga cortante: 

Para o calculo do esforço cortante, foi verificado o valor diretamente no software: 

#figure(
  figure(
    rect(image("./pictures/r2.2.png")),
    numbering: none,
    caption: [Calculo do Esforço Cortante] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


#figure(
  figure(
    rect(image("./pictures/r2.3.png")),
    numbering: none,
    caption: [Plot do Esforço Cortante] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Momento Fletor: 

Para o calculo do momento fletor, da mesma maneira, foi verificado o valor diretamente no software:

#figure(
  figure(
    rect(image("./pictures/r2.4.png")),
    numbering: none,
    caption: [Calculo do Momento Fletor] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Valor do momento fletor total: 

#figure(
  figure(
    rect(image("./pictures/r2.5.png")),
    numbering: none,
    caption: [Plot do Momento Fletor] 
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)