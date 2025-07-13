#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show table.cell.where(y: 0): strong
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: (x, y) => (
    if x > 0 { center }
    else { left }
  )
)


#show: doc => report(
  title: "Showcase - 802.11 Wireless Handover",
  subtitle: "Avaliação de Desempenho de Sistemas",
  authors: ("Arthur Cadore Matuella Barcella","Deivid Fortunato Frederico"),
  date: "13 de Julho de 2025",
  doc,
)

= Introdução

Este documento tem como objetivo analisar um experimento já preparado de avaliação de desempenho de redes usando o Omnet/INET. E com base nesta análise, propor adendos ao experimento para avaliar outros pontos/perspctivas do sistema.

= Seleção e Apresentação de Showcas
