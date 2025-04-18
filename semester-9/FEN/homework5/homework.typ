#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Conceitos Gerais Sobre Energia 
e Transferência de Calor: Exercicios 5",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "16 de Abril de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila a introdução e até o capítulo 7, item 7.5, pp 162-163 e em seguida responder as questões apresentadas abaixo.

= Questões:

== Questão 1:

O cilindro de um motor de combustão interna tem 10cm de diâmetro por 15cm de altura. Este motor gera uma taxa de transferência de calor da ordem de 5 kW, que precisa ser dissipada por convecção. Considere que o cilindro troca calor apenas pela lateral. 

Calcule a temperatura da parede externa do cilindro, quando se utiliza os seguintes fluidos para resfriamento:

=== a) ar a 27°C (h = 280 W/m².K);

Para resolver essa questão, utilizaremos a seguinte fórmula:

$
  Q = h . A . (Delta T)
$

Onde

- Q = taxa de transferência de calor (W) -> 5000 W
- h = coeficiente de transferência de calor por convecção (W/m².K)
- A = área superficial do cilindro (m²)
- $Delta T $= diferença de temperatura entre a superfície do cilindro e a temperatura do fluido (°C) -> $T_"parede"$ - $T_"fluido"$

Inicialmente devemos calcular a área superficial do cilindro (lateral):

$
  A = pi . D . H = pi . (0,1) . (0,15) = 0,0477 m²  
$

Agora, substituímos os valores na fórmula:

$
  T_"parede" = Q / (h . A) + T_"fluido" -> T_"parede" = 5000 / (280 . (0,0477)) + 27
$

Dessa forma, obtemos: 

$
  T_"parede" = 5000 / (13,188) + 27 -> T_"parede" = 379,4 + 27 -> T_"parede" = 406,4 °C
$

Portanto, a temperatura da parede externa do cilindro é de aproximadamente 406,4 °C.

=== b) água a 80°C (h = 3000 W/m².K).

Aplicando a mesma formula apresentada anteriormente, temos que: 

$
  T_"parede" = Q / (h . A) + T_"fluido"
$

Onde: 

- Q = taxa de transferência de calor (W) -> 5000 W
- h = coeficiente de transferência de calor por convecção (W/m².K) -> 3000 W/m².K
- A = área superficial do cilindro (m²) -> 0,0477 m²
- $T_"fluido"$ = temperatura do fluido (°C) -> 80°C

Dessa forma, temos: 

$
  T_"parede" = 5000 / (3000 . (0,0477)) + 80 -> T_"parede" = 5000 / (143,1) + 80 -> T_"parede" = 34,9 + 80 
$

Portanto, a temperatura da parede externa do cilindro é de aproximadamente 114,9 °C.

== Questão 2: 

No problema anterior, supondo que o cilindro seja de aço (k = 60,5 W/m.K) e tenha 10mm de espessura, calcule a temperatura média dos gases no interior da câmara de combustão (cilindro) sabendo que o coeficiente de transferência de calor por convecção no interior do cilindro é de 150 W/m².K.

Para resolver essa questão, precisamos decompor a transferência de calor em três etapas:

- Convecção no interior do cilindro (gases -> parede)
- Condução através da parede do cilindro
- Convecção na superfície externa do cilindro (parede -> ar)

Assim, temos: 

$
  Q = T_g - T_infinity / R_"total"
$

Onde:

- Q = taxa de transferência de calor (W)
- $T_g$ = temperatura média dos gases no interior do cilindro (°C)
- $T_infinity$ = temperatura do fluido (°C) -> 27°C
- $R_"total"$ = resistência térmica total (°C/W)

A resistência térmica total é a soma das resistências térmicas de cada etapa:

$
  R_"total" = R_"convecção" + R_"condução" + R_"convecção" = 1/(h_"interno" . A) + L / (k . A) + 1/(h_"externo" . A)
$ 

Dessa forma: 

$
  R_"total" = 1/(150 . 0,0471) + (0,01) / (60,5 . 0,0471) + 1/(280 . 0,0471) = 0,14 + 0,0035 + 0,075
$

Obtendo um $R_"total"$ de aproximadamente 0,2208 °C/W.

Agora, substituindo os valores na equação de transferência de calor:

$
  T_g = Q . R_"total" + T_infinity -> T_g = 5000 . 0,2208 + 27 -> T_g = 1104 + 27 -> T_g = 1131 °C
$

Portanto, a temperatura média dos gases no interior da câmara de combustão (cilindro) é de aproximadamente 1131 °C.


== Questão 3:

Um dos lados de uma parede plana de 5cm de espessura está exposto a uma temperatura ambiente de 38°C. A outra face da parede se encontra a 315°C. A parede perde calor para o ambiente por convecção. Se a condutividade térmica da parede é de 1,4 W/m.K, calcule o valor do coeficiente de transferência de calor por convecção para 1 m² de parede que deve ser mantido na face da parede exposta ao ambiente, de modo a garantir que a temperatura nessa face não exceda 41°C.

Para resolver a questão, precisamos de um coeficiente $h$ para que a superficie da parede não exceda 41°C. Dessa forma, temos duas etapas de transferência de calor:

- Condução através da parede
- Convecção para o ambiente

Como as duas etapas estão em série, podemos igualar as duas equações de transferência de calor:

$
  Q_"condução" = Q_"convecção" -> q = k . A . (T_2 - T_1 ) / L = h . A . (T_2 - T_3)
$

Onde:

- Q = taxa de transferência de calor (W)
- k = condutividade do material (W/m.K) -> 1,4 W/m.K
- A = área superficial da parede (m²) -> 1 m²
- $T_1$ = temperatura da face da parede exposta ao ambiente (°C) -> 41°C
- $T_2$= temperatura da face da parede em contato com o ar (°C) -> 315°C
- $T_3$ = temperatura do ar ambiente (°C) -> 38°C
- L = espessura da parede (m) -> 0,05 m
- A = 1 m²

Dessa forma, substituindo os valores na equação, temos:

$
  A . k (T_2 - T_1) / L = h . (T_2 - T_3) -> 1 .(1,4) . (315 - 41) / (0,05) = h . (41 - 38) 
$

$
  ((1,4) . 274) / (0,05) = h . 3 -> 7664 = h . 3 -> h = 7664 / 3 -> h = 2554,67 W/m².K
$

Portanto, o coeficiente de transferência de calor de modo a garantir que a temperatura nessa face não exceda 41°C, é de aproximadamente 2554,67 W/m².K.

== Questão 4: 

Ar atmosférico a 25°C escoa sobre uma placa que se encontra a uma temperatura de 75°C. A placa tem 1,5m de comprimento por 75cm de largura. Calcule a taxa de transferência de calor que passa da placa para o ar, se o coeficiente de transferência de calor for de 5,0 W/m².K.

Para resolver essa questão, utilizaremos a seguinte fórmula:

$
  Q = h . A . (T_s - T_infinity)
$

Onde:

- Q = taxa de transferência de calor (W)
- h = coeficiente de transferência de calor por convecção (W/m².K) -> 5,0 W/m².K
- A = área superficial da placa (m²) -> $1,5 . 0,75$ = 1,125 m²
- $T_s$ = temperatura da superfície da placa (°C) -> 75°C
- $T_infinity$ = temperatura do ar (°C) -> 25°C
- $T_s - T_infinity$ = diferença de temperatura entre a superfície da placa e a temperatura do ar (°C) -> 75 - 25 = 50°C

Dessa forma, substituindo os valores na fórmula, temos:

$
  Q = h . A (T_s - T_infinity) -> Q = 5 . 1,125 . (75 - 25) -> Q = 5 . 1,125 . 50 
$

Portanto, a taxa de transferência de calor que passa da placa para o ar é de aproximadamente 281,25 W.

= Referências: 

- Fundamentos de Fenômenos de Transporte de Celso P. Livi
