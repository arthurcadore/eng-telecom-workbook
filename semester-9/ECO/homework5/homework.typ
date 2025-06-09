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
  title: "Lista de Exercicios - Aula 7",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "19 de Maio de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1

Um imóvel cujo valor à vista é R\$100.000 será financiado a uma taxa de 0,85% ao mês, em 60 meses. Qual será o valor da prestação mensal? 

Para resolver essa questão, utilizaremos a fórmula da prestação mensal do financiamento pelo sistema PRICE:

$
  P = P_V . (i (1 + i)^n) / ((1 + i)^n - 1)
$

Onde: 

- $P$: é o valor da prestação mensal
- $P_V$: é o valor presente (valor do imóvel)
- $i$: é a taxa de juros mensal (0,85% = 0,0085)
- $n$: é o número de parcelas (60 meses)

Substituindo os valores na fórmula:

$
  P = 100000 . (0,0085 (1 + 0,0085)^{60}) / ((1 + 0,0085)^{60} - 1) -> P = 100000 . (0,002183)
$

Script para resolver a equação:

#sourcecode[```python
# Dados do problema
PV1 = 100000
i1 = 0.0085
n1 = 60

# Cálculo da prestação mensal usando a fórmula do sistema PRICE
P1 = PV1 * (i1 * pow(1 + i1, n1)) / (pow(1 + i1, n1) - 1)

print(f"Prestação mensal (PRICE): R$ {P1:.2f}")
```]

Dessa forma, o valor da prestação mensal será aproximadamente $R\$2134,00.$

== Questão 2 

Um certo valor foi financiado em 6 prestações mensais e consecutivas de \$1.000,00. Se a taxa de juros (compostos) é de 1% a.m., qual o valor do empréstimo?

Para calcular o valor do empréstimo financiado, utilizaremos a fórmula do valor presente de uma série de pagamentos (anuidade):

$
  P_V = P . (1 - (1 + i)^(-n)) / i
$

Onde: 

- $P_V$: é o valor presente (valor do empréstimo)
- $P$: é o valor da prestação mensal (\$1.000,00)
- $i$: é a taxa de juros mensal (1% = 0,01)
- $n$: é o número de parcelas (6 meses)

Substituindo os valores na fórmula:

$
  P_V = 1000 . (1 - (1 + 0,01)^{-6}) / (0,01) -> P_V = 1000 . (5,852) = 5.795,00
$

Script para resolver a equação:

#sourcecode[```python
# Dados do problema
P2 = 1000
i2 = 0.01
n2 = 6

# Cálculo do valor presente usando a fórmula do valor presente de uma anuidade
PV2 = P2 * (1 - pow(1 + i2, -n2)) / i2

print(f"Valor presente (empréstimo): R$ {PV2:.2f}")
```]

Dessa forma, o valor do empréstimo financiado será aproximadamente $R\$5.795,00.$

== Questão 3

Quanto será necessário poupar mensalmente, durante 35 anos, aplicados a uma taxa de 2,75% a.a., para se acumular o valor de R\$ 1 milhão?

Para calcular o valor que deve ser poupado mensalmente, utilizaremos a fórmula do valor futuro de uma série de pagamentos (anuidade):

$
  V_F = P . ((1 + i)^n - 1) / i
$

Onde:

- $V_F$: é o valor futuro (R\$1.000.000,00)
- $P$: é o valor da poupança mensal
- $i$: é a taxa de juros mensal (2,75% a.a. = 0,00229167 a.m.)
- $n$: é o número de meses (35 anos = 420 meses)

Substituindo os valores na fórmula e isolando $P$:

$
  P = (V_F . i) / ((1 + i)^n - 1) -> P = (1000000 . 0,00229167) / ((1 + 0,00229167)^(420) - 1)
$

Resolvendo temos: 

$
  P = (1000000 . 0,00229167) / ((1 + 0,00229167)^(420) - 1) = 2292 / (1,60844) = 1418,68
$

Script para resolver a equação:

#sourcecode[```python
# Dados do problema
VF3 = 1000000
i3 = 0.0275 / 12
n3 = 35 * 12

# Cálculo do valor da poupança mensal usando a fórmula do valor futuro de uma anuidade
P3 = (VF3 * i3) / (pow(1 + i3, n3) - 1)

print(f"Poupança mensal necessária: R$ {P3:.2f}")
```]


Dessa forma, o valor que deve ser poupado mensalmente será aproximadamente $R\$1.418,68.$

== Questão 4

O preço de um automóvel à vista é R\$50.000. Para financiá-lo, é necessário dar uma entrada de 25%, e o restante será quitado em 48 parcelas de R\$ 999,00. Qual a taxa de juros embutida neste financiamento? 

Para encontrar a taxa de juros embutida no financiamento, utilizaremos a fórmula do valor presente de uma série de pagamentos (anuidade):

$
  P_V = P . (1 - (1 + i)^(-n)) / i
$

Onde:

- $P_V$: é o valor presente (valor financiado)
- $P$: é o valor da prestação mensal (R\$999,00)
- $i$: é a taxa de juros mensal (desconhecida)
- $n$: é o número de parcelas (48 meses)
- Calculando valor presente do financiamento: $ 50000 - (50000 * 0,25) = 37500$

Porem, como desejamos encontrar a taxa de juros $i$, precisamos rearranjar a fórmula e utilizar métodos numéricos ou uma calculadora financeira para resolver a equação. Abaixo uma célula python para calcular a taxa de juros:

#sourcecode[```python
from scipy.optimize import newton

# Dados do problema
PV = 37500  # valor financiado (75% de 50.000)
PMT = 999   # valor da parcela
n = 48      # número de parcelas

# Função para calcular o valor presente de uma anuidade com taxa i
def f(i):
    return PMT * (1 - (1 + i)**-n) / i - PV

# Estimativa inicial (1% ao mês)
i_inicial = 0.01

# Calcular a taxa de juros usando o método de Newton-Raphson
taxa_juros_mensal = newton(f, i_inicial)

# Converter para percentual
taxa_percentual = taxa_juros_mensal * 100

print(f"Taxa de juros mensal aproximada: {taxa_percentual:.4f}%")
```]

Dessa forma, a taxa de juros mensal aproximada é de: 1.0518%

== Questão 5 

Pretende-se realizar uma viagem 2 anos após a data presente. O valor da viagem deverá ser de aproximadamente R\$30.000. Pretende-se realizar depósitos mensais regulares em um fundo de investimento cuja taxa de remuneração é de 7% a.a. Quanto deverá ser o valor mensal a ser depositado? 

Para calcular o valor mensal a ser depositado, utilizaremos a fórmula do valor futuro de uma série de pagamentos (anuidade):

$
  V_F = P . ((1 + i)^n - 1) / i ->   P = V_F . i / ((1 + i)^n - 1)
$

Onde: 

- $V_F$: é o valor futuro (R\$30.000,00)
- $P$: é o valor do depósito mensal
- $i$: é a taxa de juros mensal (7% a.a. = 0,0058333 a.m.)
- $n$: é o número de meses (2 anos = 24 meses)

Substituindo os valores na fórmula e isolando $P$:

$
  P = (30000 . 0,0058333) / ((1 + 0,0058333)^(24) - 1) = (174,99) / (0,148882) = 1168,18
$

Dessa forma, o valor que deve ser depositado mensalmente será aproximadamente $R\$1168,18.$

== Questão 6

O preço de um automóvel é R\$50.000. O vendedor sugere 2 opções de financiamento: 

- 1: Entrada de 25% + 48 parcelas de R\$ 987,52
- 2: Entrada de 50% + 24 parcelas de R\$1.173,34.

Qual a opção mais vantajosa? Ou seria ainda mais vantajoso comprar à vista, sem desconto? 

=== Opção 1

- Entrada de 25% = $(R\$50.000) . 25% = R\$12.500$

- Financiado: $R\$37.500$

- Parcelas: $48 . (R\$987,52) = R\$47.400,96$

- Total pago = entrada + parcelas = $R\$12.500 + R\$47.400,96 = R\$59.900,96$

=== Opção 2

- Entrada de 50% = $(R\$50.000) . 50% = R\$25.000$

- Financiado: $R\$25.000$

- Parcelas: $24 . (R\$1.173,34) = R\$28.160,16$

- Total pago = entrada + parcelas = $R\$25.000 + R\$28.160,16 = R\$53.160,16$


*Portanto, a melhor opção é comprar à vista*, pois o valor total pago seria de R\$50.000,00, enquanto a opção 1 resultaria em R\$59.900,96 e a opção 2 em R\$53.160,16.

== Questão 7
O financiamento de um imóvel no valor de \$200.000 será feito em 120 parcelas mensais, com taxa de 1% a.m. Compare os valores da primeira prestação, da amortização e dos juros pelo sistema SAC e pelo sistema PRICE. 

=== Sistema SAC

Para resolver essa questão, utilizaremos as fórmulas do Sistema de Amortização Constante (SAC):

$
  A = P_V / n -> A = 200000 / 120 = 1666,67
$

Calculando a primeira prestação, os juros e a amortização:

$
  J_1 = P_V . i -> J_1 = 200000 . 0,01 = 2000
$

A primeira prestação será:

$
  P_1 = A + J_1 -> P_1 = 1666,67 + 2000 = 3666,67
$

=== Sistema PRICE

Para o Sistema PRICE, utilizamos a fórmula da prestação mensal:

$
  P = P_V . (i (1 + i)^n) / ((1 + i)^n - 1) -> P = 200000 . (0,01 (1 + 0,01)^(120)) / ((1 + 0,01)^(120) - 1) 
$

$
  P = 200000 . (0,01 (1 + 0,01)^(120)) / ((1 + 0,01)^(120) - 1)  -> 200000 . (0,0330039) / (2,30039) = 2870,46
$


== Questão 8

Um equipamento no valor de \$40.000 deve ser financiado em 6 meses. Se o financiamento for feito pelo sistema SAC, a taxa de juros será de 2,25% a.m., e pelo sistema PRICE a taxa de juros será de 2,22% a.m. Qual a opção mais vantajosa?

Para resolver essa questão, vamos calcular as prestações mensais, amortizações e juros para ambos os sistemas de amortização, abaixo está uma célula Python que calcula os valores necessários:

#sourcecode[```python
# Dados para SAC
sac_amort = 40000 / 6
sac_juros = [40000 * 0.0225, 33333.33 * 0.0225, 26666.67 * 0.0225, 
             20000 * 0.0225, 13333.33 * 0.0225, 6666.67 * 0.0225]
sac_prest = [sac_amort + j for j in sac_juros]
sac_data = {
    'Parcela': list(range(1, 7)),
    'Saldo Devedor': [40000, 33333.33, 26666.67, 20000, 13333.33, 6666.67],
    'Juros': sac_juros,
    'Prestação': sac_prest
}
df_sac = pd.DataFrame(sac_data)

# Dados para PRICE
# Cálculo da prestação
i = 0.0222
n = 6
PV = 40000
fator = (i * (1 + i)**n) / ((1 + i)**n - 1)
pmt_price = PV * fator
price_data = {
    'Parcela': list(range(1, 7)),
    'Prestação': [round(pmt_price, 2)] * 6
}
df_price = pd.DataFrame(price_data)

```]  

A célula acima calcula as prestações mensais, amortizações e juros para ambos os sistemas de amortização, retornando dois DataFrames: `df_sac` para o sistema SAC e `df_price` para o sistema PRICE: 

#figure(
  figure(
    rect(image("./pictures/image.png", width: 100%)),
    numbering: none,
    caption: [Calculo do financiamento do equipamento],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Com base nisso, o sistema SAC é mais vantajoso, pois o total pago é menor do que pelo sistema PRICE:

#sourcecode[```text
| Sistema   | Total Pago   | Prestação Inicial | Conclusão   |
| --------- | ------------ | ----------------- | ----------- |
| **SAC**   | R\$43.150,00 | R\$7.566,67       | Mais barato |
| **PRICE** | R\$43.488,00 | R\$7.248,00       | Mais caro   |

```]


== Questão 9

Um imóvel no valor de R\$1 milhão pode ser financiado pelo sistema SAC, em 120 meses, com taxa de juros de 1%a.m. Se, ao invés de financiá-lo, eu alugá-lo, e aplicar a diferença de valor entre o valor da prestação e o valor do aluguel em um investimento com a mesma taxa de juros de 1,0%a.m., em quanto tempo eu conseguiria comprar o imóvel? Considere que o valor do aluguel é de 0,75% do valor do imóvel.

Para resolver essa questão, vamos calcular o valor da prestação mensal do financiamento pelo sistema SAC e o valor do aluguel mensal. Em seguida, calcularemos a diferença entre esses valores e aplicaremos essa diferença em um investimento com a mesma taxa de juros de 1% a.m. para determinar em quanto tempo seria possível acumular o valor do imóvel: 

#sourcecode[```python
PV = 1_000_000
n = 120
i = 0.01
aluguel = PV * 0.0075
amort = PV / n

saldo = PV
acumulado = 0
meses = 0

while acumulado < PV:
    juros = saldo * i
    prestacao = amort + juros
    diferenca = prestacao - aluguel
    
    # Investir a diferença e acumular com rendimento mensal
    acumulado = acumulado * (1 + i) + diferenca
    
    saldo -= amort
    meses += 1

print(f"Tempo para acumular o valor do imóvel: {meses} meses (~{meses//12} anos e {meses%12} meses)")
```]

Dessa forma, o tempo para acumular o valor do imóvel: 83 meses (aprox. 6 anos e 11 meses)

== Questão 10

Quanto será necessário investir mensalmente, durante 35 anos aplicados a uma taxa pósfixada de IPCA+2,75%a.a., para se acumular o valor de R\$ 1 milhão? 

Para resolver essa questão, utilizaremos a fórmula do valor futuro de uma série de pagamentos (anuidade):

$
  V_F = P . ((1 + i)^n - 1) / i ->   P = V_F . i / ((1 + i)^n - 1)
$

Devemos converter o IPCA+2,75% a.a. para uma taxa mensal. Considerando que o IPCA é de 6% a.a., a taxa total seria de 8,75% a.a. (6% + 2,75%). Convertendo para mensal:

$
  i_m = (1 + 0,0875)^(1/12) - 1 approx 0,0071
$

Substituindo os valores na fórmula e isolando $P$:

$
  P = (1000000 . 0,0071) / ((1 + 0,0071)^{420} - 1) = (7100) / (9,646) = 902,55
$

Dessa forma, o valor que deve ser investido mensalmente será aproximadamente R\$902,55.