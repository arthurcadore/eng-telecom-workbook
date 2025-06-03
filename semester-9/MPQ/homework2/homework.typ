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
  title: "Determinação da aceleração da gravidade 
  com pêndulo simples",
  subtitle: "Metodologia de Pesquisa",
  authors: ("Arthur Cadore Matuella Barcella, Faber Bernardo Junior",),
  date: "03 de Junho de 2025",
  doc,
)

= Introdução:

A atividade teve como tema central a análise da aceleração da gravidade utilizando um pêndulo simples, montado com um fio, um gancho e um corpo esférico como peso. O estudo foi desenvolvido com o intuito de aplicar conhecimentos práticos de física clássica, mais especificamente da cinemática e da dinâmica de corpos oscilantes, com foco em movimentos periódicos.

O principal objetivo do experimento foi determinar o valor da aceleração da gravidade local (\( g \)) com base em medições do período de oscilação de um pêndulo simples. Para isso, foi necessário realizar medidas de comprimento do pêndulo e do tempo gasto para completar oscilações completas, analisando a média dos dados e os erros associados, de forma a obter um resultado confiável e com incerteza propagada corretamente.

= Revisão de literatura:

O pêndulo simples é um sistema físico idealizado formado por um corpo puntiforme suspenso por um fio leve e inextensível, que oscila em torno de um ponto fixo sob a ação da gravidade. Quando deslocado de sua posição de equilíbrio e liberado, o sistema realiza um movimento harmônico simples (MHS) aproximado, desde que o ângulo de oscilação seja pequeno. A equação fundamental que relaciona o período \( T \) do pêndulo ao comprimento \( L \) e à gravidade \( g \) é dada por:

$
T = 2 pi sqrt(L/g) -> g = ((2 pi^2) L )/ T^2 -> g = (4 pi^2 L) / T^2
$

Essa relação foi utilizada para calcular o valor experimental de \( g \). Além disso, os conceitos de propagação de incerteza foram empregados, aplicando as derivadas parciais da equação em relação às variáveis \( L \) e \( T \), para determinar o erro associado ao valor obtido.


= Materiais e métodos:

O experimento foi realizado com os seguintes materiais: um fio com comprimento de aproximadamente 62 cm, um gancho de 2,3 cm e uma esfera metálica com diâmetro de 2,85 cm. O comprimento efetivo \( L \) do pêndulo foi considerado como a soma do comprimento do fio, do gancho e do raio da esfera. As medições foram feitas com régua milimetrada, assumindo uma incerteza de $ Delta L = 0.05 "mm"$ para o comprimento total do pêndulo.

Para a medição dos períodos, utilizou-se um cronômetro digital. O peso foi deslocado para um pequeno ângulo e solto, sendo registrado o tempo para completar cinco oscilações, repetindo o processo cinco vezes. Os dados obtidos foram convertidos para o tempo de uma única oscilação e analisados estatisticamente. O valor médio do período foi usado na equação de \( g \), e os erros foram estimados com base no desvio padrão e na propagação de incertezas.

= Calculos e resultados obtidos:

== Calculo do comprimento do pêndulo:

Inicialmente, foi necessário calcular o comprimento efetivo do pêndulo ( L ), que é a soma do comprimento do fio, do gancho e da metade do diâmetro do peso.

#sourcecode[```python
# Variaveis do cenário de medição:
l1 = 62  # Comprimento da corda (cm)
l2 = 2.3 # comprimento gancho (cm)
D = 2.85 # Diâmetro do peso (cm)

# Calculo de L (Comprimento do fio + comprimento do gancho + diâmetro do peso / 2 )

L_cm = l1 + l2 + D / 2

# Convertendo para metros
L = L_cm / 100 

# Calculo de deltaL seguindo menor valor de escala /2
DeltaL = 0.0005
print(f"DeltaL: {DeltaL:.4f} m")

# Calculo do L total
L = DeltaL + L 
print(f"Comprimento L: {L:.8f} m")
```]

Dessa forma, o comprimento obtido do pêndulo foi de:

#sourcecode[```txt
DeltaL: 0.0005 m
Comprimento L: 0.65775000 m
```]

== Valores amostrados: 

Considerando os periodos amostrados de 5 oscilações do pêndulo simples, temos os seguintes valores (valores em segundos):

#sourcecode[```python
periodos = [8.19, 8.14, 8.17, 8.22, 8.05]
```]

== Cálculo do período médio e vetor $Delta T$:

Em seguida, foi calculado o período médio de oscilação do pêndulo, bem como o vetor de diferenças entre cada período amostrado e o período médio. Para isso, utilizamos a seguinte formula: 

$
  T_m = 1/n sum_(i=1)^n T_i
$

Dessa forma, o período médio é dado pela seguinte célula: 

#sourcecode[```python
# Cálculo do período médio
periodo_medio = np.array(list(periodos))
periodo_medio = np.mean(periodo_medio) 
print(f"Período médio: {periodo_medio:.4f} s")
```]

Valor do período médio obtido:

#sourcecode[```txt
Período médio: 8.1540 s
```]

Em seguida, foi criado um vetor de diferenças \( \Delta T_s \) entre cada período amostrado e o período médio, que é dado por:

#sourcecode[```python
# Cria um vetor de deltaTs diminuindo o periodo médio de cada valor do vetor periodos
deltaTs = np.array(list(periodos)) - periodo_medio
print(f"Delta Ts: {deltaTs}")
```]

Vetor de diferenças \( \Delta T_s \) obtido:

#sourcecode[```txt
Delta Ts: [ 0.036 -0.014  0.016  0.066 -0.104]
```]

Com base no vetor de diferenças, foi criado um DataFrame para melhor visualização dos dados amostrados e calculados. Para cada período, foi calculado o tempo de uma oscilação dividindo o período por 5, e o vetor de diferenças \( \Delta T_s \) foi adicionado ao DataFrame.

// #sourcecode[```csv
// (5 Oscilações),          (1 Oscilação),               (Delta Ts)
//           8.19,                  1.638,      0.03599999999999959
//           8.14,                  1.628,     -0.01399999999999930
//           8.17,                  1.634,      0.01600000000000001
//           8.22,                  1.644,      0.06600000000000072
//           8.05,                   1.61,     -0.10399999999999920
// ```]

#figure(
  figure(
    rect(image("./pictures/image.png", width: 100%)),
    numbering: none,
    caption: [DataFrame com os valores amostrados e calculados],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Calculo do desvio padrão $sigma$: 

 Para calcular o desvio padrão dos $Delta T_s $, utilizamos a seguinte fórmula:

$
  sigma = sqrt(sum(Delta T_s^2)) / (n - 1)
$

Para realizar esse calculo, utilizamos a célula abaixo: 

#sourcecode[```python
# Calcula o desvio padrão dos deltaTs
print("\nDesvio Padrão dos Delta Ts:")
sigma = np.sqrt(np.sum(deltaTs ** 2)) / (len(deltaTs) - 1)
print(f"sigma: {sigma:.4f} s")

# Média dos deltaTs
mu = np.mean(deltaTs)

# Geração dos pontos do eixo x
x = np.linspace(mu - 4*sigma, mu + 4*sigma, 1000)

# Função densidade da normal
y = norm.pdf(x, mu, sigma)
```] 

O desvio padrão obtido foi de $sigma: 0.0325 s$, podendo ser visualizado no gráfico abaixo, que mostra a distribuição dos $Delta T_s$ em relação à média e ao desvio padrão.

#figure(
  figure(
    rect(image("./pictures/image2.png")),
    numbering: none,
    caption: [Distribuição dos Delta Ts],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Calculo do $Delta T_m$ e período médio:

Para calcular o erro médio \( \Delta T_m \), utilizamos a seguinte fórmula:

$
  Delta T_m = sigma / sqrt(n)
$

Dessa forma, podemos calcular o $Delta T_m$ através da célula abaixo:

#sourcecode[```python
# Calcula o deltaTm (erro médio)
print("\nCálculo do Delta Tm:")
DeltaTm = sigma / np.sqrt(len(deltaTs))
print(f"Delta Tm: {DeltaTm:.8f} s")
```]

O valor do erro médio $Delta T_m $ obtido foi de:

#sourcecode[```txt
Delta Tm: 0.01454304 s
```]

Em seguida calculamos o período médio de $T$ com base na formula: 

$
  T = (T_m + Delta T_m)/5
$

Para isso, utilizamos a célula abaixo:

#sourcecode[```python
T = (periodo_medio + DeltaTm) / 5 
print(f"Período médio: {T:.4f} s")
```]

Resultando no período médio de:

#sourcecode[```txt
Período médio: 1.6337 s
```]

== Calculo da aceleração da gravidade $g$:

Para calcular a aceleração da gravidade \( g \), utilizamos a fórmula rearranjada do período de um pêndulo simples:

$
  g =( L  (2 pi )^2) / T^2 -> g = (4 pi^2 L) / T^2
$

#sourcecode[```python
# Calculando G
print("\nCálculo da aceleração da gravidade:")
g1 = L * (2 * pi) ** 2 / T ** 2
print(f"Aceleração da gravidade: {g1:.4f} m/s²")
```]

Obtendo o valor da aceleração da gravidade $g$ :

#sourcecode[```txt
Aceleração da gravidade: 9.7291 m/s²
```]

== Calculo da incerteza propagada de $g$:

Para calcular completamente a aceleração da gravidade $g$, precisamos considerar a incerteza propagada. Para isso, utilizamos as derivadas parciais da equação de $g$ em relação a  $L$ e $T$:

Para isso, devemos considerar que a formula de $g$ é dada por: 


$
  g =( L  (2 pi )^2) / T^2 -> g = (4 pi^2 L) / T^2
$

Com isso, as derivadas parciais são dadas por:

$
  Delta g = sqrt((((partial g)/(partial L)) . Delta L)^2 + (((partial g)/(partial T)) . Delta T)^2)
$

Dessa forma, a derivada parcial de $g$ em relação a $L$ é:

$
  (partial g)/(partial L) = d/(d L) ((4 pi^2 L) / T^2) -> (partial g)/(partial L) (4 pi^2) / T^2 
$

E a derivada parcial de $g$ em relação a $T$ é dada por: 

$
  (partial g)/(partial T) = d/(d T)((4 pi^2 L) / T^2)
$

Aplicando a regra do quociente, temos:

$
  d/(d T) (1/T^2) = -2/T^3 -> (partial g)/(partial T) = 4 pi^2 L (-2/T^3 ) -> - (8 pi^2 L) / T^3
$

$
  (partial g)/(partial T) = - (8 pi^2 L) / T^3 
$

Rearanjando a equação de $g$ e aplicando as derivadas parciais, temos:

$
  Delta g = sqrt( (((4 pi^2)/T^2) . Delta L)^2 + (((8 pi^2 L)/T^3) . Delta T)^2 )
$


Assim, podemos calcular a incerteza propagada de $g$ utilizando as derivadas parciais e os erros associados às medições de $L$ e $T$ utilizando a célula abaixo:

#sourcecode[```python
# Calculando as derivadas parciais

# Derivadas parciais
dg_dL = (4 * pi**2) / T**2
dg_dT = (-8 * pi**2 * L) / T**3

# Cálculo da incerteza propagada
delta_g = np.sqrt((dg_dL * DeltaL)**2 + (dg_dT * DeltaTm)**2)

# Exibição dos resultados
print(f"∂g/∂L = {dg_dL:.6f}")
print(f"∂g/∂T = {dg_dT:.6f}")
print(f"Erro propagado Δg = {delta_g:.6f} m/s²")

# Valor final de g com incerteza
print(f"Aceleração da gravidade: {g1:.4f} ± {delta_g:.4f} m/s²")
```]

#sourcecode[```txt
∂g/∂L = 14.791443
∂g/∂T = -11.910412
Erro propagado Δg = 0.173371 m/s²
Aceleração da gravidade: 9.7291 ± 0.1734 m/s²
```]

Assim, somando o valor de $g$ com a incerteza propagada, obtemos o resultado final de aproximadamente $g = 9.90 m/(s^2)$

= Conclusão: 

O experimento permitiu a determinação da aceleração da gravidade local por meio da análise do movimento oscilatório de um pêndulo simples. Utilizando medições precisas do comprimento do fio e do tempo de oscilações, foi possível calcular o valor de $g$ com boa aproximação ao valor de referência $9,81 m/s^2$. O resultado obtido demonstra a eficácia do método, apesar das limitações experimentais como tempo de reação humana e pequenas imprecisões nas medições. 

A aplicação da propagação de incertezas com derivadas parciais contribuiu significativamente para uma avaliação mais precisa do erro associado, oferecendo uma abordagem quantitativa rigorosa à análise dos dados. O experimento também reforçou conceitos fundamentais da física e da estatística experimental, como o uso de médias, desvios e curvas normais para representar incertezas. Em suma, a atividade foi bem-sucedida tanto no aspecto técnico quanto didático, promovendo uma compreensão prática das leis do movimento e da metodologia científica.

= Referências:

- HALLIDAY, D.; RESNICK, R.; WALKER, J. Fundamentos de Física – Volume 1: Mecânica. 10. ed. Rio de Janeiro: LTC, 2016.

- IPLER, P. A.; MOSCA, G. Física para Cientistas e Engenheiros – Volume 1: Mecânica, Oscilações e Termodinâmica. 6. ed. Rio de Janeiro: LTC, 2015.

- HEWITT, P. G. Física Conceitual. 12. ed. São Paulo: Cengage Learning, 2015.