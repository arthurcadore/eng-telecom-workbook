#import math:*
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
  title: "Exercicios Avaliativos M/M/1 e M/M/c",
  subtitle: "Avaliação de Desempenho de Sistemas",
  authors: ("Arthur Cadore Matuella Barcella","Deivid Fortunato Frederico"),
  date: "3 de Junho de 2025",
  doc,
)


= Introdução: 

= Questão Manualmente: 

Um servidor de autenticacão central possui um processador que consegue atender em média 120 requisicões por minuto. Durante horários de pico, ele recebe em média 100 requisições por minuto. Pergunta-se: *em termos de tempo de espera médio no sistema e na fila, seria melhor manter esta configuração* ? Ou: 

- Caso 1: Dividir as requisições entre quatro servidores (cada um com 25 requisições por minuto) e com capacidade de processar 35 requisições por minuto cada um. 

- Caso 2: Usar um servidor com quatro processadores e uma fila única (cada um com capacidade de 35 requisições por minuto). 

Mostrar o cálculo do tempo de resposta total e dos tempos na fila e no atendimento. Mostrar também a utilização do sisteme. Construir uma tabela com estes tempos. Fazer uma conclusão.

Variáveis da questão: 

- $lambda = 100$ requisições por minuto (taxa de chegada)
- $mu = 120$ requisições por minuto (taxa de serviço do servidor único)
- $c = 1$ (número de servidores no primeiro caso)
- $c = 4$ (número de servidores no segundo caso)
- $mu_c = 35$ requisições por minuto (taxa de serviço de cada servidor no segundo caso)
- $mu_p = 35$ requisições por minuto (taxa de serviço de cada processador no terceiro caso)

== Calculo do melhor caso:

Inicialmente, vamos calcular os parâmetros do sistema para o primeiro caso, onde temos um único servidor com capacidade de atender 120 requisições por minuto.

$
  E[R] = 1 / (mu - lambda) = 1 / (120 - 100) = 1 / 20 = 0.05 "min" = 3 "s"
$

Já no segundo caso, onde temos quatro servidores com capacidade de atender 35 requisições por minuto cada, a taxa de serviço total é:

$
  E[R] = 1 / (c . mu_c - lambda) = 1 / (35 - 25) = 1 / 10 = 0.1 "min" = 6 "s"
$

JÁ no terceiro caso, onde temos um servidor com quatro processadores, a taxa de serviço total é:

$
  E[R] = 1 / (c . mu_c - lambda) = 1 / (4 . 35 - 100) = 1 / (140 - 100) = 1 / 40 = 0.025 "min" = 1.5 "s"
$

Portanto, o tempo de resposta menor é de 0.025 minutos, ou 1.5 segundos, que ocorre no terceiro caso, onde temos um servidor com quatro processadores.

== Cálculo do tempo de resposta total e na fila e utilização:

=== Primeiro caso:

$
  E[R_q] = (lambda) / (mu (mu - lambda)) = 100 / (120 (120 - 100)) = 100 / (120 . 20) = 100 / 2400 = 0.04167 "min" = 2.5 "s"
$


=== Segundo caso: 

$
  E[R_q] = (lambda) / (c . mu_c (c . mu_c - lambda)) = 25 / 35 (35 - 25) = 25 / (35 . 10) = 25 / 350 = 0.07143 "min" = 4.29 "s"
$

=== Terceiro caso: 

$
  E[R_q] = (lambda) / (c . mu_p (c . mu_p - lambda)) = 100 / (4 . 35 (4 . 35 - 100))
$

Assim temos:

$
  E[R_q] = 100 / (140 (140 - 100)) = 100 / (140 . 40) = 100 / 5600 = 0.01786 "min" = 1.07 "s"
$

== Calculando o tempo de atendimento: 

=== Primeiro caso: 

$
  E[R_s] = 1 / mu = 1 / 120 = 0.00833 "min" = 0.5 "s"
$

=== Segundo caso: 

$
  E[R_s] = 1 / mu_c = 1 / 35 = 0.02857 "min" = 1.71 "s"
$

=== Terceiro caso: 

$
  E[R_s] = 1 / mu_p = 1 / 35 = 0.02857 "min" = 1.71 "s"
$

== Calculando a utilização: 

=== Primeiro caso: 

$
  U = lambda / mu = 100 / 120 = 0.8333
$

=== Segundo caso:

$
  U = lambda / (c . mu_c) = 25 / 35 = 0.7143
$

=== Terceiro caso:

$
  U = lambda / (c . mu_p) = 100 / (4 . 35) = 100 / 140 = 0.7143
$

== Calculando o tempo total: 

=== Primeiro caso: 

$
  E[R] = E[R_q] + E[R_s] = 2.5 + 0.5 = 3 "s"
$

=== Segundo caso:

$
  E[R] = E[R_q] + E[R_s] = 4.29 + 1.71 = 6 "s"
$

=== Terceiro caso:

$
  E[R] = E[R_q] + E[R_s] = 1.07 + 1.71 = 2.78 "s"
$

Tabela comparatviva: 

#sourcecode[```txt
| Config. | Utilização  | Tempo Fila (s) | T Aten. (s) | T Total (s) |
| ------- | ----------- | ---------------| ------------| ------------|
| 1 Caso  | 0,833       | 2,5            | 0,5         | 3,0         |
| 2 Caso  | 0,714       | 4,3            | 1,7         | 6,0         |
| 3 Caso  | 0,714       | 0,675          | 1,7         | 2,7         |
```]



= Questão Com Auxilio Professor: 

Um servidor de autenticacão central possui um processador que consegue atender em média 120 requisicões por minuto. Durante horários de pico, ele recebe em média 100 requisições por minuto. Pergunta-se: *em termos de tempo de espera médio no sistema e na fila, seria melhor manter esta configuração* ? Ou: 

- Caso 1: Dividir as requisições entre quatro servidores (cada um com 25 requisições por minuto) e com capacidade de processar 35 requisições por minuto cada um. 

- Caso 2: Usar um servidor com quatro processadores e uma fila única (cada um com capacidade de 35 requisições por minuto). 

Mostrar o cálculo do tempo de resposta total e dos tempos na fila e no atendimento. Mostrar também a utilização do sisteme. Construir uma tabela com estes tempos. Fazer uma conclusão.

Variáveis da questão: 

- $lambda = 100$ requisições por minuto (taxa de chegada)
- $mu = 120$ requisições por minuto (taxa de serviço do servidor único)
- $c = 1$ (número de servidores no primeiro caso)
- $c = 4$ (número de servidores no segundo caso)
- $mu_c = 35$ requisições por minuto (taxa de serviço de cada servidor no segundo caso)
- $mu_p = 35$ requisições por minuto (taxa de serviço de cada processador no terceiro caso)

== Calculo do melhor caso:

Inicialmente, vamos calcular os parâmetros do sistema para o primeiro caso, onde temos um único servidor com capacidade de atender 120 requisições por minuto.

$
  E[R] = 1 / (mu - lambda) = 1 / (120 - 100) = 1 / 20 = 0.05 "min" = 3 "s"
$

Já no segundo caso, onde temos quatro servidores com capacidade de atender 35 requisições por minuto cada, a taxa de serviço total é:

$
  E[R] = 1 / (c . mu_c - lambda) = 1 / (35 - 25) = 1 / 10 = 0.1 "min" = 6 "s"
$

Já no terceiro caso, onde temos um servidor com quatro processadores, primeiro precisamos calcular o valor esperado: 

$
  E[N_q] = (((rho c)^c+1 )/ c)/(c! (1-rho) ^2) p_0
$

onde: 

- $rho$: $lambda / (c mu)$: É a taxa de utilização do sistema.
- $c$: Número de servidores ou processadores.
- $p_0$: Probabilidade de não haver clientes no sistema, que pode ser calculada como:


$
  p_0 = [sum_(k=0)^(c-1) (c rho)^k / k! + (c rho)^c / c!  1/(1 - rho)]^{-1}
$

Agora, vamos calcular o valor de $p_0$ para o terceiro caso:

#sourcecode[```python 
lambd = 100          # taxa de chegada (λ)
mu = 35              # taxa de serviço por servidor (μ)
c = 4                # número de servidores

rho = lambd / (c * mu)
a = c * rho  # tráfego total (λ/μ)

# Soma dos termos de 0 a c-1: (a^n)/n!
sum_terms = sum((a**n) / math.factorial(n) for n in range(c))

# Último termo: (a^c / c!) * (1 / (1 - ρ))
last_term = (a**c) / math.factorial(c) * (1 / (1 - rho))

# Probabilidade do sistema estar vazio (P0)
P0 = 1 / (sum_terms + last_term)

print(f"rho = {rho:.4f}")
print(f"P0 = {P0:.4f}")
```]

Resultando em: 

#sourcecode[```txt
rho = 0.7143
P0 = 0.0464
```]

Agora aplicando na formul, temos: 


$
  E[N_q] = (((rho c)^c+1 )/ c)/(c! (1-rho) ^2) p_0 -> E[N_q] = (((0,7143 . 4)^4+1 )/ 4)/(4! (1-0,7143) ^2) . (0,0464)
$

#sourcecode[```python
# Utilização
rho = lambd / (c * mu)
a = c * rho

# Soma dos termos de 0 a c-1: (a^n)/n!
sum_terms = sum((a**n) / math.factorial(n) for n in range(c))

# Último termo: (a^c / c!) * (1 / (1 - ρ))
last_term = (a**c) / math.factorial(c) * (1 / (1 - rho))

# Probabilidade do sistema estar vazio (P0)
P0 = 1 / (sum_terms + last_term)

# Cálculo de E[Nq] - número médio na fila
numerador = (a**(c + 1)) / c
denominador = math.factorial(c) * ((1 - rho)**2)
ENq = (numerador / denominador) * P0

print(f"E[Nq] = {ENq:.4f}")
```]

Resultando em:

#sourcecode[```txt
E[Nq] = 1.1277 -> 1.13 "min" -> 67 "s"
```]

Calculamos o tempo médio de espera na fila com: 

$
  E[R_q] = E[N_q] / lambda = 1.13 / 100 = 0.0113 "min" = 0.678 "s"
$

Calculamos também o tempo médio de espera no sistema, com: 

$
  E[R] = E[R_q] + 1 / mu_p = 0.678 + 1 / 35 = 0.678 + 0.02857 = 0.70657 "min" = 42.4 "s"
$