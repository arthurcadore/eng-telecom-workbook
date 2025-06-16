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

== Estrutura do Cristal Oscilador

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          Os cristais osciladores são dispositivos que convertem energia elétrica em energia mecânica e vice-versa. 
          
          Esses componentes são projetados a partir de materiais piezoelétricos, como quartzo, que possuem uma estrutura cristalina que permite o efeito piezoelétrico. 

          O cristal oscilador de quartzo é construído a partir de um cristal de quartzo natural ou sintético, que é cortado em uma forma específica e polarizado através de dois eletrodos, conforme apresentado na ilustração a direita.
          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/cristal_oscilador.png", width: 55%)),
    numbering: none,
    caption: figure.caption([Cristal de Quartzo], position: top)
    ),
    )
        ],
    ),
)

== Efeito Piezoelétrico

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          O efeito piezoelétrico é a propriedade de certos materiais de gerar uma tensão elétrica quando submetidos a uma pressão mecânica. 

          Quando um cristal piezoelétrico é submetido a uma tensão elétrica, ele se deforma, podendo se contrair ou expandir, dependendo da polaridade da tensão aplicada. Quando a tensão é removida, o cristal retorna a sua forma original, gerando uma tensão elétrica oposta. 

          Assim, o tempo de contração e expansão do cristal determina a frequência de oscilação do cristal.
          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/efeito_piezoeletrico.png", width: 100%)),
    numbering: none,
    caption: figure.caption([Efeito Piezoelétrico], position: top)
    ),
    )
        ],
    ),
)

= Modelo Elétrico do Cristal
 
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
            Z(s) = 1/(C_1) + L_1 + R_1) || (1 / ( C_0))
          $

          Onde: 

          - $C_1$: Capacitância "Motional", elasticidade equivalente do cristal.
          - $L_1$: Indutância "Motional", massa equivalente do movimento do cristal.
          - $R_1$: Representa as perdas do cristal. 
          - $C_0$: Representa a capacitância parasita do cristal, que é a capacitância entre os terminais do cristal. 
          ]
        ],
        [
          #figure(
            figure(
              rect(image("./pictures/modelo_eletrico.png", width: 100%)),
              numbering: none,
              caption: figure.caption([Modelo Elétrico Correspondente do Cristal], position: top)
            ),
          )
        ],
    ),
)

== Oscilação em Modo Série

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            Um cristal pode ser conectado de duas maneiras ao circuito oscilador: em modo série ou em modo paralelo.

            No modo série, o cristal é conectado em série com um resistor e um capacitor, formando um circuito RLC série. 
            
            A frequência de oscilação do circuito é determinada pela capacitância e indutância do circuito: 

            $
              f_s = 1/(2 pi sqrt(L_1 C_1))
            $
          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/serie.png", width: 85%)),
    numbering: none,
    caption: figure.caption([Oscilador de Cristal em Modo Série], position: top)
  ),
)
        ],
    ),
)

== Oscilação em Modo Pararelo 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            No modo paralelo, o cristal é conectado em paralelo com um resistor e um capacitor, formando um circuito RLC paralelo. 
            
            A frequência de oscilação do circuito é determinada pela capacitância e indutância do circuito:

            $
              f_p = 1/(2 pi sqrt(L_1 C_1)) . (1 + C_1 /(2( C_0 + C_L)))
            $

            Nesse segundo caso, a frequência de oscilação do circuito é maior que a frequência de ressonância do cristal, devido à capacitância de carga $C_L$ que é vista pelo cristal.
          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/paralelo.png", width: 50%)),
    numbering: none,
    caption: figure.caption([Oscilador de Cristal em Modo Paralelo], position: top)
  ),
)
        ],
    ),
)


== Capacitância de Carga
#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          A capacitância de carga é a capacitância que é vista pelo cristal quando ele está em operação em um circuito oscilador. 

          Na ilustração a direita, a capacitância de carga vista pelo cristal é dada por:

          $
            C_L = (C_"L1" . C_"L2") / (C_"L1" + C_"L2") + C_"parasita"
          $

          Quando o cristal é projetado, o fabricante especifica a capacitância de carga $C_L$ que deve ser utilizada para que o cristal opere na frequência desejada.

          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/capacitancia_carga.png", width: 90%)),
    numbering: none,
    caption: figure.caption([Capacitância de Carga], position: top)
  ),
)
        ],
    ),
)


== Resposta em Frequência do Cristal

Com base nos dois modos de operação do cristal, podemos observar a ressonância do cristal em modo série e paralelo, conforme apresentado a seguir:

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
#figure(
  figure(
    rect(image("./pictures/resp_freq2.png", width: 100%)),
    numbering: none,
  ),
)
        ],
        [
#figure(
  figure(
    rect(image("./pictures/resposta_frequencia.png", width: 78%)),
    numbering: none,
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
          A temperatura afeta a frequência de oscilação do cristal, devido à variação da elasticidade e densidade do material piezoelétrico.

          Dessa forma, o cristal possui um parâmetro denominado "aging" (ou envelhecimento), que indica a variação da frequência do cristal ao longo do tempo de acordo com a temperatura: 
          ]
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
        [

          Os parâmetros apresentados anteriormente são exemplos de um cristal oscilador comum, o HC-49S 9AC (JGHC) ilustrado a seguir:

          #figure(
           figure(
             rect(image("./pictures/cristal_oscilador2.png", width: 65%)),
             numbering: none,
             caption: figure.caption([Cristal Oscilador HC-49S 9AC (JGHC)], position: top)
           ),
          )
        ],
    ),
)

== Especificações completas de um Cristal 

#figure(
 rect(image("./pictures/specifications.png", width: 100%)),
 numbering: none,
 caption: figure.caption([Especificações de exemplo:  Cristal HC-49S 9AC (JGHC)], position: top)
)

= Fator Q 

== Fator Q

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          O principal motivo para o uso de cristais osciladores é a sua alta estabilidade de frequência, que é medida pelo fator Q do cristal.

          O fator Q é definido como a razão entre a frequência de ressonância do cristal e a largura de banda da curva de ressonância:

          $
            Q = f_s / (Delta f)
          $

          Onde $f_s$ é a frequência de ressonância do cristal e $Delta f$ é a largura de banda da curva de ressonância.
          ]
        ],
        [
          #figure(
           rect(image("./pictures/fatorQ.png", width: 90%)),
           numbering: none,
           caption: figure.caption([Comparação Fator Q], position: top)
          )
        ],
    ),
)

== Fator Q 

          #figure(
           rect(image("./pictures/FatorQ2.png", width: 90%)),
           numbering: none,
           caption: figure.caption([Comparação Fator Q], position: top)
          )


= Modos de Operação: Fundamental e Harmônicos


== Modo de operação Fundamental


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          Tipicamente, os cristais osciladores operam no modo fundamental, quando a frequência desejada está dentro da faixa de operação do cristal.

          O modo fundamental significa que o oscilador irá operar na frequência de oscilação $f_s$ quando ele é conectado em modo série ou $f_p$ quando em paralelo, e é determinada pela capacitância e indutância do circuito, conforme visto anteriormente. 

          A direita é apresentada uma resposta em frequência do cristal oscilador considerando apenas o modo fundamental.
          ]
        ],
        [
          #figure(
           rect(image("./pictures/fundamental.png", width: 90%)),
           numbering: none,
           caption: figure.caption([Comparação Fator Q], position: top)
          )
        ],
    ),
)


== Modo de operação Harmônico 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
          Em alguns casos, o cristal oscilador pode operar em harmônicos, quando a frequência desejada está fora da faixa de operação do cristal. 

          O modo harmônico significa que o oscilador irá operar em múltiplos inteiros da fundamental, como $3 f_0$, $5 f_0$, etc., onde $f_0$ é a frequência fundamental do cristal.

          Isso permite que o oscilador opere em frequências mais altas, tipicamente acima de 66MHz, mas com uma menor estabilidade de frequência.

          A direita é apresentada uma resposta em frequência do cristal oscilador considerando o modo harmônico.
          ]
        ],
        [
          #figure(
           rect(image("./pictures/overtone2.png", width: 90%)),
           numbering: none,
           caption: figure.caption([Comparação Fator Q], position: top)
          )
        ],
    ),
) 



== Resposta em Frequência

#figure(
  figure(
    rect(image("./pictures/overtone.png", width: 80%)),
    numbering: none
  ),
)


= Circuito Oscilador 

== Circuito Oscilador em Modo Paralelo: 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[

            Com base no modelo elétrico do cristal visto anteriormente, podemos construir um circuito oscilador, neste exemplo, em modo paralelo.

            Além dos componentes do cristal oscilador, o circuito precisa de um amplificador (neste caso, um conjunto de transistores) para fornecer ganho e permitir a oscilação do circuito.

            O arranjo de transistores é montado de maneira a inverter a fase do sinal, permitindo que o circuito oscile, conforme apresentado a direita: 
          ]
        ],
        [
          #figure(
            figure(
              rect(image("./pictures/oscilador_paralelo.png", width: 100%)),
              numbering: none,
              caption: figure.caption([Circuito Oscilador em Modo Paralelo], position: top)
            ),
          )
        ],
    ),
)

== Resposta no Domínio do Tempo

#figure(
            figure(
              rect(image("./pictures/oscilador_paralelo3.png", width: 100%)),
              numbering: none,
              caption: figure.caption([Circuito Oscilador em Modo Paralelo], position: top)
            ),
)

== Resposta no Domínio da Frequência

#figure(
            figure(
              rect(image("./pictures/oscilador_paralelo6.png", width: 100%)),
              numbering: none,
              caption: figure.caption([Resposta no Domínio da Frequência (Gráfico de Bode)], position: top)
            ),
)