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
  date: "13 de Julho de 2025",
  doc,
)

= Introdução

Este documento tem como objetivo apresentar a análise de investimento para um projeto de implantação de rede GPON, incluindo o cálculo do VPL, TIR e Payback. A análise é baseada em dados financeiros e técnicos discutidos na disciplina de STC (Sistemas de Telecomunicações).

= Dados do Projeto

Inicialmente, foram definidos os dados do projeto, como o investimento inicial, os custos de equipamentos e alugueis, a receita de planos e a taxa de instalação, os custos de mão de obra e os custos de equipamentos passivos e de lançamento.

== Equipamentos Ativos:

Os equipamentos ativos são os equipamentos que são usados para a implantação da rede GPON, como o OLT, a ONU e o transceiver. 

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

Os equipamentos passivos são os equipamentos que são usados para a implantação da rede GPON, como o rack, o splitter e o patchcord de fibra. 

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

Os materiais de infraestrutura e ancoragem são os materiais que são usados para a implantação da rede GPON, como o cabo mini-RA, o cabo drop,  caixa de emenda, entre outros. 

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

Os alugueis foram definidos com base em pesquisa no local de instalação, considerando o custo de aluguel de um poste, o custo do Uplink e da sala comercial utilizada: 

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

A mão de obra foi definida com base em discussão em sala, foi colocado um valor definido por demanda da mão de obra, apenas para simplificar o cálculo. 

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

Os planos de internet foram definidos com base em pesquisa de mercado, considerando os planos de internet mais comuns no local de instalação e seu valor correspondente.

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


= Fluxo de Caixa

O primeiro passo na análise foi definir o fluxo de caixa mensal, considerando as receitas e despesas do projeto, para isso foi projetado ao longo de 6 anos (devido a quantidade de portas PON disponiveis na OLT e a média de novas instalações no mes de 20 clientes por mes), considerando os custos de equipamentos, alugueis, mão de obra e receita de planos e instalação.

=== Fluxo de Caixa Mensal

O fluxo de caixa mensal foi definido com base na receita líquida e na despesa líquida, considerando os custos de equipamentos, alugueis, mão de obra e receita de planos e instalação.

$
  "FC"_i = "Receita"_i - "Despesa"_i
$
Onde: 
- $"FC"_i$ é o fluxo de caixa no mês $i$,
- $"Receita"_i$ é a receita líquida no mês $i$ e 
- $"Despesa"_i$ é a despesa líquida no mês $i$.


#let moore = csv("./fluxo_caixa_12meses.csv")
#let moore-log = moore.slice(1).map(m => {
  let (mes, c_inicial, c_pon, r_planos, r_instalacao, c_onus, c_fixos, l_liquido, m_obra, s_acumulado) = m
  (mes, c_inicial, c_pon, r_planos, r_instalacao, c_onus, c_fixos, l_liquido, m_obra)
})

=== Dataset 1° Ano

Com base nos dados do fluxo de caixa mensal, foi projetado um dataset para o 1° ano, considerando os custos de equipamentos, alugueis, mão de obra e receita de planos e instalação. 

#table(
   columns: moore-log.first().len(),
   align: (left, center),
   fill: (_, y) => if calc.odd(y) { rgb("D7D9E0") },
   table.header[mes][c_inicial][c_pon][r_planos][r_inst][c_onus][c_fixos][l_liquido][m_obra],
   ..moore-log.flatten(),
)

Com base no dataset, podemos separar as receitas e despesas do projeto, conforme apresentado abaixo. 

#figure(
  figure(
    rect(image("./pictures/fluxo_caixa_receitas_despesas.svg", width: 100%)),
    numbering: none,
    caption: [Fluxo de caixa],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Viabilidade

Tendo o fluxo de caixa, podemos calcular a viabilidade do projeto, considerando o investimento inicial, o fluxo de caixa mensal e o saldo acumulado.

== Fluxo de Caixa Acumulado

O fluxo de caixa acumulado é definido como a soma dos fluxos de caixa do mês $i$ até o mês $n$, então uma vez tendo o fluxo de caixa mensal, podemos calcular o fluxo de caixa acumulado ao longo do período de projeção do investimento. 

$
  S_n = sum(i: 1..n, "FC"_i)
$
Onde: 
- $S_n$ é o saldo acumulado no mês $n$,
- $"FC"_i$ é o fluxo de caixa do mês $i$ (lucro líquido).

== Payback

Tendo o fluxo de caixa acumulado, podemos calcular o payback, que é o tempo necessário para recuperar o investimento inicial, que é dado por $S_n$.

$
  "Payback" = min(S_n > 0)
$

Onde: 
- $S_n$ é o saldo acumulado no mês $n$,
- $"FC"_i$ é o fluxo de caixa no mês $i$ (lucro líquido).

== Valor Presente Líquido (VPL)

O valor presente líquido é definido como a soma dos fluxos de caixa do mês $i$ até o mês $n$, considerando a taxa mínima de atratividade (TMA) mensal, que é dada por $r$.

$
  "VPL" = sum(i: 1..N, "FC"_i / (1 + r^)i))
$

Onde: 
- $"FC"_i$ é o fluxo de caixa no mês $i$,
- $r$ é a taxa mínima de atratividade (TMA) mensal, e 
- $N$ é o número total de meses.

== Taxa Interna de Retorno (TIR)

A taxa interna de retorno (TIR), é utilizada para determinar o percentual de retorno do investimento, considerando a taxa que zera o valor presente líquido dos fluxos de caixa, ou seja, a taxa que zera o valor presente líquido dos fluxos de caixa.

$
  "TIR" = sum(i: 1..N, "FC"_i / (1 + "TIR")^i)      
$
Onde: 
- $"FC"_i$ é o fluxo de caixa no mês $i$,
- $"TIR"$ é a taxa que zera o valor presente líquido dos fluxos de caixa.

#figure(
  figure(
    rect(image("./pictures/viabilidade_fluxo_caixa.svg", width: 100%)),
    numbering: none,
    caption: [Viabilidade do Investimento],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão

Com base nos cálculos realizados, podemos concluir que o investimento é viavel *A LONGO PRAZO*, sendo necessario investir grandes somas, especialmente nos primeiros dois anos para poder manter a infraestrutrutura funcionando, entretanto, a longo prazo o investimento se torna lucrativo, mesmo sem operação da rede, considerando a carteira de clientes que se formou, e os custos estabilizados de operação e manutenção. 

== Projeção para 10 Anos

Como dito anteriormente, a longo prazo, os valores se estabilizam, conforme apresentado abaixo, considerando uma carteira de clientes estavel, após 60 meses (5 anos), a entrada de receita se torna constante (considerando que não há ampliação), porem os custos de manutenção se mantem os mesmos. 

#figure(
  figure(
    rect(image("./pictures/fluxo_caixa_10_anos.svg", width: 100%)),
    numbering: none,
    caption: [Fluxo de Caixa],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Essa entrada de receita constante, reflete na viabilidade do investimento a longo prazo, pois o investimento se torna lucrativo, considerando os custos de manutenção estabilizados e a receita constante.

#figure(
  figure(
    rect(image("./pictures/viabilidade_10_anos.svg", width: 100%)),
    numbering: none,
    caption: [Viabilidade do Investimento],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)