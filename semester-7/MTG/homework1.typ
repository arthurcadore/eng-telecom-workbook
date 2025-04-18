#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

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

=== Linha Original: 
Para o casamento por elementos mistos, é necessário a adição de uma linha de transmissão de comprimento variavél (de acordo com a impedância imaginária da carga), bem como a adição de um componente reativo (indutor ou capacitor) para o casamento da parte imaginária da impedância.

#align(center)[
#{
import "@preview/quill:0.2.1": *

quantum-circuit(
scale: 120%,
$"Zin"$, 2, $"Z0"$, 1, $"ZL"$, ctrl(1, show-dot:false),  [\ ],
$"Zin"$, 5,  ctrl(0, show-dot:false)
)
}
]
- *Zin* é a impedância de entrada 
- *Z0* é a impedância da linha de transmissão 
- *ZL* é a impedância da carga.

=== Linha Casada:
Sendo assim, o circuito final após o casamento por elementos mistos é composto por uma linha de transmissão de comprimento variável e um componente reativo, que juntos, casam a impedância da carga, desta forma, na entrada do circuito, a impedância imaginária é cancelada e a impedância real (normalizada) é igual a 1, ou seja, casada com a linha. 

#align(center)[
#{
import "@preview/quill:0.2.1": *

quantum-circuit(
scale: 120%,
$"Zin"$, 2, $"Z0"$, ctrl(1),1, $"LTC"$, 1, $"ZL"$, ctrl(1, show-dot:false),  [\ ],
$"Zin"$, 3, $"XLC"$, 4,  ctrl(0, show-dot:false),
)
}
]
- *Zin* é a impedância de entrada 
- *Z0* é a impedância da linha de transmissão 
- *LTC* é a linha de transmissão para o casamento 
- *ZL* é a impedância da carga.
- *XLC* é a impedância da linha XL ou XC correspondente ao casamento. 


#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, center, center),
  table.header[][Impedância da linha ($ohm$)][Impedância da Carga ($ohm$)],
  [Valor Real], [50], [$11 + 25$j],
  [Valor Normalizado], [1], [$ 0,22 + 0,5$j],
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

Desta forma, podemos concluir que os valores necessários para o casamento misto são os seguintes: 

=== Linha de Transmissão adicionada:
#table(
  columns: (1fr, 1fr, 1fr),
  align: (left, center, center),
  table.header[][Impedância vista na LTC($ohm$)][Comprimento da LTC ($lambda$)],
  [Valor Normalizado], [$1 + 1,9$j], [0,11$lambda$],
  [Valor Real], [$50+95$j], [0,11$lambda$],
)

=== Componente de Casamento Reativo: 

Com a parte real da impedância casada, podemos calcular o valor do componente reativo a ser adicionado ao circuito para casar a parte imaginária da impedância

#table(
  columns: (1fr, 1fr),
  align: (left, center),
  table.header[][Impedância do componente($ohm$)],
  [Valor Normalizado], [1,9j],
  [Impedância Real], [95j],
)

#let impedancia = "indutiva"
#let frequencia = 1e9
#let impedanciaV = 0.1
#let c 
#let l
#let piNumb = 3.14159265359

Realizando o calculo de da impedância #impedancia, obtemos o seguinte valor do componente a ser adicionado a posição "XLC" do circuito de linha casada. Para realizar o calculo, podemos aplicar a equação apresentada abaixo:
\

#if impedancia == "capacitiva"{

c = 1/(2 * piNumb * frequencia * impedanciaV)

align(center)[
$"XC" = 1/(2 *pi * f * C) arrow #impedanciaV = 1/(2 * pi * frequencia * C) arrow C = 1/(2 * pi * frequencia * impedanciaV) 

\

C = #c 
$
]
  table(
    columns: (1fr, 1fr),
    align: (left, center),
    table.header[Valor do Capacitor ($F$)][#c]
  )
  
}else {

l = impedanciaV / (2 * piNumb * frequencia)

align(center)[
$"XL" = 2 * pi * f * L arrow #impedanciaV = 2 * pi * f * L arrow L = #impedanciaV / (2 * pi * f)

\

L = #l
$
]
}

== Circuito resultante: 

O circuito resultante ficará da seguinte forma apresentada abaixo, onde os componentes adicionados fazem o casamento da impedância da carga, desta forma, a impedância de entrada do circuito é casada com a linha de transmissão:

#align(center)[
#{
import "@preview/quill:0.2.1": *

quantum-circuit(
scale: 120%,
$"Zin"$, 2, $"50"ohm$, ctrl(1),1, $"0,11"lambda$, 1, $"11+25j"ohm$, ctrl(1, show-dot:false),  [\ ],
$"Zin"$, 3, $"+95j"ohm$, 4,  ctrl(0, show-dot:false),
)
}
]


= Referências

- #link("https://www.acs.psu.edu/drussell/Demos/SWR/SmithChart.pdf")[Smith Chart - Original Paper]