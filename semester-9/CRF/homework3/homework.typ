#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Circuitos Osciladores",
  subtitle: "Circuitos de Rádio-Frequência",
  date: "10 de Junho de 2025",
  authors: ("Arthur Cadore M. Barcella",),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário
 
#outline()

= Cristais Piezoelétricos

== Constituição do Cristal

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #lorem(10)
        ],
        [
#figure(
  figure(
    rect(image("./pictures/cristal_oscilador.png", width: 55%)),
    numbering: none,
    caption: figure.caption([Cristal Piezoelétrico fechado], position: top)
    ),
    )
        ],
    ),
)
 
== Modelo Elétrico

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          Um oscilador de cristal pode ser modelado como um circuito RLC série em paralelo com um capacitor, conforme apresentado a direita. 

          A equação de impedância do cristal é dada por:

          $
            Z(s) = (1/(s . C_1) + s . L_1 + R_1) || (1 / (s . C_0))
          $

          Onde: 

          - $C_1$ é a capacitância do cristal em série
          - $L_1$ é a indutância do cristal em série
          - $R_1$ é a resistência do cristal em série
          - $C_0$ é a capacitância de derivação do cristal
          - $s = sigma + j omega$: variável complexa de Laplace
          
          ]
        ],
        [
          #figure(
            figure(
              rect(image("./pictures/modelo_eletrico.png", width: 85%)),
              numbering: none,
              caption: figure.caption([Modelo Elétrico Correspondente do Cristal], position: top)
            ),
          )
        ],
    ),
)



== Modelo Elétrico 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
Dessa forma, adicionar uma capacitância em paralelo com o cristal, resulta em um aumento do valor de $C_0$, assim fazendo com que a frequência de ressonância (paralela) do circuito diminue. Em contra partida, adicionar uma indutância em paralelo com o cristal, faz com que a frequência de ressonância (paralela) do circuito aumente.

Assim, os fabricantes de cristais especificam a frequência de ressonância junto a um capacitor de carga $C_L$ que deve ser utilizado para que o cristal opere na frequência desejada, sem esse capacitor, o cristal irá operar em uma frequência maior da desejada.
          ]
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/cristal_oscilador2.png", width: 65%)),
             numbering: none,
             caption: figure.caption([Oscilador de Cristal HC-49S 9AC (JGHC) ], position: top)
           ),
          )
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Frequency Range], [3.2-64 MHz], 
              [Shunt Capac. (C0)], [7 pF],
              [Load Capacitance], [20 pF],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
        ],
    ),
)

== Efeitos de temperatura 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
Dessa forma, adicionar uma capacitância em paralelo com o cristal, resulta em um aumento do valor de $C_0$, assim fazendo com que a frequência de ressonância (paralela) do circuito diminue. Em contra partida, adicionar uma indutância em paralelo com o cristal, faz com que a frequência de ressonância (paralela) do circuito aumente.

Assim, os fabricantes de cristais especificam a frequência de ressonância junto a um capacitor de carga $C_L$ que deve ser utilizado para que o cristal opere na frequência desejada, sem esse capacitor, o cristal irá operar em uma frequência maior da desejada.
          ]
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/cristal_oscilador2.png", width: 65%)),
             numbering: none,
             caption: figure.caption([Oscilador de Cristal HC-49S 9AC (JGHC)], position: top)
           ),
          )
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Frequency Tolerance], [± 10 ppm], 
              [Temperature Range], [\~40 \~+85℃],
              [Aging (at 25℃ )], [± 5 ppm / year],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
        ],
    ),
)

== Resposta em Frequência


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #lorem(10)
        ],
        [
#figure(
  figure(
    rect(image("./pictures/resposta_frequencia.png", width: 95%)),
    numbering: none,
    caption: figure.caption([Elaborada pelo Autor], position: top)
  ),
)
        ],
    ),
)

= VCO (Voltage-Controlled Oscillator)

== Diagrama Elétrico

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #lorem(10)
        ],
        [
#figure(
  figure(
    rect(image("./pictures/vco.png", width: 95%)),
    numbering: none,
    caption: figure.caption([Elaborada pelo Autor], position: top)
  ),
)
        ],
    ),
)