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
  title: "Lista de Exercicios - Aula 12",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Junho de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

Uma empresa de exploração de concessão de rodovias está avaliando dois tipos de cobertura asfáltica para estradas, com os seguintes custos por km:


#align(center)[
#table(
  columns: 3,
  table.header(
    [Custo por Km], [Cobertura Asfáltica A], [Cobertura Asfáltica B],
  ),
  [Custo Inicial ($R\$$)], [$R\$ 300.000,00$], [$R\$ 200.000,00$],
  [Vida Útil (anos)], [$8$], [$6$],
  [Custo Anual - Reparos], [$R\$ 10.000,00$], [$R\$ 12.000,00$],
  [Custo Re-Pavimentação], [$R\$ 150.000,00$], [$R\$ 120.000,00$],

)
]

Compare o valor presente dos dois tipos de cobertura asfáltica, em um horizonte de 24 anos e considerando valor residual zero. A TMA da empresa é de $10\% a.a$.

== Questão 2

No Exercício anterior, considere que para o Tipo A os custos anuais de reparos sejam crescentes, sendo 800 no primeiro ano, e aumentando em 800 a cada ano. Qual seria o VPL da alternativa A, neste caso? Qual o projeto mais econômico?


== Questão 3 

A construção de uma estrada envolve os seguintes custos:

#align(center)[
#table(
  columns: 2,
  table.header(
    [Descrição do Custo], [Valor],
  ),
  [Implantação da Estrada], [$R\$ 60.000,00$], 
  [Custo de Manutenção], [$R\$ 100.000,00$ (1° ano), + $3% a.a.$], 
)
]

Com um pedágio de $R\$100$ pretende-se cobrir os custos da estrada nos próximos 18 anos. A taxa mínima de atratividade é de $10\%a.a$. e o valor residual da estrada pode ser considerado nulo. Qual deve ser o fluxo mínimo de veículos, se o mesmo crescer a uma razão de $5\%$ ao ano, para que se justifique a construção da estrada?

== Questão 4

A companhia Beta está considerando dois planos alternativos para a construção de um muro
ao redor de sua nova fábrica. Uma cerca feita de arame de aço galvanizado requer um custo
inicial de $R\$35.000$ e custos anuais de manutenção estimados em $R\$300$. A vida útil esperada é de 25 anos. Uma parede de concreto requer um custo inicial de $R\$20.000$, mas necessitará reparos pequenos a cada 5 anos a um custo de $R\$1.000$, e reparos maiores a cada 10 anos a um custo de $R\$5.000$. Supondo uma taxa de juros de $10\% a.a.$, qual a melhor opção?


== Questão 5

O custo estimado de um gerador de $40 "kW"$ de potência, completamente instalado e pronto
para operar, é de $R\$30.000$. Seu custo de manutenção anual é estimado em $R\$500$. A energia que pode ser gerada anualmente, a plena carga, é estimada em 100.000 kW.h. Se o valor estimado da energia gerada é de $R\$((0,08) / "kWh")$, quanto tempo levará para que esta máquina se torne rentável? Considere uma taxa mínima de atratividade de $9\%a.a.$. Considere que o equipamento possa ser vendido por $R\$2.000$ ao final de sua vida útil estimada de 15 anos. Determine também o VPL e a TIR da operação como um todo.

