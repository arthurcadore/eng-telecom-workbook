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
  title: "Exercicios 12: Equação de Bernoulli - 
  Tubo de Venturi e Tubo de Pitot",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Junho de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

No Venturi da figura água escoa como fluido ideal. A área na seção (1) foi usado um tubo com diâmetro de $20 "mm"$, enquanto que na seção (2) o diâmetro é $5 "mm"$. Um manômetro cujo fluido manométrico é mercúrio ($rho H_g= 13600 "kg"/m^3$) é ligado entre as seções (1) e (2) e indica um desnível $h$ de $5 "cm"$. Pede-se a vazão volumétrica e velocidade do escoamento na seção (1). ($rho H_"2O"= 1.000 "kg"/m^2$).

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Esquematico Questão 1],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

