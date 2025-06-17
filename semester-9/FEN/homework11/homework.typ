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
  title: "Exercicios 11: Trocadores de Calor",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "09 de Junho de 2025",
  doc,
)

= Introdução:

O objetivo deste documento é estudar na apostila o item 2.4 (pp. 39 e 40) e o item 2.4.1 (pp. 40, 41 e 42) e responder a questão apresentada abaixo.


== Questões: 

A Estação de Tratamento de Água da Lagoa do Peri faz parte do Sistema de Abastecimento de Água Costa Leste da CASAN, que atende aos distritos da Barra da Lagoa, Lagoa da Conceição, Campeche, Morro das Pedras, Armação e Ribeirão da Ilha. 

A estação está localizada dentro do Parque Municipal da Lagoa do Peri. A captação da água é feita através de uma barragem de elevação de nível com um canal adutor fechado até a Estação de Recalque de Água Bruta com vazão média de captação de 200 l/s. Sabendo que a altura da barragem é 20 m, determine o diâmetro da tubulação do canal adutor.

Para determinar o diâmetro da tubulação do canal adutor, vamos utilizar a equação de vazão: 

$
  Q = A . v
$

Onde: 

- $Q$: É a vasão ($m^3/s$)
- $A$: É a área da seção transversal do canal adutor ($m^2$)
- $v$: É a velocidade média do fluido ($m/s$)


Inicialmente, vamos converter a vazão média de captação de $200 l/s$ para m³/s, dessa forma obtendo $0,200 m^3/s$

Assumindo uma velocidade média de $1,5 m/s$ podemos calcular a área da seção transversal do canal adutor:

$
  A = Q / v -> A = (0,200) / (1,5) = 0,1333 m^2
$

Agora, para determinar o diâmetro da tubulação do canal adutor, vamos utilizar a equação da área de um círculo:

$
  A = pi D^2 / 4 -> D = sqrt((4A) / pi) -> D = sqrt((4 . (0,1333)) / pi) = 0,411 m
$


Dessa forma, o diâmetro da tubulação do canal adutor é de aproximadamente $0,411 m$ ou $41,1 "cm"$.



