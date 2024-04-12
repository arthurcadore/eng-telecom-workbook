#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#import "typst-canvas/canvas.typ": canvas
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Casamento de Impedâncias por Elementos Mistos",
  subtitle: "Meios de Transmisão Guiados ",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "12 de Abril de 2024",
  doc,
)


= Introdução

Neste relatório o objetivo é apresentar o casamento de impedâncias por elementos mistos, utilizando a carta de Smith. A carta de Smith é uma ferramenta gráfica utilizada para a análise de circuitos de RF, sendo útil para a análise de casamento de impedâncias em a necessidade de transformadas de impedância por expressões matemáticas. 

= Desenvolvimento teórico

Para o casamento por elementos mistos, é necessário a adição de uma linha de transmissão de comprimento variavél (de acordo com a impedância imaginária da carga), bem como a adição de um componente reativo (indutor ou capacitor) para o casamento da parte imaginária da impedância.

Sendo assim, o circuito final após o casamento por elementos mistos é composto por uma linha de transmissão de comprimento variável e um componente reativo, que juntos, casam a impedância da carga, desta forma, na entrada do circuito, a impedância imaginária é cancelada e a impedância real (normalizada) é igual a 1, ou seja, casada com a linha. 




#table(
  columns: (1fr, 1fr, 1fr),
  table.header[Implementacao][Área][Tempo de propagação],
  [Parte 1], [], [],
  [Parte 2], [], [],
)


== Representação na carta

#figure(
  figure(
    image("SmithChart.svg"),
    numbering: none,
    caption: [Representação (SmithChart) - Casamento por elementos mistos]
  ),
  caption: figure.caption([Carta de Smith (Importada)], position: top)
)

= Conclusão
Seção V - Conclusões

= Referências

- #link("https://www.acs.psu.edu/drussell/Demos/SWR/SmithChart.pdf")[Smith Chart - Original Paper]