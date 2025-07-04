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
  title: "Relatório - Simulação de Rede Filas",
  subtitle: "Avaliação de Desempenho de Sistemas",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "04 de Julho de 2025",
  doc,
)

= Introdução

= Etapas

== Implementação do modelo

Criar um modelo para representar uma rede de filas MM1 conforme indicado abaixo. Uma fila (estação) e ou um splitter deverá ser acrescentado a rede abaixo.

#figure(
  figure(
    rect(image("./pictures/q1.png", width: 100%)),
    numbering: none,
    caption: [Esquematico do trabalho],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Os módulos gen0, gen1 e gen2 são geradores de mensagens com intervalos de envio seguindo distribuição exponencial, sendo o tempo médio parametrizável. 

- Os módulos queue0, queue1 e queue 2 são filas com buffer infinito, um servidor e tempo de serviço configurável. Estes módulos devem armazenar os tamanhos da fila de forma vetorial
- O splitter deve ter 2 saídas com probabilidades configuráveis 
- O sorvedouro deve permitir gerar uma estátistica do tempo médio de requisições das requisições desde a sua entrada no sistema

== Coleta de Dados, Geração de Gráficos

Configurar a geração de requisições (workload) para cobrir todas seguintes combinações de carga abaixo:

#align(center)[
#table(
  columns: 3,
  table.header(
    [Módulo], [carga 1 - 1/(req/s)], [  carga 2 - 1/(req/s)],
  ),
  [gen0], [0.7], [0.8],
  [gen1], [0.9], [1.3],
  [gen2], [0.7], [1.5],
)
]

Supor que os servidores trabalham na seguinte taxa:

#align(center)[
#table(
  columns: 2,
  table.header(
    [Módulo], [tempo médio de serviço 1/(req/s)],
  ),
  [queue0], [0.1s],
  [queue1], [0.3s],
  [queue2], [0.5s],
)
]


- a) Apresente um gráfico de barras mostrando o tempo médio para cada saída.  Qual a configuração que produziu o maior tempo médio de permanência no sistema em cada saída? Qual a possível explicação?
- b) Apresente um gráfico de linha mostrando o tempo de estadia no sistema para
cada requisição, para o cenário de maior tempo médio observado no item (a);
- c) Estude como poderia apresentar o tamanho da fila em cada subsistema na forma de um histograma (ver tutorial tic toc item 5.2). Apresente um histograma para cada fila para o melhor cenário em (a).

= Resolução: 

== Implementação do modelo

