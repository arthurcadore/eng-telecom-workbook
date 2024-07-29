#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Transmissão / Recepção Digital",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "30 de Junho de 2024",
  doc,
)


#sourcecode[```
authors
```]

= Introdução: 

= Desenvolvimento e Resultados: 

== Parte 1: 

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: [Componentes do sinal de transmissão]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/3.png")),
    numbering: none,
    caption: [Sinal de Transmissão (Sem e com ruído)]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: [Componentes do sinal Demoduladas e Filtradas]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/5.png")),
    numbering: none,
    caption: [Comparando sinal de TX com sinaL de RX]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/6.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Transmitido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/7.png")),
    numbering: none,
    caption: [Diagrama de constelação QAM do sinal Recebido]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão:

= Referências Bibliográficas: