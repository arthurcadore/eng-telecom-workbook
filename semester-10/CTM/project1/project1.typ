#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#import "@preview/atomic:1.0.0": atom
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)


#show: doc => report(
  title: "Avaliação 01",
  subtitle: "Ciência e Tecnologia dos Materiais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "24 de Outubro de 2025",
  doc,
)

= Instruções

Período de Realização: 09h40-23h59. Enviar respostas até 23h59 do dia 26/10/25 para `leoqmc@ifsc.edu.br`. Respostas podem ser digitadas, fotos de manuscritos, etc. Enviar respostas em arquivo PDF único e organizado, com as respostas de “cabeça para cima”. Será descontado 1,0 ponto caso estes
requisitos não sejam atendidos.

= Questões

== O que é ligação química?

Uma ligação química é a força que mantém dois ou mais átomos unidos para formar moléculas ou compostos. Ela ocorre porque os átomos tendem a alcançar uma configuração eletrônica estável, geralmente semelhante à dos gases nobres, completando suas camadas de valência (a camada mais externa de elétrons). Existem três tipos principais de ligação química:

- Ligação iônica: Ocorre entre átomos com grande diferença de eletronegatividade (geralmente metal + não metal). Por exemplo: $"NaCl"$ (cloreto de sódio).

- Ligação covalente: Ocorre entre átomos com eletronegatividades próximas (geralmente não metais). Por exemplo: $"H"_2"O"$ (água).

- Ligação metálica: Ocorre entre átomos de metais. Por exemplo: $"Fe"$ (ferro).

== Forneça a distribuição eletrônica em subníveis de energia para a espécie $"Cr"^(3+)$.

=== Configuração eletrônica do átomo neutro de Cr (Z=24):

A configuração eletrônica do cromo neutro é dada por:

$
  "Cr" : 1s^2 2s^2 2p^6 3s^2 3p^6 3d^5 4s^1
$ 

Assim, a representação para cada subnível de energia é:

#table(
     columns: (1fr, 2fr, 1fr),
    align: (center, center, center),
    table.header[Nivel][Subnível][Elétrons],
    [1], [$1s^2$],[2],
    [2], [$2s^2 2p^6$],[8],
    [3], [$3s^2 3p^6 3d^5$],[13],
    [4], [$4s^1$],[1],
)

Podemos também representar a distribuição eletrônica em subníveis de energia, visualmente, como:

#align(center)[
  #atom(24,52, "Cr", (2, 8, 13, 1))
]

=== Configuração eletrônica do íon $"Cr"^(3+)$:

Para formar o íon $"Cr"^(3+)$, o cromo perde três elétrons. Os elétrons são removidos primeiro do subnível de maior energia (4s) e depois do subnível 3d. Portanto, seguindo a configuração eletrônica do cromo neutro, a configuração eletrônica do íon $"Cr"^(3+)$ é:

$
  "Cr"^(3+) : 1s^2 2s^2 2p^6 3s^2 3p^6 3d^3
$ 
A representação para cada subnível de energia do íon $"Cr"^(3+)$ é:

#table(
     columns: (1fr, 2fr, 1fr),
    align: (center, center, center),
    table.header[Nivel][Subnível][Elétrons],
    [1], [$1s^2$],[2],
    [2], [$2s^2 2p^6$],[8],
    [3], [$3s^2 3p^6 3d^3$],[11],
)

A distribuição eletrônica em subníveis de energia para o íon $"Cr"^(3+)$ pode ser representada visualmente como:

#align(center)[
  #atom(24,52, "Cr", (2, 8, 11, 0))
]

== Forneça a fórmula de Lewis para o $P I_3$ (Nota $I$ neste caso é o iodo).

A fórmula de Lewis é uma representação simplificada que mostra como os elétrons de valência estão distribuídos em uma molécula, indicando ligações químicas e pares de elétrons não ligantes. 

=== Distribuição dos elétrons do $P$: 

O fósforo ($P$) está no grupo 15 da tabela periódica, portanto, possui 5 elétrons de valência, abaixo está a distribuição em subníveis de energia:

#table(
     columns: (1fr, 2fr, 1fr),
    align: (center, center, center),
    table.header[Nível][Subnível][Elétrons],
    [1], [$1s^2$],[2],
    [2], [$2s^2 2p^6$],[8],
    [3], [$3s^2 3p^3$],[5],
)

=== Distribuição dos elétrons do $I$:

O iodo ($I$) está no grupo 17 da tabela periódica, portanto, possui 7 elétrons de valência, abaixo está a distribuição em subníveis de energia:

#table(
     columns: (1fr, 2fr, 1fr),
    align: (center, center, center),
    table.header[Nível][Subnível][Elétrons],
    [1], [$1s^2$],[2],
    [2], [$2s^2 2p^6$],[8],
    [3], [$3s^2 3p^6 3d^{10}$],[18],
    [4], [$4s^2 4p^6 4d^{10}$],[18],
    [5], [$5s^2 5p^5$],[7],
)


Dessa forma, podemos considerar que a quantidade de elétrons de valência para cada átomo na molécula $"PI"_3$ é:

$
  P(5) + 3 I(7) = 5 + 21 = 26 "elétrons de valência"
$

Assim, a fórmula de Lewis para o tri-iodeto de fósforo ($"PI"_3$) pode ser representada da seguinte maneira:

#align(center)[
`
 ..  ..  .. 
: I : P : I :
 ..  ..  ..
: I :
 .. 
`
]


== Disserte sobre a teoria do orbital molecular.

A Teoria do Orbital Molecular (TOM) descreve as ligações químicas a partir do comportamento quântico dos elétrons em uma molécula.


Diferente do modelo de ligação de valência (que considera elétrons localizados entre dois átomos), a Teoria do Orbital Molecular propõe que, quando os átomos se aproximam para formar uma molécula, seus orbitais atômicos se combinam para gerar novos orbitais moleculares que pertencem a toda a molécula, e não a um átomo específico.  Esses orbitais moleculares resultam da combinação linear dos orbitais atômicos dos átomos constituintes. Cada combinação pode gerar dois tipos de orbitais:

=== Orbital molecular ligante: 

Resulta de uma interferência construtiva entre os orbitais atômicos (ou como visto em aula, sobreposição em fase da função de onda), aumentando a densidade eletrônica entre os núcleos e estabilizando a molécula.

A combinação linear construtiva entre dois orbitais $p_z$ de átomos distintos pode ser representada genericamente como:

$
psi_{"lig"} = c_1 dot psi_{p_z} + c_2 dot psi_{p_z}
$

Onde $c_1$ e $c_2$ são coeficientes que dependem da contribuição relativa de cada orbital atômico para o orbital molecular formado, e $psi_{p_z}$ representa a função de onda do orbital $p_z$ de cada átomo.

=== Orbital molecular antiligante: 

Resulta de interferência destrutiva (ou seja, conforme visto em aula, sobreposição fora de fase da função de onda), diminuindo a densidade eletrônica entre os núcleos e desestabilizando a molécula.

A combinação linear destrutiva entre dois orbitais $p_z$ de átomos distintos pode ser representada genericamente como:

$
psi_{"antilig"} = c_1 dot psi_{p_z} - c_2 dot psi_{p_z}
$

Onde $c_1$ e $c_2$ são coeficientes que dependem da contribuição relativa de cada orbital atômico para o orbital molecular formado, e $psi_{p_z}$ representa a função de onda do orbital $p_z$ de cada átomo.

Um exemplo apresentado em aula foi a molecula de $O_2$, que possui comportamento paramagnético que pode ser observado experimentalmente com oxigênio líquido sendo atraído por um campo magnético. Esse comportamento é explicado pela presença de dois elétrons desemparelhados em orbitais moleculares antiligantes $\pi^*$, conforme previsto pela Teoria do Orbital Molecular.

O mesmo comportamento não pode ser explicado pela Teoria da Ligação de Valência, que não prevê a existência de elétrons desemparelhados em $O_2$.

== Explique os motivos pelos quais, de acordo com as nossas aulas, os metais são bons condutores de eletricidade.

Nos metais, os átomos estão organizados em uma rede cristalina e unidos por ligações metálicas. Nessa ligação, os elétrons da camada de valência não estão ligados a um átomo específico, em vez disso, eles se movem livremente através do retículo cristalino, formando o que se chama de "mar de elétrons". Conforme visto em aula, a estrutura eletrônica cristalina dos metais se repete por todo o material, a repetição e periódica oque permite representar a menor unidade estrutural do material, chamada de célula unitária, conforme ilustrado na figura abaixo para o atomo de ferro ($"Fe"$).


#figure(
  figure(
    rect(image("./pictures/image2.png", width: 65%)),
    numbering: none,
    caption: [Célula unitária do Ferro ($"Fe"$)]
  ),
  caption: figure.caption([Fonte [2]], position: top)
)

Assim, os elétrons livres são os portadores de carga que se deslocam facilmente quando um campo elétrico é aplicado, permitindo a condução elétrica com menos energia necessária para mover os elétrons através do material, isso que resulta em alta condutividade elétrica. 

Quanto maior a quantidade de atomos metálicos presentes no material, maior será a quantidade de elétrons livres disponíveis para condução elétrica, o que aumenta ainda mais a condutividade do material, e diminui a quantidade de energia necessária para mover esses elétrons. Esse conceito pode ser visualizado na figura abaixo, onde a presença de mais átomos metálicos resulta em mais elétrons livres disponíveis para condução elétrica.


#figure(
  figure(
    rect(image("./pictures/image.png", width: 70%)),
    numbering: none,
    caption: [Relação entre a quantidade de átomos metálicos e a condutividade elétrica do material]
  ),
  caption: figure.caption([Fonte [1]], position: top)
)

== Considere a molécula $"He"_2$. Desenhe um diagrama de orbitais moleculares para a mesma. Calcule a ordem de ligação.

=== Diagrama de Orbitais Moleculares:

Combinando os orbitais $1s$ dos dois átomos He formam-se um orbital molecular ligante $sigma_(1s)$ e um orbital molecular antiligante $sigma_(1s)^*$. 

#figure(
  figure(
    rect(image("./pictures/image3.png", width: 100%)),
    numbering: none,
    caption: [Diagrama de Orbitais Moleculares para a molécula $"He"_2$]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Ordem de ligação: 

A ordem de ligação (OL) é calculada pela fórmula:

$
  "OL" = (N_"elétrons ligantes" - N_"elétrons antiligantes") / 2
$

Assim, para a molécula $"He"_2$, temos:

$
  "OL" = (2 - 2) / 2 = 0
$

Dessa forma, podemos concluir que com 4 elétrons no total (2 por átomo), ambos os orbitais ficam preenchidos, isto leva a ordem de ligação = 0, ou seja não há ligação covalente estável entre os dois átomos de hélio no estado fundamental segundo a TOM.

= Referências

- [1]: https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.solutioninn.com%2Fstudy-help%2Fchemistry-the-central-science%2Frepeat-exercise-1247-for-a-linear-chain-of-eight-lithium-846201

- [2]: https://www.youtube.com/watch?v=n-Fvm06m4Wc