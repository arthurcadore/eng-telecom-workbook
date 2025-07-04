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
  title: "Projeto de Investimento em rede GPON",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "3 de Junho de 2025",
  doc,
)

= Introdução

Este documento apresenta a análise de investimento para um projeto de rede GPON, incluindo o cálculo do VPL, TIR e Payback. A análise é baseada em dados financeiros e técnicos fornecidos.

= Dados do Projeto

== Equipamentos Ativos:


#align(center)[
#table(
  columns: 4,
  table.header(
    [Equipamento], [Custo Á Vista], [Custo Parcelado], [Quantidade]
  ),
  [Chassi OLT AN6000-2 02U 10G], [3782], [4066], [1],
  [Placa GPOA], [9890], [9890], [1],
  [Transceiver GPON C++ GPON], [319.32], [319.32], [10],
  [Transceiver KTS 2110+], [359.99], [359.99], [2],
  [AN5506-01-A], [88], [88], [1280],
  [Nobreak 1500VA], [1000], [1000], [1],

)
]

== Equipamentos Passivos:


#align(center)[
#table(
  columns: 4,
  table.header(
    [Equipamento], [Custo Á Vista], [Custo Parcelado], [Quantidade]
  ),

  [Rack de telecomunicações 10U], [1000], [1000], [1],
  [DIO 12x2], [100], [100], [10],
  [Splitter 1x16], [50], [50], [10],
  [Splitter Desbalanceado 10/90], [50], [50], [10],
  [Splitter Desbalanceado 20/80], [50], [50], [10],
  [Splitter Desbalanceado 30/70], [50], [50], [10],
  [Splitter Desbalanceado 40/60], [50], [50], [10],
  [Conector SC/APC], [1.5], [1.5], [1280],
  [Patch-cord fibra óptica 1 metro], [5], [5], [1280],
)
]

== Materiais de Infraestrutura e Ancoragem:

#align(center)[
#table(
  columns: 4,
  table.header(
    [Material], [Custo Á Vista], [Custo Parcelado], [Quantidade]
  ),
  [Mini-RA 12FO], [100], [100], [10],
  [Mini-RA 6FO], [50], [50], [10],
  [Drop 1FO], [10], [10], [1280],
  [Caixa de emenda - Fusão], [200], [200], [10],
  [Caixa de emenda - Conectorizada], [200], [200], [10],
  [Caixa de terminação], [100], [100], [10],
  [Abraçadeira-BAP-3], [0.5], [0.5], [1280],
  [Isolador BAP-3], [0.1], [0.1], [1280],
  [Alça Preformada], [0.5], [0.5], [1280],
)
]

== Alugueis: 

#align(center)[
#table(
  columns: 3,   
  table.header(
    [Aluguel], [Custo Mensal], [Quantidade]
  ),
  [POP - Ponto de Presença], [1000], [1],
  [Poste], [6], [1280],
  [Uplink], [1000], [1],
)
]
== Mão de Obra:

#align(center)[
#table(
  columns: 3,
  table.header(
    [Serviço], [Custo Mensal], [Quantidade]
  ),
  [Instalação POP], [5000], [1],
  [Instalação Residencial], [50], [1280],
  [Instalação Infraestrutura PON], [1], [10000],
  [Fusões], [1], [1000],
)
]

== Planos de Internet e instalação:

#align(center)[
#table(
  columns: 3,
  table.header(
    [Plano], [Preço Mensal], [Taxa de Instalação]
  ),

  [Plano 100Mbps], [100], [300],
  [Plano 200Mbps], [150], [300],
  [Plano 500Mbps], [200], [300],
)
]
