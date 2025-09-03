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
  title: "Laboratório - Estudo de condutividade",
  subtitle: "Química Geral",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "1 de Setembro de 2025",
  doc,
)

= Introdução

Condutividade é a capacidade de um material conduzir corrente elétrica. Em sistemas de telecomunicações, a condutividade é um fator crítico que afeta a eficiência e a qualidade da transmissão de sinais. Materiais com alta condutividade, como cobre e alumínio, são comumente utilizados em cabos e componentes eletrônicos para garantir uma transmissão eficaz de dados.

== Objetivos
Os objetivos deste laboratório são:
- Compreender os princípios da condutividade elétrica.
- Analisar a condutividade de diferentes materiais.
- Avaliar o impacto da condutividade na transmissão de sinais em sistemas de telecomunicações.

== Condutivímetro
O condutivímetro é um instrumento utilizado para medir a condutividade elétrica de materiais. Ele funciona aplicando uma tensão elétrica ao material e medindo a corrente resultante. A relação entre a tensão e a corrente permite calcular a condutividade do material. Em laboratório, o condutivímetro é uma ferramenta essencial para experimentos que envolvem a análise de propriedades elétricas de diferentes substâncias.


= Experimento prático

== Parte 1 - Tabela de condutividade

Resultado das medidas de condutividade realizados em sala: 
#align(center)[
#table(
  columns: 3,
  table.header(
    [Substância], [Condutividade $mu S"/""cm"$], [Temperatura (°C)]
  ),
  [Água Destilada], [4,64], [23,3],
  [Água de Abastecimento], [71,8], [21,9],
  [Água mineral], [84,00], [22,3], 
  [Água do mar], [43540,0], [22,6],
  [NaCL (0,01 M/L)], [6960,0], [23,3],
  [HcL (0,01 M/L)], [39200,0], [23,3],
  [NaOH (0,01 M/L)], [21210,0], [23,4],
  [Etanol], [7,18], [23,4],
  [Propanol], [7,85], [23,4],
  [Sacarose], [28,24], [23,5],
  [Etanol + Água Destilada], [8,05], [23,4],
  [Propanol + Água Destilada], [8,27], [23,4],
  [Ácido Acético (0,1 M/L)], [418,08], [23,8],
  [Ácido Acético (6 M/L)], [13,68], [23,3],
  [Ácido Acético (17 M/L)], [7,94], [22,8],
)
]

== Parte 2 - Tabela de condutividade

Resultado das medidas de condutividade realizados em sala: 
#align(center)[
#table(
  columns: 3,
  table.header(
    [Substância], [Condutividade $mu S"/""cm"$], [Temp. (°C)]
  ),
  [30 $"mL"$ Ácido Acético (17 M/L)], [7,94], [22,8],
  [15 $"mL"$ Ácido Acético (17 M/L) + 15 $"mL"$ Propanol], [8,81], [22,7],
  [15 $"mL"$ Ácido Acético (17 M/L) + 15 $"mL"$ Água], [294,1], [22,8],
  [60 $"mL"$ HCl (6 M/L)], [182,3], [22,8],
  [60 $"mL"$ Ácido Acético (6 M/L)], [6,30], [21,5],
  [30 $"mL"$ HCl (6 M/L) + $"CaCO"_3$], [203100,0], [21,6],
  [30 $"mL"$ Ácido Acético (6 M/L) + $"CaCO"_3$], [12,73], [21,7],
  [30 $"mL"$ HCl (6 M/L) + $"Zn(s)"$], [1000-30000], [21,7],
  [30 $"mL"$ Ácido Acético (6 M/L) + $"Zn(s)"$], [3,74], [21,7],
  [15 $"mL"$ HCl (0,01 M/L) + 15 $"mL"$ NaOH (0,01 M/L)], [2660], [21,7],
  [30 $"mL"$ Ácido Acético (0,1 M/L) + 15 $"mL"$ $"NH"_3$ (0,1 M/L)], [2190], [21,8],
)
]

= Questões 

== Por que a água da rede publica de abastecimento tem maior condutividade que a água destilada?


== É sabido que o cloreto de sódio no estado sólido comporta-se como isolante elétrico. 

=== Explique essa afirmação sabendo que o mesmo é representado através de modelos como $"Na"^+"Cl"^-$

=== Explique usando equações de reações e as teorias de ligação e estrutura quimica, a condutividade elétrica e o processo quimico que ocorre quando se dissolve cloreto de sódio em agua. 

=== Que espécies iônicas podem ser encontradas na água do mar? 

== Que espécies quimicas estão presentes em soluções de $"NaOH"$ e $"HCl"$ (0,01 M/L)? Escreva equações para descrever as reações que produzem tais espécies. 

== Como você classificaria os alcoois etanol e propanol (eletrólitos fortes, fracos ou não eletrólitos)? Considere as condutividades registradas para os alcoois puros e dissolvidos em água e justifique sua resposta. 

== Descreva e explique em forma de texto e também usando equações de reações quimicas, as propriedades de condutividade elétrica do ácido acético glacial e do mesmo dissolvido em água. Você classificaria o ácido acético como eletrólito forte, fraco ou não eletrólito? Justifique sua resposta.

== Você classificaria a sacarose como eletrólito forte, fraco ou não eletrólito? Justifique sua resposta.

== Comparando os dados obtidos para as medidas de condutividade de ácido acético glacial, ácido acético em propanol e ácido acético em ága, explique a influência dos solventes nas propriedades químicas dos sistemas e descreva suas respectivas representações através de equações químicas. 

== Comparando qualitativamente a velocidade das reações 11 [30 $"mL"$ HCl (6 M/L) + $"CaCO"_3$] e 12 [30 $"mL"$ Ácido Acético (6 M/L) + $"CaCO"_3$], explique a relação entre as velocidades observadas e os dados de condutividade obtidos para os sistemas químicos 9 [60 $"mL"$ HCl (6 M/L)] e 10 [60 $"mL"$ Ácido Acético (6 M/L)]. Faça o mesmo para as reações 13 [30 $"mL"$ HCl (6 M/L) + $"Zn(s)"$] e 14 [30 $"mL"$ Ácido Acético (6 M/L) + $"Zn(s)"$], também comparando com as condutividades obtidas nas reações 9 [60 $"mL"$ HCl (6 M/L)] e 10 [60 $"mL"$ Ácido Acético (6 M/L)]

=== Reações 11 e 12 ($"CaCO"_3$ + HCl e $"CaCO"_3$ + Ácido Acético)

=== Reações 13 e 14 ($"Zn(s)"$ + HCl e $"Zn(s)"$ + Ácido Acético)

== Explique, usando equações de reações químicas e as teorias de força e eletrólitos as diferenaçs de condutividade observadas para os reagentes em separado e para os produtos formados nas reações 16 [15 $"mL"$ HCl (0,01 M/L) + 15 $"mL"$ NaOH (0,01 M/L)] e 17 [30 $"mL"$ Ácido Acético (0,1 M/L) + 15 $"mL"$ $"NH"_3$ (0,1 M/L)]

== Exlique

=== Qual o objetivo da prática de estudo da condutividade feita em laboratório?

=== Como você sabe que está usando corretamente o condutivimetro? 

