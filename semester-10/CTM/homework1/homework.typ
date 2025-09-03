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
  title: "Questionário 1",
  subtitle: "Ciência e Tecnologia dos Materiais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "3 de Setembro de 2025",
  doc,
)

= Introdução

= Questões

== O que é ligação química?

Uma ligação química é a força que mantém dois ou mais átomos unidos para formar moléculas ou compostos. Ela ocorre porque os átomos tendem a alcançar uma configuração eletrônica estável, geralmente semelhante à dos gases nobres, completando suas camadas de valência (a camada mais externa de elétrons). Existem três tipos principais de ligação química:

- Ligação iônica: Ocorre entre átomos com grande diferença de eletronegatividade (geralmente metal + não metal). Por exemplo: $"NaCl"$ (cloreto de sódio).

- Ligação covalente: Ocorre entre átomos com eletronegatividades próximas (geralmente não metais). Por exemplo: $"H"_2"O"$ (água).

- Ligação metálica: Ocorre entre átomos de metais. Por exemplo: $"Fe"$ (ferro).


== Qual a utilidade de se fazer a distribuição eletrônica de uma espécie química?

A distribuição eletrônica de uma espécie química mostra como os elétrons estão organizados nas camadas e subníveis de um átomo ou íon. Fazer essa distribuição é útil porque permite entender várias propriedades químicas e físicas do elemento.

== O que é um orbital?

Um orbital é uma região do espaço onde existe uma probabilidade de encontrar um elétron em um estado quântico. Existem diferentes tipos de orbitais, identificados pelas letras s, p, d e f:

- s: 1 orbital por camada.

- p: 3 orbitais por camada.

- d: 5 orbitais por camada.

- f: 7 orbitais por camada.

Os orbitais determinam como os átomos se ligam e a geometria das moléculas, já que os elétrons ocupam regiões que minimizam repulsões. Orbitais em diferentes camadas ou subníveis têm energias diferentes, o que influencia a ordem de preenchimento dos elétrons.

== Forneça a distribuição eletrônica em subníveis de energia das seguintes espécies químicas: 

=== $"Fe3"^+$

$
"Fe"^{3+} arrow 1s^2 2s^2 2p^6 3s^2 3p^6 4s^2 3d^5
$

=== $"Br"^-$

$
"Br"^{-} arrow 1s^2 2s^2 2p^6 3s^2 3p^6 4s^2 3d^(10) 4p^6
$

=== $"Cu2"^+$

$
"Cu"^{2+} arrow 1s^2 2s^2 2p^6 3s^2 3p^6 4s^2 3d^9
$

=== $"As"^-$

$
"As"^{-} arrow 1s^2 2s^2 2p^6 3s^2 3p^6 4s^2 3d^(10) 4p^4
$

== Forneça a distribuição eletrônica em orbitais para o subnível mais energético do fósforo.

O subnivel mais energético do fósforo é o 3p, conforme a distribuição eletrônica do fósforo: 

$
  "P"^{3+} arrow 1s^2 2s^2 2p^6 3s^2 3p^3
$

Conforme apresentado na imagem abaixo, o subnivel mais energético do fósforo é o 3p.

#figure(
  figure(
    rect(image("./pictures/plot.svg", width: 50%)),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Qual o número de subníveis de energia previstos pela mecânica quântica para cada nível de energia? Forneça a resposta do primeiro até o oitavo nível.


#align(center)[
#table(
  columns: 3,
  table.header(
    [Nível de Energia $n$], [Subníveis], [Subníveis de Energia]
  ),
  [1], [1], [s],
  [2], [2], [s, p],
  [3], [3], [s, p, d],
  [4], [4], [s, p, d, f],
  [5], [5], [s, p, d, f, g\*],
  [6], [6], [s, p, d, f, g, h\*],
  [7], [7], [s, p, d, f, g, h, i\*],
  [8], [8], [s, p, d, f, g, h, i, j\*],
)
]

Para os subníveis g\*, h\*, i\* e j\* são previstos teoricamente, mas não existem em elementos conhecidos da tabela periódica; eles aparecem apenas em estudos teóricos de átomos muito pesados.

== Esclareça o significado de dizer que elétrons possuem energia. 

Dizer que elétrons possuem energia significa que eles têm a capacidade de realizar trabalho ou de se mover dentro do átomo devido às suas propriedades físicas e ao seu estado quântico. Em outras palavras, cada elétron em um átomo só pode ocupar certas energias específicas, chamadas de níveis ou estados de energia quantizados.

Ao contrário da ideia clássica de que um elétron poderia ter qualquer energia, a mecânica quântica mostra que só existem valores discretos possíveis. Esses valores são determinados pelo nivel de energia $n$, conforme apresentado na tabela anterior.

Um elétron só muda de estado de energia absorvendo ou emitindo uma quantidade definida de energia (quantum), isso explica fenômenos como linhas espectrais em átomos e a luz emitida ou absorvida.

== Forneça a distribuição eletrônica para a camada de valência das seguintes espécies químicas.  Use a representação para a qual utiliza-se o símbolo do elemento rodeado pelos elétrons: Antimônio, Iodeto, K+, Enxofre:

O plot abaixo mostra a distribuição eletrônica para a camada de valência das seguintes espécies químicas Antimônio, Iodeto, K+, Enxofre:

#figure(
  figure(
    rect(image("./pictures/distribuicao.svg", width: 80%)),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Forneça as fórmulas eletrônicas de Lewis para as seguintes espécies químicas S2, P2, H2S, O3:

Abaixo estão as fórmulas de Lewis para as espécies químicas solicitadas:


- Molécula de Enxofre (S₂):

#align(center)[
`
  ..
:S::S:
   .. 

`
]

- Molécula de Fósforo (P₂): 

#align(center)[
`
:P≡P:

`
]

- Sulfeto de Hidrogênio (H₂S):


#align(center)[
`
  H
  |
H–S:
  ..
`
]

- Ozônio (O₃): 

#align(center)[
`
  ..
O–O=O
  ..

`
]

== Em um composto iônico, como o cloreto de sódio, cada íon está fazendo uma ligação com o outro?  Explique. Dica: Pesquise sobre o arranjo cristalino do cloreto de sódio. 

No composto iônico cloreto de sódio (NaCl), os íons não estão ligados diretamente um ao outro por ligações químicas convencionais, como as covalentes. Em vez disso, eles estão organizados em uma estrutura tridimensional ordenada chamada rede cristalina, onde cada íon é mantido no lugar por atrações eletrostáticas entre cargas opostas.

O NaCl cristaliza-se em uma estrutura cúbica de face centrada (CFC). Nessa disposição:

- Cada íon de sódio (Na⁺) está cercado por 6 íons de cloro (Cl⁻) em uma disposição hexagonal.

- Os Íons alternam entre posições de maior e menor distância, formando uma rede cristalina.

#figure(
  figure(
    rect(image("./pictures/image.png", width: 50%)),
    numbering: none,
    caption: [https://s5.static.brasilescola.uol.com.br/be/2025/03/estrutura-cloreto-sodio.jpg]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)