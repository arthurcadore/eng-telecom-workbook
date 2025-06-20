#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Lista de Exercicios - Aula 11",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Junho de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

Uma central de geração de energia custa $R\$ 10.000.000,00$ e é capaz de gerar uma renda anual de $R\$ 1.500.000,00$ durante 20 anos. Considerando uma taxa mínima de atratividade de $12\%a.a$., o investimento vale a pena? Analise utilizando o VPL e a TIR. 

== Questão 2

Qual a opção mais vantajosa para se aplicar uma certa quantidade de recursos (Calcule pelo método VPL):

=== Item (a) 
Taxa de 40% a.a. com capitalização mensal
=== Item (b) 
Taxa de juros de 1% a.m. com correção monetária de 3% a.t.


== Questão 3

Realizou-se a aquisição de um lote de ações no valor de $R\$1.000$. Foram recebidos dividendos no valor de $R\$50$ no terceiro mês após a compra, e mais uma parcela de dividendos no valor de $R\$75$ no sexto mês. Venderam-se as ações por $R\$1.150$ no nono mês. Para cada operação de compra e venda foi paga uma tarifa de $R\$7$. O investimento foi vantajoso? Utilize como referência a taxa CDI.

== Questão 4

Um credor tem $R\$ 10 "milhões"$ de créditos a receber de uma empresa. Esta lhe propõe pagar a dívida conforme o seguinte esquema: 20 parcelas semestrais crescentes, sendo 6 parcelas semestrais de $R\$ 220 "mil"$, seguidas por 6 parcelas semestrais de $R\$ 440 "mil"$, seguidas por 8 parcelas semestrais de $R\$ 880 "mil"$. Calcule a TIR do fluxo de caixa. Considerando que o credor tem como TMA uma taxa de $10,40\% a.a$., a operação é vantajosa para ele?


== Questão 5

Um vendedor precisa de um carro para uso comercial. Ele espera ser promovido ao término de 3 anos, quando não mais precisará viajar. O vendedor deverá fazer em média 3.000km por
mês, e a companhia o reembolsa a cada mês a uma taxa de $\$0,55$ por quilômetro rodado. O
vendedor tem 3 opções diferentes para obter o carro desejado:

=== Item (a) 
Adquirir o carro a vista, a um preço de $R\$26.000$;
=== Item (b) 
Fazer leasing do carro: o pagamento mensal é de $R\$700$ para uma operação de $36 "meses"$, e ao final do período, o carro é devolvido à companhia de leasing;
=== Item (c)
Fazer leasing com opção de compra: o pagamento mensal é de $R\$720$ por 36 meses, e ao final do período o carro pode ser adquirido por $R\$7.000$;

A taxa de juros é de $12\%a.a$. Se o carro puder ser vendido por $R\$7.500$ ao final dos 3 anos, qual a melhor opção?

== Questão 6

Uma loja de eletrodomésticos necessita ampliar as instalações no valor de $R\$500.000$. Isto permitirá um aumento de lucro nas vendas estimado em $R\$125.000,00$ a cada ano.
Considerando que a empresa não usará as instalações por mais de $48 "meses"$, o investimento vale a pena? A empresa tem uma TMA de $12\% a.a.$.

== Questão 7

Uma empresa de software está lançando um novo produto no mercado. Verifique a
possibilidade de aceitar ou não o projeto, aplicando o método do VPL, considerando um custo de capital igual a $9\% a.a.$, sendo que o fluxo de caixa está demonstrado da seguinte maneira:


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
#align(center)[
#table(
  columns: 8,
  table.header(
    [Investimento],
    [Ano 1], [Ano 2], [Ano 3], [Ano 4], [Ano 5], [Ano 6], [Ano 7],
  ),
  [2.550,00],
  [355,00], [430,00], [560,00], [745,00], [735,00], [810,00], [900,00],
)
]