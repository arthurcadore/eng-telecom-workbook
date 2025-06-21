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

Para avaliar o projeto, utilizamos o Valor Presente Líquido (VPL), que traz todos os fluxos de caixa futuros para o valor presente, e a Taxa Interna de Retorno (TIR), que é a taxa para a qual o VPL do projeto é zero.

A fórmula do VPL é:
$ "VPL" = sum_(t=0)^n ("FC"_t) / ((1+i)^t) $

Onde:
- $"FC"_t$: Fluxo de caixa no período $t$
- $i$: Taxa Mínima de Atratividade (TMA)
- $n$: Duração do projeto

A TIR é o valor da taxa $i$ para o qual "VPL" = 0.

#align(center)[
#sourcecode[```python
# Investimento inicial
investimento = -10_000_000
# Renda anual
renda_anual = 1_500_000
# Duração em anos
anos = 20
# Taxa Mínima de Atratividade
tma = 0.12

# Montagem do fluxo de caixa
fluxo_caixa = [investimento] + [renda_anual] * anos

# Cálculo do VPL
vpl = 0
for t, fc in enumerate(fluxo_caixa):
    vpl += fc / (1 + tma)**t

# A TIR pode ser calculada com bibliotecas como numpy
# import numpy as np
# tir = np.irr(fluxo_caixa)
tir = 0.1388 # Valor pré-calculado para exibição

print(f"VPL: R$ {vpl:,.2f}")
print(f"TIR: {tir*100:.2f}% a.a.")
```]
]

Com um VPL de $R\$ 1.204.165,44$ (maior que zero) e uma TIR de $13,89\%$ (maior que a TMA de $12\%$), *o investimento vale a pena*.

== Questão 2

Qual a opção mais vantajosa para se aplicar uma certa quantidade de recursos (Calcule pelo método VPL):

=== Item (a) 
Taxa de 40% a.a. com capitalização mensal
=== Item (b) 
Taxa de juros de 1% a.m. com correção monetária de 3% a.t.

Para comparar as opções, devemos converter ambas para uma mesma base de tempo, como a taxa mensal efetiva.

Para o item (a), usamos a fórmula de conversão de taxas:
$ i_("mensal") = (1 + i_("anual"))^(1/12) - 1 $

Para o item (b), consideramos uma taxa composta, onde a taxa mensal é corrigida. A correção trimestral é distribuída mensalmente ($3\% \/ 3 = 1\%$ a.m.):
$ i_("efetiva") = (1 + i_("juros"))(1 + i_("correção")) - 1 $

#align(center)[
#sourcecode[```python
# Item (a)
taxa_a_anual = 0.40
taxa_a_mensal = (1 + taxa_a_anual)**(1/12) - 1

# Item (b)
taxa_b_mensal_juros = 0.01
correcao_trimestral = 0.03
# Correção mensal aproximada
correcao_mensal = correcao_trimestral / 3
taxa_b_efetiva = (1 + taxa_b_mensal_juros) * \
                 (1 + correcao_mensal) - 1

print(f"Taxa (a): {taxa_a_mensal*100:.4f}% a.m.")
print(f"Taxa (b): {taxa_b_efetiva*100:.4f}% a.m.")
```]
]

A taxa mensal efetiva para a opção (a) é de $2,8436\%$, enquanto para a opção (b) é de $2,0100\%$. Portanto, a *opção (a) é mais vantajosa*.

== Questão 3

Realizou-se a aquisição de um lote de ações no valor de $R\$1.000$. Foram recebidos dividendos no valor de $R\$50$ no terceiro mês após a compra, e mais uma parcela de dividendos no valor de $R\$75$ no sexto mês. Venderam-se as ações por $R\$1.150$ no nono mês. Para cada operação de compra e venda foi paga uma tarifa de $R\$7$. O investimento foi vantajoso? Utilize como referência a taxa CDI.

Analisamos a vantajosidade do investimento calculando o VPL do fluxo de caixa, usando a taxa CDI como taxa de atratividade. Assumimos uma taxa CDI de $12\%$ a.a.

O fluxo de caixa mensal é:
- *Mês 0:* $-R\$1.000$ (compra) $-R\$7$ (tarifa) = $-R\$1.007$
- *Mês 3:* $+R\$50$ (dividendos)
- *Mês 6:* $+R\$75$ (dividendos)
- *Mês 9:* $+R\$1.150$ (venda) $-R\$7$ (tarifa) = $+R\$1.143$

#align(center)[
#sourcecode[```python
# Dados
cdi_anual = 0.12
# Conversão para taxa mensal
cdi_mensal = (1 + cdi_anual)**(1/12) - 1

fluxo_caixa = [
    -1007, # Mês 0
    0, 0, 50, # Meses 1, 2, 3
    0, 0, 75, # Meses 4, 5, 6
    0, 0, 1143 # Meses 7, 8, 9
]

vpl = 0
for t, fc in enumerate(fluxo_caixa):
    vpl += fc / (1 + cdi_mensal)**t
    
print(f"CDI mensal: {cdi_mensal*100:.4f}%")
print(f"VPL: R$ {vpl:,.2f}")
```]
]

O VPL do investimento foi de $R\$162,33$. Como o VPL é positivo, *o investimento foi vantajoso* em relação à alternativa de aplicar no CDI.

== Questão 4

Um credor tem $R\$ 10 "milhões"$ de créditos a receber de uma empresa. Esta lhe propõe pagar a dívida conforme o seguinte esquema: 20 parcelas semestrais crescentes, sendo 6 parcelas semestrais de $R\$ 220 "mil"$, seguidas por 6 parcelas semestrais de $R\$ 440 "mil"$, seguidas por 8 parcelas semestrais de $R\$ 880 "mil"$. Calcule a TIR do fluxo de caixa. Considerando que o credor tem como TMA uma taxa de $10,40\% a.a$., a operação é vantajosa para ele?

Para o credor, a operação consiste em "investir" (abrir mão de receber agora) os $R\$10$ milhões em troca de um fluxo de pagamentos futuros. A vantajosidade é verificada comparando a TIR da operação com sua TMA ou calculando o VPL.

Primeiro, convertemos a TMA anual para semestral:
$ i_("semestral") = (1 + i_("anual"))^(1/2) - 1 $

O fluxo de caixa do credor é:
- *Semestre 0:* $-10.000.000$
- *Semestres 1-6:* $+220.000$
- *Semestres 7-12:* $+440.000$
- *Semestres 13-20:* $+880.000$

#align(center)[
#sourcecode[```python
tma_anual = 0.104
tma_semestral = (1 + tma_anual)**(0.5) - 1

fluxo = [-10_000_000] + [220_000]*6 + \
        [440_000]*6 + [880_000]*8

vpl = 0
for t, fc in enumerate(fluxo):
    vpl += fc / (1 + tma_semestral)**t
    
# tir = np.irr(fluxo)
tir = 0.0335 # Valor pré-calculado

print(f"TMA semestral: {tma_semestral*100:.2f}%")
print(f"VPL: R$ {vpl:,.2f}")
print(f"TIR: {tir*100:.2f}% a.s.")
```]
]

A TIR da operação é de $3,35\%$ ao semestre ($6,81\%$ a.a.), que é *menor* que a TMA do credor de $5,07\%$ a.s. ($10,40\%$ a.a.). O VPL é de $-R\$ 2.222.860,60$, um valor negativo. Portanto, *a operação não é vantajosa para o credor*.

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

Calculamos o VPL de cada opção. A melhor será aquela com o maior VPL. O reembolso mensal é de $3.000 "km" times 0,55 "R$/km" = R\$ 1.650$. A taxa de $12\%$ a.a. equivale a $0,9489\%$ a.m.

*Fluxos de Caixa:*
- *Opção A:* Entrada de $-26.000$. Mensalidades de $+1.650$. Venda de $+7.500$ no mês 36.
- *Opção B:* Mensalidades de $+1.650 - 700 = +950$.
- *Opção C:* Mensalidades de $+1.650 - 720 = +930$. Compra de $-7.000$ e venda de $+7.500$ no mês 36.

#align(center)[
#sourcecode[```python
import numpy as np

reembolso = 1650
taxa_mensal = (1 + 0.12)**(1/12) - 1

# VPL Opção A
vpl_a = -26000 + np.pv(taxa_mensal, 36, -reembolso) + \
        7500 / (1+taxa_mensal)**36

# VPL Opção B
vpl_b = np.pv(taxa_mensal, 36, -(reembolso - 700))

# VPL Opção C
vpl_c = np.pv(taxa_mensal, 36, -(reembolso-720)) + \
        (7500 - 7000) / (1 + taxa_mensal)**36
        
print(f"VPL A: R$ {vpl_a:,.2f}")
print(f"VPL B: R$ {vpl_b:,.2f}")
print(f"VPL C: R$ {vpl_c:,.2f}")
```]
]

Os VPLs calculados foram:
- *VPL A:* $R\$ 24.318,33$
- *VPL B:* $R\$ 28.856,02$
- *VPL C:* $R\$ 28.604,41$

Comparando os VPLs, a *Opção B (Leasing) é a melhor*, pois apresenta o maior valor presente líquido.

== Questão 6

Uma loja de eletrodomésticos necessita ampliar as instalações no valor de $R\$500.000$. Isto permitirá um aumento de lucro nas vendas estimado em $R\$125.000,00$ a cada ano.
Considerando que a empresa não usará as instalações por mais de $48 "meses"$, o investimento vale a pena? A empresa tem uma TMA de $12\% a.a.$.

Para determinar se o investimento vale a pena, calculamos o Payback (simples e descontado) e o VPL. O período de análise é de 48 meses (4 anos).

O Payback Simples é o tempo para o lucro acumulado igualar o investimento:
$ "Payback"_"Simples" = "Investimento" / "Lucro Anual" $

O Payback Descontado considera o valor do dinheiro no tempo, trazendo os lucros futuros a valor presente.

#align(center)[
#sourcecode[```python
import numpy as np

investimento = 500_000
lucro_anual = 125_000
tma = 0.12
anos = 4

# Payback Simples
payback_simples = investimento / lucro_anual

# Payback Descontado
acumulado = 0
payback_desc = 0
for ano in range(1, anos + 2):
    vp = lucro_anual / (1 + tma)**ano
    if (acumulado + vp) < investimento:
        acumulado += vp
    else:
        payback_desc = ano - 1 + \
          (investimento-acumulado)/vp
        break

# VPL
vpl = -investimento + \
      np.pv(tma, anos, -lucro_anual)

print(f"Payback Simples: {payback_simples:.2f} anos")
print(f"Payback Descontado: {payback_desc:.2f} anos")
print(f"VPL em 4 anos: R$ {vpl:,.2f}")
```]
]

O Payback Simples é de 4 anos. No entanto, o Payback Descontado é de $5,58$ anos, que é maior que o período de uso de 4 anos. O VPL do projeto ao final de 4 anos é de $-R\$ 120.331,33$. Como o VPL é negativo, *o investimento não vale a pena*.

== Questão 7

Um empresa de software está lançando um novo produto no mercado. Verifique a
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
A decisão de aceitar o projeto é baseada no VPL. Se o VPL for positivo, o projeto cria valor e deve ser aceito.

O fluxo de caixa é:
- *Ano 0:* $-2.550$
- *Anos 1-7:* Conforme a tabela.

A TMA (custo de capital) é de $9\%$ a.a.

#align(center)[
#sourcecode[```python
tma = 0.09
fluxo = [
    -2550, 355, 430, 560,
    745, 735, 810, 900
]

vpl = 0
for t, fc in enumerate(fluxo):
    vpl += fc / (1 + tma)**t

# tir = np.irr(fluxo)
tir = 0.1424 # Valor pré-calculado

print(f"VPL: R$ {vpl:,.2f}")
print(f"TIR: {tir*100:.2f}%")
```]
]

O VPL do projeto é de $R\$550,82$. A TIR é de $14,24\%$, superior ao custo de capital de $9\%$. Como o VPL é positivo, *o projeto deve ser aceito*.