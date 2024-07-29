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
  title: "Análise de Desempenho de Modulações Digitais",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "29 de Julho de 2024",
  doc,
)

= Introdução: 

O objetivo deste relatório é analisar o desempenho das modulações digitais MPSK e MQAM em um sistema de comunicação digital. Para isso, foram simuladas diferentes modulações e analisados os resultados obtidos.

= Desenvolvimento e Resultados: 

O desenvolvimento deste relatório foi dividido em três diferentes seções, onde foi analisado o desempenho individual de cada modulação e em seguida um comparativo entre as duas diferentes modulações. 

== Desempenho de modulações MPSK

=== 4-MPSK

=== 8-MPSK

=== 16-MPSK

=== 32-MPSK

== Desempenho de modulações MQAM

=== 4-MQAM

=== 16-MQAM

=== 64-MQAM

== Comparação de modulações PSK vs. QAM

=== 4-PSK vs. 4-QAM

=== 16-PSK vs. 16-QAM

=== 64-PSK vs. 64-QAM

= Conclusão:

= Referências Bibliográficas:

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]


