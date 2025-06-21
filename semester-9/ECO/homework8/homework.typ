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
  date: "21 de Junho de 2025",
  doc,
)

= Introdução

Este documento apresenta as resoluções da lista de exercícios sobre comparação de alternativas de investimento, utilizando uma abordagem de cálculo manual para VPL, TIR e Payback.

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

Para comparar projetos com vidas úteis diferentes, utilizamos o método do Valor Presente do Custo (VPC) ao longo de um horizonte de tempo comum (24 anos). A alternativa mais econômica é a que apresenta o menor custo presente (VPL mais próximo de zero). A fórmula do VPL é:
$ "VPL" = sum_(t=0)^n ("FC"_t) / ((1+i)^t) $

#sourcecode[```python
tma = 0.10
horizonte = 24

# VPL Manual
def vpl_manual(taxa, fluxo):
    vpl = fluxo[0]
    for t, val in enumerate(fluxo[1:], 1):
        vpl += val / (1 + taxa)**t
    return vpl

# Alternativa A
fluxo_a = np.zeros(horizonte + 1)
fluxo_a[0] = -300000
for ano in range(1, horizonte + 1):
    fluxo_a[ano] -= 10000
    if ano % 8 == 0 and ano != 24:
        fluxo_a[ano] -= 150000
vpl_a = vpl_manual(tma, fluxo_a)

# Alternativa B
fluxo_b = np.zeros(horizonte + 1)
fluxo_b[0] = -200000
for ano in range(1, horizonte + 1):
    fluxo_b[ano] -= 12000
    if ano % 6 == 0 and ano != 24:
        fluxo_b[ano] -= 120000
vpl_b = vpl_manual(tma, fluxo_b)

print(f"VPL Custo A: R$ {vpl_a:,.2f}")
print(f"VPL Custo B: R$ {vpl_b:,.2f}")
```]

O VPL do custo da alternativa A é de $-492.467,92$ e o da B é de $-435.372,55$. Portanto, a *Alternativa B é a mais econômica*.

== Questão 2

No Exercício anterior, considere que para o Tipo A os custos anuais de reparos sejam crescentes, sendo 800 no primeiro ano, e aumentando em 800 a cada ano. Qual seria o VPL da alternativa A, neste caso? Qual o projeto mais econômico?

Neste cenário, o custo de reparos da Alternativa A segue um gradiente aritmético. Mantemos o cálculo do VPL da Alternativa B e recalculamos o de A com o novo fluxo de custos.

#sourcecode[```python
vpl_b = -435372.55

# Alternativa A com gradiente
fluxo_a_grad = np.zeros(25)
fluxo_a_grad[0] = -300000
for ano in range(1, 25):
    fluxo_a_grad[ano] -= 800 + (ano - 1) * 800
    if ano % 8 == 0:
        fluxo_a_grad[ano] -= 150000

vpl_a_grad = vpl_manual(0.10, fluxo_a_grad)

print(f"VPL A (gradiente): R$ {vpl_a_grad:,.2f}")
print(f"VPL B (inalterado): R$ {vpl_b:,.2f}")
```]

Com os custos crescentes, o VPL da Alternativa A é de $-462.193,31$. A *Alternativa B ainda é a mais econômica*.

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

O projeto se justifica quando `VPL(Receitas) >= VPL(Custos)`. Para encontrar o fluxo mínimo, igualamos os VPLs (`VPL Total = 0`). Usamos uma função (`fsolve`) para encontrar a raiz da equação.

#sourcecode[```python
tma = 0.10
anos = 18

fluxo_custos = np.zeros(anos + 1)
fluxo_custos[0] = -60000
for ano in range(1, anos + 1):
    fluxo_custos[ano] = -(100000 * (1.03)**(ano-1))
vpl_custos = vpl_manual(tma, fluxo_custos)

def vpl_receitas(fluxo_inicial):
    fluxo_receitas = np.zeros(anos + 1)
    for ano in range(1, anos + 1):
        fluxo_receitas[ano] = (fluxo_inicial * (1.05)**(ano-1) * 100)
    return vpl_manual(tma, fluxo_receitas)

def equacao(x):
    return vpl_custos + vpl_receitas(x[0])

fluxo_minimo = fsolve(equacao, x0=[1000])[0]

print(f"VPL Custos: R$ {vpl_custos:,.2f}")
print(f"Fluxo mínimo de veículos no 1º ano: {fluxo_minimo:.0f}")
```]

O VPL dos custos é de $-1.051.146,36$. Para cobrir esses custos, o fluxo mínimo de veículos no primeiro ano deve ser de *927 veículos*.

== Questão 4

A companhia Beta está considerando dois planos alternativos para a construção de um muro. Uma cerca de arame custa $R\$35.000$ com manutenção de $R\$300$/ano. Um muro de concreto custa $R\$20.000$ com reparos de $R\$1.000$ a cada 5 anos e $R\$5.000$ a cada 10 anos. Vida útil de 25 anos e TMA de $10\% a.a.$. Qual a melhor opção?

Comparamos as alternativas calculando o VPL do custo de cada uma.

#sourcecode[```python
tma = 0.10
anos = 25

# Cerca de Arame
fluxo_arame = np.zeros(anos + 1)
fluxo_arame[0] = -35000
for ano in range(1, anos + 1):
    fluxo_arame[ano] = -300
vpl_arame = vpl_manual(tma, fluxo_arame)

# Muro de Concreto
fluxo_concreto = np.zeros(anos + 1)
fluxo_concreto[0] = -20000
for ano in range(1, anos + 1):
    if ano % 10 == 0: fluxo_concreto[ano] -= 5000
    elif ano % 5 == 0: fluxo_concreto[ano] -= 1000
vpl_concreto = vpl_manual(tma, fluxo_concreto)

print(f"VPL Cerca: R$ {vpl_arame:,.2f}")
print(f"VPL Muro: R$ {vpl_concreto:,.2f}")
```]
O VPL do custo da Cerca de Arame é de $-37.723,11$ e o do Muro de Concreto é de $-23.623,54$. A melhor opção é o *Muro de Concreto*.

== Questão 5

Um gerador custa $R\$30.000$, com manutenção de $R\$500$/ano. Gera $100.000 "kWh"$/ano, vendido a $R\$0,08/"kWh"$. Vida útil de 15 anos, valor residual de $R\$2.000$ e TMA de $9\%a.a.$. Calcule o Payback Descontado, VPL e TIR.

Calculamos o Payback Descontado iterando sobre os fluxos de caixa futuros descontados até que o investimento seja recuperado. VPL e TIR são calculados sobre o fluxo de caixa total do projeto.

#sourcecode[```python
tma = 0.09
anos = 15
investimento = 30000

fluxo_anual = (100000 * 0.08) - 500
fluxo = np.full(anos + 1, fluxo_anual)
fluxo[0] = -investimento
fluxo[anos] += 2000 # Residual

# Payback
acumulado = 0
for ano in range(1, anos + 1):
    vp = fluxo[ano] / (1 + tma)**ano
    if (acumulado + vp) < investimento:
        acumulado += vp
    else:
        payback = ano - 1 + (investimento - acumulado) / vp
        break

vpl = vpl_manual(tma, fluxo)
# tir = fsolve(...) # Opcional

print(f"Payback Descontado: {payback:.2f} anos")
print(f"VPL: R$ {vpl:,.2f}")
print(f"TIR: {tir*100:.2f}%")
```]

O retorno (Payback Descontado) ocorre em *5.19 anos*. O projeto é rentável, com *VPL de $R\$ 31.004,24$* e *TIR de $24,08\%$ a.a.*.

