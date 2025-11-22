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
  title: "Laboratório - Oxigênio Dissolvido",
  subtitle: "Química Geral",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "07 de Novembro de 2025",
  doc,
)

= Introdução

O oxigênio dissolvido (OD) é um parâmetro fundamental na avaliação da qualidade da água, especialmente em corpos hídricos que abrigam vida aquática. A presença de oxigênio é vital para a sobrevivência de peixes e outros organismos aquáticos, e sua concentração pode ser afetada por diversos fatores, incluindo temperatura, pressão e poluição. Este laboratório tem como objetivo investigar a relação entre a temperatura da água e a solubilidade do oxigênio, bem como a importância do OD para os ecossistemas aquáticos.

Neste experimento, utilizaremos o método de Winkler modificado (Azida Sódica) para determinar a concentração de oxigênio dissolvido em amostras de água coletadas a diferentes temperaturas. Através da análise dos dados obtidos, será possível compreender como a temperatura influencia a capacidade da água em reter oxigênio e discutir as implicações ambientais dessa relação.

== Objetivos

Os objetivos deste laboratório são:
- Compreender os princípios da solubilidade do oxigênio em água.
- Analisar a variação da concentração de oxigênio dissolvido em diferentes temperaturas.

= Experimento prático

O primeiro passo para a realização do experimento é a preparação dos reagentes necessários para a determinação do oxigênio dissolvido na amostra de água. Os reagentes utilizados são:

- Sulfato Manganoso ($"MnSO"_4$)
- Azida Sódica (A: $"NaOH" + "KI"$ + B: $"NaN"_3$)
- Ácido Sulfúrico Concentrado ($"H"_2"SO"_4$)
- Tiossulfato de Sódio ($"Na"_2"S"_2"O"_3$)
- Amido (indicador)

== Coleta da amostra e preparação

A primeira parte do experimento consiste em coletar a amostra de água da qual se deseja verificar a quantidade de oxigênio dissolvido, para isso, em sala ultilizamos um frasco de DBO para coletar a amostra de água. A coleta da amostra deve ser feita de forma a preencher o frasco completamente, evitando a formação de bolhas de ar, que podem interferir na medição do oxigênio dissolvido, caso não seja feito dessa forma, o ar pode aumentar a concentração de oxigênio dissolvido na amostra, levando a resultados imprecisos.

#figure(
  figure(
    rect(image("./pictures/dbo.png", width: 50%)),
    numbering: none,
    caption: [Frasco de DBO utilizado na coleta da amostra de água]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Nesse momento, é importante já aplicar 2 mL do primeiro reagente, que é o sulfato manganoso ($"MnSO"_4$), para evitar a perda de oxigênio dissolvido na amostra. Após a adição do reagente, o frasco deve ser agitado suavemente para garantir a completa dissolução do manganês na amostra de água. A adição do reagente o mais cedo possível é crucial para preservar a integridade da amostra, neste relatório o experimento foi realizado em sala, e portanto a amostra foi coletada diretamente da torneira, mas em um caso real, o manganês deve ser adicionado no local da coleta.

$
  "MnSO"_4 + 2 "NaOH"_(("aq")) arrow "Mn(OH)"_(2 "(s)") + "Na"_2"SO"_(4 "(aq)")
$

$
  "Mn(OH)"_(2 "(s)") + "O"_2 arrow "2MnO(OH)"_(2 "(s)")
$

Em seguida, adicionamos 2 mL do segundo reagente, que é a azida sódica (A: $"NaOH" + "KI"$ + B: $"NaN"_3$). A função da azida sódica é reagir com os íons de nitrito que podem estar presentes na amostra, prevenindo a interferência desses íons na medição do oxigênio dissolvido.

$
  "MnSO"_(4 "(aq)") + 2 "KI" arrow "MnSO"_(4 "(aq)") + "K"_2"SO"_(4 "(aq)") + "I"_2
$

O período de coleta e análise da amostra deve ser o mais curto possível para minimizar alterações na concentração de oxigênio dissolvido, porém não deve ser superior a 8 horas, caso contrário, a amostra pode não refletir com precisão as condições originais da água coletada.

== Adição do ácido sulfúrico 

Em seguida, em laboratório adicionamos 2 mL de ácido sulfúrico concentrado ($"H"_2"SO"_4$) para acidificar a amostra. A acidificação é necessária para liberar o oxigênio ligado ao manganês, permitindo que ele reaja com o iodeto presente na amostra.

$
  "MnO(OH)"_(2 "(s)") + 2 "H"_2"SO"_(4 "(aq)") arrow "Mn"("SO"_4)_(2 "(aq)") + 3 "H"_2"O" 
$

== Titulação

Após a preparação da amostra, realizamos a titulação utilizando uma solução padrão de tiossulfato de sódio ($"Na"_2"S"_2"O"_3$), e também 1 mL de amido como indicador para determinar a concentração de oxigênio dissolvido. 
#figure(
  figure(
    rect(image("./pictures/titulacao.png", width: 50%)),
    numbering: none,
    caption: [Processo de titulação da amostra de água com tiossulfato de sódio]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Neste ponto, iremos realizar três titulações, e comparar os resultados, para isso, em laboratório vamos separar três erlenmeyers, em cada um deles colocamos 50 mL da amostra preparada anteriormente (neste ponto é necessário garantir que a quantidade de amostra seja o mais próxima possível, visto que a quantidade de liquido afetará a quantidade de reagente utilizado na titulação). 

$
  I_2 + 2 "Na"_2"S"_2"O"_3 arrow "Na"_2 "S"_4 "O"_6 + 2 "I"^(-)_("(aq)")
$

A titulação é feita até que a cor amarela da solução desapareça, indicando que todo o iodo liberado na reação anterior foi consumido, durante a titulação, adicionamos o amido como indicador, que forma um complexo azul com o iodo, facilitando a visualização do ponto final da titulação.

$
  O_2 + 4 "Na"_2"S"_2"O"_3 arrow 2"Na"_2 "S"_4 "O"_6 + 2 "Na"_2 "O"_("(aq)")
$

A quantidade de tiossulfato de sódio utilizada na titulação é diretamente proporcional à concentração de oxigênio dissolvido na amostra de água. A partir dos volumes utilizados nas três titulações, podemos calcular a média e determinar a concentração final de oxigênio dissolvido.

= Calculo dos resultados

Para calcular a concentração de oxigênio dissolvido na amostra de água, utilizaremos o valor obtido na titulação com tiossulfato de sódio.

== Determinação da concentração de oxigênio dissolvido

Nos três ensaios realizados, foram utilizados os seguintes volumes de tiossulfato de sódio:

- Ensaio 1: 6,0 mL
- Ensaio 2: 5,8 mL
- Ensaio 3: 6,2 mL

Devemos considerar que a concentração da solução de tiossulfato de sódio é de 0,01 mol/L, desta forma, podemos calcular a quantidade de oxigênio dissolvido utilizando uma relação linear simples. 

#align(center)[
`
0,01 "mol"/L  -----> 1000 mL
X1 "mol"/L  -----> 6 mL

X1 = (0,01 * 6,0) / 1000 = 0,000060 mol


0,01 "mol"/L  -----> 1000 mL
X2 "mol"/L  -----> 5,8 mL

X2 = (0,01 * 5,8) / 1000 = 0,000058 mol

0,01 "mol"/L  -----> 1000 mL
X3 "mol"/L  -----> 6,2 mL

X3 = (0,01 * 6,2) / 1000 = 0,000062 mol
`
]

Cada mol de $"Na"_2 "S"_2 "O"_3$ reage com 4 mols de $"O"_2$, portanto, para encontrar a quantidade de oxigênio dissolvido, devemos dividir os valores obtidos por 4, para cada ensaio, em seguida, podemos calcular a quantidade de oxigênio dissolvido em mols. Neste ponto é necessário comentar que como estamos utilizando $"O"_2$, e não "O", devemos considerar a massa molar do oxigênio como sendo 32 g/mol, ou seja, 16 g/mol para cada átomo de oxigênio que compoe a molécula.


#align(center)[
`
0.0000150 "mol"/L  -----> 50 mL
X1 "mol"/L  -----> 1000 mL

X1 = (0.0000150 * 1000) / 50 = 0,00030 mol

0.0000145 "mol"/L  -----> 50 mL
X2 "mol"/L  -----> 1000 mL

X2 = (0.0000145 * 1000) / 50 = 0,00029 mol

0.0000155 "mol"/L  -----> 50 mL
X3 "mol"/L  -----> 1000 mL

X3 = (0.0000155 * 1000) / 50 = 0,00031 mol
`
]

Por fim, calculamos a média dos três ensaios para obter o valor final da concentração de oxigênio dissolvido na amostra de água, para isso, consideraremos que a concentração de oxigênio dissolvido é dada em mg/L, e para converter de mols para mg, utilizamos a massa molar do oxigênio (32 g/mol).

#align(center)[
`
C1 = 0,00030 mol * 32 g/mol * 1000 mg/g = 9,60 mg/L

C2 = 0,00029 mol * 32 g/mol * 1000 mg/g = 9,28 mg/L

C3 = 0,00031 mol * 32 g/mol * 1000 mg/g = 9,92 mg/L
`
]

Assim, a concentração média de oxigênio dissolvido na amostra de água é calculada a partir da média dos três valores obtidose em cada ensaio, resultando em:

#align(center)[
`
C_media = (9,60 + 9,28 + 9,92) / 3 = 9,60 mg/L
` 
]

== Quantidade de oxigênio previsto

A Portaria brasileira que estabelece os procedimentos de controle e vigilância da qualidade da água para consumo humano é a Portaria de Consolidação GM/MS nº 5, de 28 de setembro de 2017, que consolida o Anexo XX sobre o tema, com a redação dada por alterações posteriores, notadamente a Portaria GM/MS nº 888, de 4 de maio de 2021.

No entanto, em uma análise do Anexo XX, que trata do padrão de potabilidade, não se encontra um valor mínimo/máximo para Oxigênio Dissolvido (OD) em águas de distribuição para consumo. Durante a leitura, foi identificado que a legislação foca em parâmetros que garantem a ausência de risco à saúde humana na água distribuída. Os principais parâmetros com valores mínimos ou máximos obrigatórios no sistema de distribuição são:

- Residual de Desinfetante (Cloro ou Dióxido de Cloro): Mínimo: 0,2 mg/L de Cloro ou 0,2 mg/L de Dióxido de Cloro em toda a extensão do sistema de distribuição e nos pontos de consumo. Já o valor máximo sendo de 5 mg/L, estabelecido no Anexo 13 do Anexo XX.

- Turbidez: Já para a Turbidez, o valor máximo permitido é de 5,0 $u T$ em toda a extensão do sistema de distribuição (reservatório e rede).

= Conclusão

O experimento realizado permitiu a determinação da concentração de oxigênio dissolvido em uma amostra de água utilizando o método de Winkler modificado. Através das titulações com tiossulfato de sódio, foi possível calcular a concentração média de oxigênio dissolvido, que resultou em 9,60 mg/L.

A importância do oxigênio dissolvido para a vida aquática e a qualidade da água foi destacada ao longo do relatório. A concentração adequada de OD é essencial para a sobrevivência de organismos aquáticos, e sua variação pode indicar mudanças nas condições ambientais, como poluição ou alterações na temperatura da água.

Além disso, a análise da legislação vigente revelou que, embora não haja um valor específico para oxigênio dissolvido em águas de consumo humano, outros parâmetros relacionados à qualidade da água são controlados para permitir o consumo humano.