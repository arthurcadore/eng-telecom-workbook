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
  title: "Questionário 2",
  subtitle: "Ciência e Tecnologia dos Materiais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "5 de Outubro de 2025",
  doc,
)

= Introdução

= Questões 

== O que são orbitais molecular ligantes? E antiligantes?

Quando dois átomos se aproximam para formar uma molécula, seus orbitais atômicos (por exemplo, os orbitais 1s, 2s, 2p, etc), se combinam, e a partir dessa combinação surgem novos orbitais, chamados orbitais moleculares, que pertencem à molécula toda (não mais a um único átomo). Um orbital molecular ligante é aquele que:

- Resulta da soma construtiva (superposição em fase) das funções de onda dos orbitais atômicos;

- Apresenta maior densidade eletrônica entre os núcleos dos dois átomos;

- Estabiliza a molécula, pois os elétrons nesse orbital atraem ambos os núcleos, ajudando a mantê-los unidos.

Já um orbital molecular antiligante é aquele que:

- Resulta da superposição destrutiva (fora de fase) das funções de onda;

- Apresenta uma região de densidade eletrônica reduzida entre os núcleos (muitas vezes um nó, onde a probabilidade de encontrar elétrons é zero);

- Desestabiliza a molécula, pois os elétrons nesse orbital aumentam a repulsão entre os núcleos.

== Combinando-se n orbitais atômicos, quantos orbitais moleculares são formados?

Quando n orbitais atômicos se combinam, formam-se n orbitais moleculares. Esses orbitais moleculares podem ser classificados em orbitais de ligação (com menor energia) e orbitais anti-ligação (com maior energia). Portanto, para n orbitais atômicos, são formados n orbitais moleculares, sendo a soma dos orbitais de ligação e anti-ligação.


== Escreva uma expressão de forma genérica que demonstre a combinação linear construtiva entre dois orbitais $p_z$ e pertencentes a dois átomos distintos.

A combinação linear construtiva entre dois orbitais $p_z$ de átomos distintos resulta em um orbital molecular de ligação. A expressão genérica para essa combinação pode ser representada como:

$
psi_{"lig"} = 1/ sqrt(2) dot psi_{p_z}^{(A)} + 1/  sqrt(2) dot psi_{p_z}^{(B)}
$

== Escreva uma expressão de forma genérica que demonstre a combinação linear destrutiva entre dois orbitais $p_z$ e pertencentes a dois átomos distintos.

A combinação linear destrutiva entre dois orbitais $p_z$ de átomos distintos resulta em um orbital molecular antiligante. A expressão genérica para essa combinação pode ser representada como:

$
psi_{"antilig"} = 1 /  sqrt(2) dot psi_{p_z}^{(A)} - 1 / sqrt(2) dot psi_{p_z}^{(B)}
$

== Demonstre, por meio de desenhos, a interação construtiva entre dois orbitais $p_z$ e pertencentes a dois átomos distintos. Considere o eixo $z$ como sendo o eixo de ligação.

Infelizmente, não consigo desenhar diretamente aqui, mas posso descrever a interação construtiva:

- Quando dois orbitais $p_z$ se combinam de forma construtiva, as regiões de alta densidade de probabilidade se alinham ao longo do eixo de ligação $z$.

- As ondas dos orbitais se reforçam entre si, resultando em uma região maior de densidade eletrônica no espaço entre os núcleos. Esse tipo de interação é responsável pela formação de uma ligação covalente.

- Visualmente, pode-se imaginar duas "lóbulos" de densidade eletrônica, um de cada átomo, que se combinam para formar uma "cápsula" maior de densidade no centro da molécula, com os núcleos em cada extremidade.

== Demonstre, por meio de desenhos, a interação destrutiva entre dois orbitais $p_z$ e pertencentes a dois átomos distintos. Considere o eixo $z$ como sendo o eixo de ligação.

Para o íon molecular $H^-_2$, temos dois átomos de hidrogênio, cada um com um elétron na camada 1s. Com um elétron extra no sistema (como o ânion $H^-_2$), o diagrama de orbitais moleculares seria o seguinte:

O primeiro orbital molecular formado é: 

$
  (sigma_(1s))
$

O segundo orbital molecular formado é: 

$
  (sigma_(1s))
$

Assim, o diagrama de orbitais moleculares para o íon $H^-_2$ pode ser representado da seguinte forma:

$
  (sigma_(1s))^2 (sigma_(1s))^1
$

== Considere o íon molecular $H_2^-$. Desenhe o diagrama de orbitais moleculares para o mesmo

A ordem de ligação é dada pela fórmula:

$
  "Ordem de ligação" = (N_b - N_a) / 2
$

Para o $H^-_2$, temos:

$
  "Ordem de ligação" = (2 - 1) / 2 = 1 / 2 = 0.5
$

== Considere a espécie química da questão 07. Obtenha a ordem de ligação para a referida espécie química. Demonstre passo a passo.