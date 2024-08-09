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
