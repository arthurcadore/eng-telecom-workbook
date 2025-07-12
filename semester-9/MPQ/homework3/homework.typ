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
  title: "Estudo Experimental de Associações de Resistores e Efeito Joule",
  subtitle: "Relatório de Laboratório",
  authors: ("Arthur Cadore Matuella Barcella","Faber Bernardo Junior","Gabriel Luiz Espindola Pedro"),
  date: "12 de junho de 2025",
  doc,
)

= Introdução:

Este experimento tem como objetivo analisar o comportamento de associações de resistores em série e em paralelo, utilizando cinco resistores de 1 kΩ e cinco de 1 MΩ. As medições serão realizadas em corrente contínua (CC), com o uso de multímetro e osciloscópio para observar as respostas dos circuitos.

A compreensão de como a disposição dos resistores influencia a resistência total de um circuito é essencial na eletrônica. Além disso, este experimento proporciona experiência prática com instrumentos de medição e desenvolve habilidades em análise experimental.

= Revisão de literatura:

As associações de resistores são fundamentais em circuitos elétricos. Em associação série, a resistência equivalente é dada pela soma dos valores individuais. Já em associação paralelo, a resistência equivalente é obtida pela soma dos inversos das resistências individuais.

Em corrente alternada (CA), além da resistência, fatores como capacitâncias e indutâncias parasitas podem influenciar o comportamento do circuito, especialmente em altas frequências. O multímetro é utilizado para medir resistência, tensão e corrente em CC, enquanto o osciloscópio permite visualizar formas de onda e analisar a resposta dinâmica dos circuitos.

Esta seção revisa os conceitos teóricos fundamentais para a análise experimental, reforçando a importância de compreender as associações resistivas e as limitações práticas dos instrumentos de medição.

= Resistores Comerciais

Em eletrônica, não é viável fabricar resistores com qualquer valor numérico de resistência. Por isso, a indústria adota séries padronizadas de resistores, como as séries E12, E24, entre outras. Essas séries definem um conjunto finito de valores nominais por década, de forma que seja possível cobrir uma ampla faixa de resistências com precisão adequada para a maioria das aplicações.

O uso de resistores comerciais padronizados é essencial para facilitar a fabricação em escala, reduzir custos, garantir intercambialidade entre componentes e assegurar a reposição em projetos práticos. No entanto, nem sempre é possível encontrar exatamente o valor desejado entre os disponíveis na série padrão.

Para contornar essa limitação, é comum combinar resistores em série e/ou paralelo para obter valores de resistência equivalentes que não estejam disponíveis diretamente no mercado. Assim, qualquer valor de resistência pode ser aproximado com boa precisão por meio de associações de resistores comerciais, o que reforça a importância de entender e aplicar corretamente os princípios dessas associações em projetos eletrônicos.

== Série E12

A série E12 é uma das mais comuns e contempla valores padronizados de resistores amplamente utilizados em aplicações gerais. As figuras a seguir ilustram como os resistores dessa série podem ser combinados em série e paralelo, destacando os efeitos dessas associações na resistência equivalente.

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          $
            R_"eq" = ( sum_(i=1)^n R_i )
          $
          #figure(
            figure(
              rect(image("./pictures/matriz_serie_e12.svg", width: 100%)),
              numbering: none,
              caption: [Matriz de resistores em série],
            ),
            caption: figure.caption([Elaborada pelo Autor], position: top)
          )
        ],
        [
          $
            1/R_"eq" = ( sum_(i=1)^n 1/R_i)
          $
          #figure(
            figure(
              rect(image("./pictures/matriz_paralelo_e12.svg", width: 100%)),
              numbering: none,
              caption: [Matriz de resistores em paralelo],
            ),
            caption: figure.caption([Elaborada pelo Autor], position: top)
          )
        ],
    ),
)

A associação em série resulta em uma resistência total maior, enquanto a associação em paralelo reduz a resistência equivalente.

== Série E24

A série E24 oferece maior granularidade de valores comerciais, permitindo combinações ainda mais precisas para projetos eletrônicos. As associações possíveis são exemplificadas nas figuras a seguir:

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          $
            R_"eq" = ( sum_(i=1)^n R_i )
          $
          #figure(
            figure(
              rect(image("./pictures/matriz_serie_e24.svg", width: 100%)),
              numbering: none,
              caption: [Matriz de resistores em série],
            ),
            caption: figure.caption([Elaborada pelo Autor], position: top)
          )
        ],
        [
          $
            1/R_"eq" = ( sum_(i=1)^n 1/R_i)
          $
          #figure(
            figure(
              rect(image("./pictures/matriz_paralelo_e24.svg", width: 100%)),
              numbering: none,
              caption: [Matriz de resistores em paralelo],
            ),
            caption: figure.caption([Elaborada pelo Autor], position: top)
          )
        ],
    ),
)

Essas associações demonstram como a escolha da série influencia a flexibilidade de valores alcançáveis em um projeto.



= Materiais e métodos:

- 10 resistores de 1kΩ
- 10 resistores de 1MΩ
- Fonte de alimentação CC
- Multímetro digital
- Protoboard e cabos
- Resistor de aquecimento 1000W (220VAC) para simulação do efeito Joule

Foram montados circuitos com resistores em série, paralelo e mista. As medições de resistência, tensão e corrente foram realizadas com o multímetro digital. O protoboard facilita a montagem dos circuitos sem a necessidade de solda.

Para simular o efeito Joule, foi utilizado um resistor de aquecimento 1000W (220VAC) submerso em 500mL de água, com a temperatura ambiente de 25°C, e foi monitorada a temperatura da água ao longo do tempo até a temperatura de evaporação.

= Associação de resistores:

== Distribuição normal dos valores medidos:

A análise estatística dos valores medidos permite determinar a média, desvio padrão e erro médio dos resistores:

- Média:
$ 
  R = 1/n (sum_(i=1)^n R_i)
$

Onde: 
- $R$ é a média
- $n$ o número de resistores.

- Desvio padrão:

$ 
  sigma = sqrt(sum_(i=1)^n ((R_i - R)^2/n-1))
$

Onde: 
- $sigma$ representa a dispersão dos valores em relação à média.

- Erro médio:

$ 
  Delta R = sigma/sqrt(n)
$

Onde: 
- $Delta R$ é o erro médio
- $sigma$ é o desvio padrão
- $n$ é o número de resistores.

#figure(
  figure(
    rect(image("./pictures/plot_hist_1k.svg", width: 100%)),
    numbering: none,
    caption: [Distribuição normal dos valores medidos],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Associação de resistores (série, paralelo e mista):

O erro absoluto na associação em série é:

$ 
  Delta R_"eq" = sum_(i=1)^n Delta R_i 
$

Onde: 
- $Delta R_"eq"$: é a incerteza total
- $Delta R_i$: são as incertezas individuais de cada resistor.

A propagação de erro para paralelo:

$ 
  Delta R_"eq" = R_"eq"^2 sqrt( sum_(i=1)^n ((Delta R_i)/R_i^2)^2 ) 
$

Onde: 
- $Delta R_"eq"$: é a incerteza total da associação em paralelo.
- $Delta R_i$: são as incertezas individuais de cada resistor.
- $R_"eq"$: é a resistência equivalente.

Considerando o circuito misto de exemplo abaixo: 

$
  R_"eq" = 1K Omega + (1M Omega || 1k Omega) + (1M Omega || 1M Omega) + (1k Omega || 1k Omega) + 1M Omega 
$

Podemos calcular a resistência equivalente das etapas do circuito misto, como mostrado abaixo:

#figure(
  figure(
    rect(image("./pictures/plot_assoc_mista.svg", width: 100%)),
    numbering: none,
    caption: [Calculo das resistências do circuito misto],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Efeito Joule 

== Aquecimento de água

O efeito Joule consiste na transformação da energia elétrica em energia térmica devido à passagem de corrente por um condutor ou resistor. Esse fenômeno é fundamental em aplicações como aquecedores elétricos, fusíveis, lâmpadas incandescentes e em muitos processos industriais.

No contexto deste experimento, investigamos o aquecimento de uma amostra de água quando submetida à dissipação de potência elétrica em um resistor submerso. O objetivo é analisar como a energia fornecida ao sistema é convertida em aumento de temperatura, levando em conta também as perdas térmicas para o ambiente.

A modelagem matemática do aquecimento é baseada na seguinte equação diferencial, que incorpora tanto o fornecimento de energia elétrica quanto a perda de calor para o ambiente (lei de Newton do resfriamento):

$ 
  d_T/d_t = P/"mc" - k (T - T_"amb") 
$

Onde:
- $T$: temperatura da água (em °C ou K)
- $P$: potência dissipada pelo resistor (em W)
- $m$: massa da água (em kg)
- $c$: calor específico da água (em J/kg·K)
- $k$: coeficiente de resfriamento para o ambiente (em s⁻¹)
- $T_"amb"$: temperatura ambiente (em °C ou K)

A solução numérica foi implementada de forma discreta, atualizando a temperatura a cada intervalo de tempo $d_t$:

$ 
  T_(i+1) = T_i + ( P/"mc" - k (T_i - T_"amb") ) d_t 
$

Onde: 
- $T_i$: temperatura no instante $i$
- $d_t$: passo de tempo da simulação (em segundos)

Configuração experimental:
- A potência $P$ foi calculada a partir da tensão e corrente aplicadas ao resistor.
- A massa $m$ da água e o calor específico $c$ são conhecidos.
- O coeficiente $k$ foi estimado a partir da taxa de resfriamento observada experimentalmente.

O gráfico a seguir apresenta a evolução da temperatura da água ao longo do tempo, mostrando tanto a curva teórica prevista pelo modelo quanto dados experimentais simulados. A diferença entre as curvas pode ser atribuída a fatores como perdas adicionais, imprecisão na medição de $k$ ou variações ambientais.

#figure(
  figure(
    rect(image("./pictures/plot_temperatura.svg", width: 100%)),
    numbering: none,
    caption: [Curva de aquecimento da água por efeito Joule],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

O estudo do efeito Joule é essencial para o dimensionamento seguro de dispositivos elétricos, evitando sobreaquecimento e otimizando a eficiência energética de sistemas de aquecimento.

= Conclusão:

O experimento permitiu compreender, na prática, os princípios fundamentais das associações de resistores em série, paralelo e mista, bem como a influência dessas configurações na resistência equivalente de um circuito. As medições e análises estatísticas mostraram a importância de considerar as tolerâncias e incertezas dos componentes, reforçando a necessidade do cálculo de erros experimentais para uma avaliação precisa dos resultados.

A investigação do efeito Joule demonstrou como a energia elétrica é convertida em calor, evidenciando o papel dos resistores como elementos dissipadores. A modelagem matemática e a comparação com dados experimentais destacaram a relevância de fatores como perdas térmicas e transferência de calor para o ambiente, aspectos essenciais para o dimensionamento seguro de dispositivos elétricos.

Além de consolidar conceitos teóricos, o experimento proporcionou experiência com instrumentos de medição e análise de dados, habilidades essenciais para a formação em Engenharia. O estudo reforça a importância do rigor experimental e da análise crítica dos resultados, fundamentais para o desenvolvimento de soluções eficientes e seguras em projetos eletrônicos e sistemas de energia.

= Referências:

- BOYLESTAD, R. L.; NASHELSKY, L. Dispositivos Eletrônicos e Teoria de Circuitos. 11. ed. São Paulo: Pearson, 2014.
- HAYT, W. H.; KEMMERLY, J. E.; DURBIN, S. M. Análise de Circuitos em Engenharia. 8. ed. Porto Alegre: AMGH, 2019.
- Manuais dos instrumentos utilizados. 