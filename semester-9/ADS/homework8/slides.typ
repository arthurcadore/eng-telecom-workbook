#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Showcase - 802.11 Wireless Handover",
  subtitle: "Avaliação de Desempenho de Sistemas",
  date: "13 de Julho de 2025",
  authors: ("Arthur Cadore M. Barcella , Deivid Fortunato Frederico"),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário
 
#outline()

= Objetivo do experimento 

= Modelo Simulado

= Simulação 

== Cenário 

#figure(
  figure(
    rect(image("./pictures/scenario.png", width: 90%)),
    numbering: none,
    caption: [Cenário de Handover],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Eventos wireless


#figure(
  figure(
    rect(image("./pictures/plot2_eventos_ap1_ap2.svg", width: 100%)),
    numbering: none,
    caption: [Cenário de Handover],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Backoffs

#figure(
  figure(
    rect(image("./pictures/evento_backoff_active.svg", width: 90%)),
    numbering: none,
    caption: [Evento Backoff Active],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Troca de canal 

#figure(
  figure(
    rect(image("./pictures/plot_handover.svg", width: 90%)),
    numbering: none,
    caption: [Tempo vs AP conectado (handover)],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


= Revisão dos Resultados 

= Possibilidade de Variações