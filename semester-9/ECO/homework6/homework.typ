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
  title: "Lista de Exercicios - Aula 10",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "20 de Junho de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

Um empréstimo é concedido mediante o fluxo de pagamentos apresentado na figura. Monte o fluxo de caixa simples e o fluxo de caixa descontado, considerando uma taxa de $1\% a.m$. Determinar o "payback time" simples e o pay-back descontado.

#figure(
  figure(
    rect(image("./pictures/q1.png", width: 100%)),
    numbering: none,
    caption: [Fluxo de Pagamentos do Empréstimo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Analisando a imagem temos: 

- Mês 0: -100 (Saída)
- Mês 1: +40 (Entrada)
- Mês 2: +50 (Entrada)
- Mês 3: +60 (Entrada)

Para resolver a questão, utilizamos a formula do valor presente (VP) para calcular o fluxo de caixa descontado:

$
  V_P = (F_V) / (1 + i)^n
$

Onde: 

-  $V_P$ é o valor presente,
-  $F_V$ é o valor futuro,
-  $i$ é a taxa de juros,
-  $n$ é o número de períodos.

O calculo do payback time simples é feito somando os fluxos de caixa até que o valor acumulado se torne positivo. Como apresentado abaixo: 

- Mês 0: -100 (Saída)
- Mês 1: (-100 + 40): -60 (Acumulado)
- Mês 2: (-100 + 40 + 50): -10 (Acumulado)
- Mês 3: (-100 + 40 + 50 + 60): +50 (Acumulado)

Já o payback time descontado é calculado da seguinte forma:

- Mês 0: -100 (Saída)
- Mês 1: $40 / (1 + 0.01)^1 = 39.60$ (Entrada descontada)
- Mês 2: $50 / (1 + 0.01)^2 = 49.01$ (Entrada descontada)
- Mês 3: $60 / (1 + 0.01)^3 = 58.14$ (Entrada descontada)


Assim, o fluxo de caixa descontado fica:

#sourcecode[```python
# Taxa de desconto
taxa = 0.01

# Fluxo de caixa simples
fluxo = [-100, 40, 50, 60]

# Fluxo de caixa descontado
fluxo_descontado = [fluxo[0]] 
for t in range(1, len(fluxo)):
    vp = fluxo[t] / ((1 + taxa) ** t)
    fluxo_descontado.append(vp)

# Payback simples
acumulado = 0
for i, valor in enumerate(fluxo[1:], start=1):
    acumulado += valor
    if acumulado >= -fluxo[0]:
        excesso = acumulado - (-fluxo[0])
        payback_simples = i - excesso / valor
        break

# Payback descontado
acumulado_desc = 0
for i, valor in enumerate(fluxo_descontado[1:], start=1):
    acumulado_desc += valor
    if acumulado_desc >= -fluxo_descontado[0]:
        excesso = acumulado_desc - (-fluxo_descontado[0])
        payback_descontado = i - excesso / valor
        break

# Resultados
print("Fluxo de Caixa Simples:", fluxo)
print("Fluxo de Caixa Descontado:", [round(v, 2) for v in fluxo_descontado])
print(f"Payback Simples: {payback_simples:.2f} meses")
print(f"Payback Descontado: {payback_descontado:.2f} meses")
```]

Dessa forma: 

#sourcecode[```text
Fluxo de Caixa Simples: [-100, 40, 50, 60]
Fluxo de Caixa Descontado: [-100, 39.6, 49.01, 58.24]
Payback Simples: 2.17 meses
Payback Descontado: 2.20 meses
```]

Assim, temos que o payback simples é de aproximadamente 2.17 meses e o payback descontado é de aproximadamente 2.20 meses.

== Questão 2

Uma loja de eletrodomésticos necessita ampliar as instalações no valor de $\$500.000$. Isto permitirá um aumento de lucro nas vendas estimado em $\$125.000,00$ a cada ano. Considerando que a TMA da empresa é de 10% a.a., em quanto tempo a loja terá um retorno sobre o investimento?


Para calcular o payback simples, utilizamos a seguinte fórmula:

$
  "Pb"_"s" = "Investido" / "Lucro"_"Anual" -> "Pb"_"s" = 500.000 / 125.000 = 4 "anos"
$

Já para o  payback descontado, utilizamos a fórmula do valor presente (VP) para calcular o fluxo de caixa descontado:

$
   V_P = (F_V) / (1 + i)^n ->  V_P = 125.000 / (1 + 0.10)^n
$

Assim, calculando o payback, temos:

#sourcecode[```python
investimento = 500_000
lucro_anual = 125_000
tma = 0.10  # 10% a.a.

# Cálculo do payback descontado
acumulado = 0
ano = 0

while acumulado < investimento:
    ano += 1
    vp = lucro_anual / ((1 + tma) ** ano)
    acumulado += vp

# Interpolação para o valor exato
excesso = acumulado - investimento
payback_descontado = ano - excesso / vp

print(f"Payback simples: {investimento / lucro_anual:.2f} anos")
print(f"Payback descontado: {payback_descontado:.2f} anos")
```]

Dessa forma, temos:

#sourcecode[```text
Payback simples: 4.00 anos
Payback descontado: 5.37 anos
```]

Dessa forma, temos que o payback simples é de 4 anos e o payback descontado é de aproximadamente 5.37 anos.

== Questão 3 

Na sua empresa, uma determinada máquina realiza a produção de 200 peças/hora. Este lote de peças é vendido com lucro líquido de $R\$50$. Este lucro pode ser aumentado para $R\$52$, caso se invista em capacitores para melhorar o FP (fator de potência) atual da máquina, de forma que não se pague mais multas por este item, como está acontecendo atualmente (ou seja, $R\$2$ do custo de produção equivale à multa por baixo fator de potência). O custo da instalação dos capacitores é de $R\$10.000$, que será pago em 10 prestações com juros de $2,9\% a.m.$. A empresa tem 2 turnos diários de produção (16h/dia), operando 22 dias por mês. Determine o  tempo de payback descontado do investimento nos capacitores. Utilizar como referência uma taxa de juros de $2\% a.m$.

Para resolver essa questão, precisamos primeiro calcular o tempo de operação mensal da máquina e o lucro adicional gerado pela melhoria do fator de potência: 

$
  "Tempo Op. Mensal" = 16 .  22 = 352 "horas"
$

Assim, calculando a quantidade de peças produzidas mensalmente:

$
  "Peças Mensais" = 200 . 352 = 70.400 "peças"
$



Agora, pode-se calcular o lucro por peça, considerando que cada capacitor tem um lucro adicional de $R\$2$ por peça:

$
  "Lucro Mensal" = 70.400 . (52 - 50) = R\$140.800
$

Assim, podemos calcular o payback descontado do investimento nos capacitores. O custo total do investimento é de $R\$10.000$, que será pago em 10 prestações mensais com juros de $2,9\% a.m.$.

$
  "PMT" = P_V . (i(1+ i)^n)/((1 + i)^n - 1)
$

Onde: 

-  $P_V$ é o valor presente (custo do investimento),
-  $i$ é a taxa de juros,
-  $n$ é o número de períodos (neste caso, meses).
-  $"PMT"$ é o valor da prestação mensal.


#sourcecode[```python
# Dados do problema
investimento_inicial = -10_000  # saída de caixa no tempo 0
juros_parcela = 0.029
n_parcelas = 10

# Cálculo da parcela mensal com juros
pmt = -investimento_inicial * (juros_parcela * (1 + juros_parcela) ** n_parcelas) / ((1 + juros_parcela) ** n_parcelas - 1)

# Produção mensal e ganho
pecas_mes = 200 * 16 * 22
ganho_unitario = 2
ganho_mensal = pecas_mes * ganho_unitario  # 140800

# Fluxo líquido mensal (após pagar parcela)
fluxo_liquido = ganho_mensal - pmt

# Construção do fluxo de caixa: saída no tempo 0, depois fluxos líquidos
fluxo = [investimento_inicial] + [fluxo_liquido] * n_parcelas

# Taxa mínima de atratividade
tma = 0.02

# Cálculo do fluxo descontado
fluxo_descontado = [fluxo[0]]
for t in range(1, len(fluxo)):
    vp = fluxo[t] / ((1 + tma) ** t)
    fluxo_descontado.append(vp)

# Cálculo do payback descontado
acumulado = 0
payback = None
for i, v in enumerate(fluxo_descontado):
    acumulado += v
    if acumulado >= 0:
        excesso = acumulado - 0
        payback = i - excesso / v
        break

# Resultados
print(f"Ganho mensal adicional: R${ganho_mensal:,.2f}")
print(f"Valor da parcela: R${pmt:,.2f}")
print(f"Fluxo líquido mensal: R${fluxo_liquido:,.2f}")
print(f"Payback descontado: {payback:.2f} meses")
```]

Dessa forma, temos:

#sourcecode[```text
Ganho mensal adicional: R$140,800.00
Valor da parcela: R$1,166.33
Fluxo líquido mensal: R$139,633.67
Payback descontado: 0.07 meses
```]

Assim, o payback descontado do investimento nos capacitores é de aproximadamente 0.07 meses, ou seja, menos de um mês.

== Questão 4

Pretende-se investir $R\$12.000$ na implantação de uma mini-usina de geração fotovoltaica residencial. A economia na tarifa de energia elétrica mensal é estimada em $R\$300$. Determine o tempo de payback simples e descontado. Utilizar como referência uma taxa de juros de
$13,75\% a.a$.


Para calcular o payback simples, utilizamos a seguinte fórmula:

$
  "Pb"_"s" = "Investido" / "Economia Mensal" -> "Pb"_"s" = 12.000 / 300 = 40 "meses"
$

Já para o payback descontado, utilizamos a fórmula do valor presente (VP) para calcular o fluxo de caixa descontado:

$
  V_P = (F_V) / (1 + i)^n
$

Assim, calculando o payback, temos:

#sourcecode[```python
# Dados base
investimento = 12000
economia_anual = 300 * 12  # R$3.600
tma = 0.1375  # taxa anual de desconto
anos_max = 50  # limite para simulação

# Payback simples
payback_simples = investimento / economia_anual

# Payback descontado
fluxo = []
for t in range(1, anos_max + 1):
    vp = economia_anual / ((1 + tma) ** t)
    fluxo.append(vp)

acumulado = 0
for i, v in enumerate(fluxo):
    acumulado += v
    if acumulado >= investimento:
        excesso = acumulado - investimento
        payback_desc = (i + 1) - excesso / v
        break

print(f"Payback simples: {payback_simples:.2f} anos")
print(f"Payback descontado: {payback_desc:.2f} anos")
```]

Dessa forma, temos:
#sourcecode[```text
Payback simples: 3.33 anos
Payback descontado: 4.77 anos
```]

Assim, o payback simples é de aproximadamente 3.33 anos e o payback descontado é de aproximadamente 4.77 anos. Em seguida, avalie o efeito dos seguintes eventos adicionais:

=== (a)

Um gasto anual de $R\$700$ com manutenção (limpeza dos painéis): 

Para considerar o gasto anual de $R\$700$ com manutenção, precisamos ajustar a economia anual. A economia líquida anual passa a ser:

$
  "Economia Anual" = "Economia Anual" - "Gasto Anual"  =  3.600 - 700 = 2.900 
$

Ajustando o valor de economia para $2.900$, temos, o simples e descontado atualizados:

#sourcecode[```text
Payback simples: 4.14 anos
Payback descontado: 6.55 anos
```]

=== (b) 

Um reajuste anual esperado de $7\%$ na tarifa de energia elétrica: 

Nota: Neste ponto utilizei novamente o valor de $3.600$,  mas com o reajuste de $7\%$ ao ano, o valor passa a ser:

#sourcecode[```python
# Dados base
investimento = 12000
economia_anual = 3600
tma = 0.1375  # taxa anual de desconto
anos_max = 50  # limite para simulação

# Payback simples
payback_simples = investimento / economia_anual

# Payback descontado
fluxo = []
for t in range(1, anos_max + 1):
    vp = economia_anual / ((1 + tma) ** t)
    fluxo.append(vp)

acumulado = 0
for i, v in enumerate(fluxo):
    acumulado += v
    if acumulado >= investimento:
        excesso = acumulado - investimento
        payback_desc = (i + 1.07) - excesso / v
        break

print(f"Payback simples: {payback_simples:.2f} anos")
print(f"Payback descontado: {payback_desc:.2f} anos")
```]

Assim: 

#sourcecode[```text
Payback simples: 3.33 anos
Payback descontado: 4.84 anos
```]
