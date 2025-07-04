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
  title: "Exercicios 14: Equação de Bernoulli - 
  Perda de Carga no Escoamento",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "4 de Julho de 2025",
  doc,
)

= Introdução

O objetivo deste documento é estudar na apostila o item 2.4.5 (pp. 45-58) e responder a questão apresentada abaixo.

= Questões

== Questão 1

Qual a potência da bomba para a instalação esquematizada a seguir, considerando-se que  a vazão de água transportada é de $14 m^3/h$ e a eficiência da bomba é $75%$? ($"rugosidade relativa" = e/D$) e viscosidade cinemática da água igual a $1,006 . 10^(-6) m^2/s$

- $"VR"$: válvula de retenção
- $"RG"$: registro globo
- $"VP"$: válvula de pé

#figure(
  figure(
    rect(image("./pictures/q1.png", width: 80%)),
    numbering: none,
    caption: [Esquematico Questão 1],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Resposta

Para calcular a potência necessária da bomba, seguimos os seguintes passos:

=== Dados iniciais

São fornecidos os seguintes dados do sistema:

- Vazão volumétrica: $Q=14 m^3/h = 14/3600 = 0,0038889 m^3/s$
- Eficiência da bomba: $eta = 0,75$
- Diâmetro da sucção: $D_s = 1,5 = 38,1 "mm" = 0,0381 m$
- Diâmetro do recalque: $D_r = 2 = 50,8 "mm" = 0,0508 m$
- Comprimento da sucção: $L_s = 7 m$
- Comprimento do recalque: $L_r = 35m$
- Altura geométrica (diferença de nível entre os reservatórios): $H_g = 3 + 2 + 5 + 2 + 10 = 22 m$
- Rugosidade relativa da tubulação de recalque: $e/D = 0,03$
- Viscosidade cinemática da água: $\nu = 1,006 \cdot 10^(-6) m^2/s$

=== Velocidades

Calcula-se a velocidade da água na tubulação, utilizando a equação de continuidade \(v = Q/A\), onde \(A\) é a área da seção transversal.

Área da sucção:

$
A_s = (\pi D_s^2)/4 = 0,00114 m^2
$

Velocidade na sucção:

$
v_s = Q/A_s = (0,0038889)/(0,00114) = 3,41 m/s
$

Área do recalque:

$
A_r = (\pi D_r^2)/4 = 0,002026 m^2
$

Velocidade no recalque:

$
v_r = Q/A_r = (0,0038889)/(0,002026) = 1,92 m/s
$

=== Número de Reynolds e fator de atrito

Com a velocidade e o diâmetro, calcula-se o número de Reynolds para determinar o regime de escoamento:

$
Re = (v_r \cdot D_r)/\nu = (1,92 \cdot 0,0508)/(1,006 \cdot 10^(-6)) = 97000
$

Como \(Re > 4000\), o escoamento é turbulento. Utiliza-se então a equação de Swamee-Jain para estimar o fator de atrito \(f\):

$
f = 0,25 \cdot (log_10 (((0,03)/(3,7)) + ((5,74)/(97000^(0,9)))))^(-2) = 0,065
$

=== Perdas de carga

As perdas de carga totais incluem perdas distribuídas e localizadas.

Perda distribuída na tubulação de recalque:

$
h_{f_r} = f \cdot (L_r/D_r) \cdot (v_r^2)/(2g) = 0,065 \cdot (35/0,0508) \cdot (1,92^2)/(2 \cdot 9,81) = 8,43 m
$

Perdas localizadas são causadas por conexões e válvulas. Na sucção, temos uma válvula de pé:

$
h_{l_s} = 1,5 \cdot (3,41^2)/(2 \cdot 9,81) = 0,89 m
$

No recalque, há uma válvula de retenção e um registro globo:

$
h_{l_r} = 12,5 \cdot (1,92^2)/(2 \cdot 9,81) = 2,35 m
$

=== Altura manométrica total

A altura manométrica é a soma da altura geométrica com todas as perdas de carga:

$
H_m = H_g + h_{f_r} + h_{l_s} + h_{l_r} = 22 + 8,43 + 0,89 + 2,35 = 33,67 m
$

=== Potência

Com a altura manométrica e a vazão, calcula-se a potência hidráulica necessária:

$
P_h = rho \cdot g \cdot Q \cdot H_m = 1000 \cdot 9,81 \cdot 0,0038889 \cdot 33,67 = 1485,2 W
$

Considerando a eficiência da bomba, obtém-se a potência exigida da rede:

$
P_b = P_h/eta = (1485,2)/(0,75) = 1980,3 W
$

=== Conclusão

A potência mínima que a bomba deve fornecer para vencer todas as perdas e elevar o fluido até o reservatório superior é de aproximadamente **1980,3 watts**.
