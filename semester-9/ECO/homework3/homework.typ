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
  title: "Lista de Exercicios - Aula 5",
  subtitle: "Economia para a Engenharia",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "24 de Abril de 2025",
  doc,
)

= Introdução

= Questões

== Questão 1 

Uma aplicação financeira tem taxa de juro pré-fixada de 6% para o próximo período de 1 ano. Para utilizar a aplicação, é necessário pagar uma tarifa de adesão de 1% do valor aplicado, mais R\$4,90. Qual a taxa de juros real desta aplicação, para um investimento de R\$1.000?

- Taxa de juros de 6% ao ano. 

- Valor de investimento: R\$1.000,00

- Tarifa de adesão: R\$14,90
  - 1% do valor aplicado: R\$10,00
  - Tarifa fixa: R\$4,90

#sourcecode[```python
## QUESTÃO 1
# Variáveis da questão: 
V_investido = 1000
tarifa_fix = 4.9
tarifa_perc = 1 
juros_anual = 0.06

custo_adesao = tarifa_fix + (tarifa_perc / 100) * V_investido
print(f"Valor de adesão: {custo_adesao:.2f} reais")

# calculo do valor restante após retirada da taxa: 
V_aplicado = V_investido - custo_adesao
print(f"Valor restante após taxa de adesão: {V_aplicado:.2f} reais")

Valor_futuro = V_aplicado * (1 + juros_anual)
print(f"Valor futuro após 1 ano: {Valor_futuro:.2f} reais")

# calculo de rendimento: 
rendimento = Valor_futuro - V_investido
print(f"Rendimento após 1 ano: {rendimento:.2f} reais")


# Para calcular a taxa de juros real, utilizamos: 
juros_real = rendimento / V_investido
print(f"Taxa de juros real: {juros_real:.2%} reais")
```]

Resultado: 

#sourcecode[```text
Valor de adesão: 14.90 reais
Valor restante após taxa de adesão: 985.10 reais
Valor futuro após 1 ano: 1044.21 reais
Rendimento após 1 ano: 44.21 reais
Taxa de juros real: 4.42% reais
```]

== Questão 2 

Um investimento tem taxa de juro pré-fixada de 6,12% para o próximo período de 1 ano. A previsão da inflação para este período é de 7,5%. Calcular a taxa de juro real.

- Para resolver a questão, podemos aplicar a seguinte formula: 

$
 1 + j_"real" = (1 + j_"nominal") / (1 + i) 
$

#sourcecode[```python
## QUESTÃO 2
# Variáveis da questão:
juros_nominal = 0.062
inflacao = 0.075

# Calculando a taxa de juros real: 
juros_real = ((1 + juros_nominal) / (1 + inflacao)) - 1
print(f"Taxa de juros real: {juros_real:.2%}")
```]

Resultado: 

#sourcecode[```text
Taxa de juros real: -1.21%
```]

== Questão 3

Um investimento promete pagar, em um ano, R\$1.057,25 para um depósito inicial de R\$1 mil. A previsão da inflação para este período é de 8,5%. Calcular a taxa de juro prevista pelo investimento, e a taxa de juro real.

#sourcecode[```python
## QUESTÃO 3
# Variáveis da questão:
Valor_futuro = 1057.25
Valor_inicial = 1000
inflacao = 0.085

# Calculando a taxa de juros nominal: 
juros_nominal = (Valor_futuro - Valor_inicial) / Valor_inicial
print(f"Taxa de juros nominal: {juros_nominal:.2%}")

# Calculando a taxa de juros real: 
juros_real = ((1 + juros_nominal) / (1 + inflacao)) - 1 
print(f"Taxa de juros real: {juros_real:.2%}")
```]

Resultado: 

#sourcecode[```text
Taxa de juros nominal: 5.73%
Taxa de juros real: -2.56%
```]


== Questão 4

Uma mercadoria vale R\$100 no momento presente. Se a taxa de inflação média projetada para os próximos 6 meses é de 1,2%a.m., qual deverá ser o valor desta mercadoria após este período, se o seu preço fôr remarcado de acordo com esta previsão de inflação? 

#sourcecode[```python
## QUESTÃO 4
# Variáveis da questão:
valor_presente = 100
inflacao_mes = 0.012 
n_periodos = 6

# caluculando o valor futuro com juros compostos: 
Valor_futuro = valor_presente * (1 + inflacao_mes) ** n_periodos
print(f"Valor futuro: {Valor_futuro:.2f} reais")
```]

Resultado: 

#sourcecode[```text
Valor futuro: 107.42 reais
```]

== Questão 5

Um comerciante compra um produto e o coloca à venda aplicando 30% sobre o preço de custo. Depois, ele o anuncia com desconto de 10% para pagamento à vista. Determine a porcentagem de lucro que o comerciante está obtendo na venda à vista desse produto.

#sourcecode[```python
## QUESTÃO 5
# Variáveis da questão:
preco_custo = 100 
margem_lucro = 0.30
desconto_vista = 0.10

# calculando preço de venda:
preco_venda = preco_custo * (1 + margem_lucro)
print(f"Preço de venda: {preco_venda:.2f} reais")

# calculando preço a vista: 
preco_vista = preco_venda * (1 - desconto_vista)
print(f"Preço a vista: {preco_vista:.2f} reais")

# calculando percentual de lucro: 
percentual_lucro = (preco_vista - preco_custo) / preco_custo
print(f"Percentual de lucro: {percentual_lucro:.2%}")
```]

Resultado: 

#sourcecode[```text
Preço de venda: 130.00 reais
Preço a vista: 117.00 reais
Percentual de lucro: 17.00%
```]

== Questão 6

Um produto cujo preço era R\$220 teve dois aumentos sucessivos de 15% e 20%, Respectivamente. Em seguida, o valor resultante teve um desconto percentual igual a x, apresentando um preço final y. 


#sourcecode[```python
## QUESTÃO 6
# Variáveis da questão:
preco_inicial = 220 
primeiro_aumento = 0.15
segundo_aumento = 0.20

# calculando o preço após o primeiro aumento:
preco_1 = preco_inicial * (1 + primeiro_aumento)
print(f"Preço após o primeiro aumento: {preco_1:.2f} reais")

# calculando o preço após o segundo aumento:
preco_2 = preco_1 * (1 + segundo_aumento)
print(f"Preço após o segundo aumento: {preco_2:.2f} reais")
```]

Resultado: 

#sourcecode[```text
Preço após o primeiro aumento: 253.00 reais
Preço após o segundo aumento: 303.60 reais
```]

Com base no preço obtido após o segundo aumento, chegamos na seguinte expressão: 

$
  y = (303,60) . (1 - x/100)
$

=== Calcule y se x = 10%

#sourcecode[```python
## QUESTÃO 6a

x = 0.10

# calculo dando desconto de 10% no preço final:
preco_final = preco_2 * (1 - x)
print(f"Preço final com desconto de 10%: {preco_final:.2f} reais")
```]

Resultado:
#sourcecode[```text
Preço final com desconto de 10%: 273.24 reais
```]

=== Calcule o valor máximo de x para que y não seja inferior ao preço original

Reajandando a expressão, temos:

$
  y = (303,60) . (1 - x/100) -> y / (303,60) = 1 - x/100 -> y / (303,60) - 1 = - x/100
$
Portanto ficamos com a seguinte expressão
$
x = (1 - y / (303,60)) . 100
$

#sourcecode[```python
## QUESTÃO 6b

# calculando o valor maximo de x para que o preço final seja maior que o preço inicial:
x_max = (1 - (preco_inicial / preco_2)) * 100
print(f"Valor máximo de x: {x_max:.2f} %")
```]

Resultado:
#sourcecode[```text
Valor máximo de x: 27.54 %
```]

== Questão 7 

Um investimento promete pagar a taxa de variação do dólar mais uma taxa de juro pré-fixada de 5,0% para o próximo período de 1 ano. A cotação do dólar, no dia inicial da aplicação, era de R\$5,12/US\$, e no dia do vencimento, era de R\$4,97/US\$. Calcular o ganho real deste investimento.

#sourcecode[```python
## QUESTÃO 7
# Variáveis da questão:
valor_inicial = 5.12
valor_final = 4.97
investimento = 5.0

# calculando a variaçao do dolar em %
variacao = ((valor_final - valor_inicial) / valor_inicial) * 100
print(f"Variação do dolar: {variacao:.2f} %")

# calculando o ganho de investimento: 
ganho_investimento = variacao + investimento
print(f"Ganho de investimento: {ganho_investimento:.2f} %")
```]

Resultado:

#sourcecode[```text
Variação do dólar: -2.93 %
Ganho de investimento: 2.07 %
```]


== Questão 8 

Um investimento promete pagar juros de 0,5%a.m.. Se fôr feito um investimento de R\$5.000, e este investimento fôr resgatado 7 meses após, qual será o valor total resgatado? Qual será o valor dos juros? 
 
#sourcecode[```python
## QUESTÃO 8
# Variáveis da questão:
valor_inicial = 5000
taxa_juros = 0.005
n_periodos = 7

# calculando o valor futuro com juros compostos:
valor_futuro = valor_inicial * (1 + taxa_juros) ** n_periodos
print(f"Valor futuro: {valor_futuro:.2f} reais")

# calculando o rendimento dos juros:
rendimento = valor_futuro - valor_inicial
print(f"Rendimento: {rendimento:.2f} reais")
```]

Resultado:

#sourcecode[```text
Valor futuro: 5177.65 reais
Rendimento: 177.65 reais
```]

== Questão 9

A remuneração de um título do tesouro é pré-fixada em 9,25%a.a.. Se fôr feito um investimento de R\$2.500, mas fôr necessário resgatar este investimento 9 meses após, qual será o valor total resgatado? Qual será o valor dos juros? 

#sourcecode[```python
## QUESTÃO 9
# Variáveis da questão:
valor_inicial = 2500
taxa_juros = 0.0925 # juros ao ano
n_periodos = 9/12 # 9 meses

# calculando o valor futuro com juros compostos:
valor_futuro = valor_inicial * (1 + taxa_juros) ** n_periodos
print(f"Valor futuro: {valor_futuro:.2f} reais")

# calculando o rendimento dos juros:
rendimento = valor_futuro - valor_inicial
print(f"Rendimento: {rendimento:.2f} reais")
```]

Resultado:

#sourcecode[```text
Valor futuro: 5177.65 reais
Rendimento: 177.65 reais
```]

== Questão 10

Na questão anterior, sabendo-se que o imposto de renda para este tipo de aplicação é de 15%, qual será o valor líquido obtido? qual seria, então, a taxa real (ou seja, o retorno efetivamente obtido pelo investidor)? 

#sourcecode[```python
## QUESTÃO 10
# Variáveis da questão:
imposto_renda = 0.15

# calculando o rendimento liquido:
rendimento_imposto = rendimento * (imposto_renda)
print(f"Valor do imposto de renda: {rendimento_imposto:.2f} reais")

rendimento_restante = rendimento - rendimento_imposto
print(f"Rendimento restante: {rendimento_restante:.2f} reais")

# calculando o valor resgatado: 
valor_resgatado = valor_futuro - rendimento_imposto
print(f"Valor resgatado: {valor_resgatado:.2f} reais")

# calculando o retorno (taxa real): 
retorno = (valor_resgatado - valor_inicial) / valor_inicial
print(f"Retorno: {retorno:.2%} reais")
```]

Resultado:

#sourcecode[```text
Valor do imposto de renda: 25.73 reais
Rendimento restante: 145.78 reais
Valor resgatado: 2645.78 reais
Retorno: 5.83% reais
```]


== Questão 11

Considerando ainda as questões [9] e [10], sabendo-se que a inflação no período foi de 3,5%, qual a taxa real resultante? 

#sourcecode[```python
## QUESTÃO 11
# Variáveis da questão:
inflacao = 0.035

# calculando o valor futuro com juros compostos:
taxa_real = ((1 + retorno) / (1 + inflacao)) - 1
print(f"Taxa real: {taxa_real:.2%} reais")
```]

Resultado:

#sourcecode[```text
Taxa real: 2.25% reais
```]