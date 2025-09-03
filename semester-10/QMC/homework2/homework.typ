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
  title: "Laboratório - Estudo de condutividade",
  subtitle: "Química Geral",
  authors: ("Arthur Cadore Matuella Barcella","Gustavo Briance Mengue Mena"),
  date: "1 de Setembro de 2025",
  doc,
)

= Introdução

Condutividade é a capacidade de um material conduzir corrente elétrica. Em sistemas de telecomunicações, a condutividade é um fator crítico que afeta a eficiência e a qualidade da transmissão de sinais. Materiais com alta condutividade, como cobre e alumínio, são comumente utilizados em cabos e componentes eletrônicos para garantir uma transmissão eficaz de dados.

== Objetivos
Os objetivos deste laboratório são:
- Compreender os princípios da condutividade elétrica.
- Analisar a condutividade de diferentes materiais.
- Avaliar o impacto da condutividade na transmissão de sinais em sistemas de telecomunicações.

== Condutivímetro
O condutivímetro é um instrumento utilizado para medir a condutividade elétrica de materiais. Ele funciona aplicando uma tensão elétrica ao material e medindo a corrente resultante. A relação entre a tensão e a corrente permite calcular a condutividade do material. Em laboratório, o condutivímetro é uma ferramenta essencial para experimentos que envolvem a análise de propriedades elétricas de diferentes substâncias.


= Experimento prático

== Parte 1 - Tabela de condutividade

Resultado das medidas de condutividade realizados em sala: 
#align(center)[
#table(
  columns: 3,
  table.header(
    [Substância], [Condutividade $mu S"/""cm"$], [Temperatura (°C)]
  ),
  [Água Destilada], [4,64], [23,3],
  [Água de Abastecimento], [71,8], [21,9],
  [Água mineral], [84,00], [22,3], 
  [Água do mar], [43540,0], [22,6],
  [NaCL (0,01 M/L)], [6960,0], [23,3],
  [HcL (0,01 M/L)], [39200,0], [23,3],
  [NaOH (0,01 M/L)], [21210,0], [23,4],
  [Etanol], [7,18], [23,4],
  [Propanol], [7,85], [23,4],
  [Sacarose], [28,24], [23,5],
  [Etanol + Água Destilada], [8,05], [23,4],
  [Propanol + Água Destilada], [8,27], [23,4],
  [Ácido Acético (0,1 M/L)], [418,08], [23,8],
  [Ácido Acético (6 M/L)], [13,68], [23,3],
  [Ácido Acético (17 M/L)], [7,94], [22,8],
)
]

== Parte 2 - Tabela de condutividade

Resultado das medidas de condutividade realizados em sala: 
#align(center)[
#table(
  columns: 3,
  table.header(
    [Substância], [Condutividade $mu S"/""cm"$], [Temp. (°C)]
  ),
  [30 $"mL"$ Ácido Acético (17 M/L)], [7,94], [22,8],
  [15 $"mL"$ Ácido Acético (17 M/L) + 15 $"mL"$ Propanol], [8,81], [22,7],
  [15 $"mL"$ Ácido Acético (17 M/L) + 15 $"mL"$ Água], [294,1], [22,8],
  [60 $"mL"$ HCl (6 M/L)], [182,3], [22,8],
  [60 $"mL"$ Ácido Acético (6 M/L)], [6,30], [21,5],
  [30 $"mL"$ HCl (6 M/L) + $"CaCO"_3$], [203100,0], [21,6],
  [30 $"mL"$ Ácido Acético (6 M/L) + $"CaCO"_3$], [12,73], [21,7],
  [30 $"mL"$ HCl (6 M/L) + $"Zn(s)"$], [1000-30000], [21,7],
  [30 $"mL"$ Ácido Acético (6 M/L) + $"Zn(s)"$], [3,74], [21,7],
  [15 $"mL"$ HCl (0,01 M/L) + 15 $"mL"$ NaOH (0,01 M/L)], [2660], [21,7],
  [30 $"mL"$ Ácido Acético (0,1 M/L) + 15 $"mL"$ $"NH"_3$ (0,1 M/L)], [2190], [21,8],
)
]

= Questões 

== Por que a água da rede publica de abastecimento tem maior condutividade que a água destilada?

A água da rede pública tem maior condutividade (71,8 µS/cm) que a água destilada (4,64 µS/cm) porque contém íons dissolvidos como cálcio (Ca²⁺), magnésio (Mg²⁺), sódio (Na⁺), cloreto (Cl⁻) e bicarbonato (HCO₃⁻). Esses íons são condutores de corrente elétrica. Já a água destilada é praticamente pura, com mínima presença de íons, resultando em baixa condutividade.


== É sabido que o cloreto de sódio no estado sólido comporta-se como isolante elétrico. 

=== Explique essa afirmação sabendo que o mesmo é representado através de modelos como $"Na"^+"Cl"^-$

No estado sólido, os íons Na⁺ e Cl⁻ estão fortemente ligados em uma rede cristalina rígida, sem mobilidade para transportar carga elétrica, atuando como isolante.

=== Explique usando equações de reações e as teorias de ligação e estrutura quimica, a condutividade elétrica e o processo quimico que ocorre quando se dissolve cloreto de sódio em agua. 

Quando o NaCl se dissolve em água, ocorre a dissociação iônica:

$
  "NaCl"("s") arrow "Na"^+("aq") + "Cl"^-("aq")
$
A água, sendo um solvente polar, estabiliza os íons por hidratação, permitindo que se movimentem livremente e conduzam corrente elétrica.

=== Que espécies iônicas podem ser encontradas na água do mar? 

Na água do mar, além de Na⁺ e Cl⁻, encontramos íons como $"Mg"^2+$, $"Ca"^2+$, $"K"^+$, $"SO"_4^(2-)$, $"HCO"_3^-$ e $"Br"^-$.

== Que espécies quimicas estão presentes em soluções de $"NaOH"$ e $"HCl"$ (0,01 M/L)? Escreva equações para descrever as reações que produzem tais espécies. 

Em solução aquosa, ou seja, dissolvida em água, as espécies químicas são:

- NaOH se dissocia completamente: 
  $
    "NaOH"("s") arrow "Na"^+("aq") + "OH"^-("aq")
  $
- HCl se ioniza completamente:
  $
    "HCl"("g") + "H"₂O("l") arrow "H"₃O⁺("aq") + "Cl"⁻("aq")
  $

== Como você classificaria os alcoois etanol e propanol (eletrólitos fortes, fracos ou não eletrólitos)? Considere as condutividades registradas para os alcoois puros e dissolvidos em água e justifique sua resposta. 

Tanto o etanol (7,18 µS/cm) quanto o propanol (7,85 µS/cm) são não eletrólitos quando puros, pois não formam íons significativos. Quando dissolvidos em água, há um pequeno aumento na condutividade (8,05 µS/cm e 8,27 µS/cm, respectivamente), mas ainda assim são considerados não eletrólitos, pois não sofrem ionização significativa em água.

== Descreva e explique em forma de texto e também usando equações de reações quimicas, as propriedades de condutividade elétrica do ácido acético glacial e do mesmo dissolvido em água. Você classificaria o ácido acético como eletrólito forte, fraco ou não eletrólito? Justifique sua resposta.

O ácido acético é um eletrólito fraco. Em solução aquosa, ele sofre ionização parcial:

$
  "CH"₃"COOH"("aq") arrow "CH"₃"COO"⁻("aq") + "H"⁺("aq")
$

Isso é evidenciado pelos valores de condutividade:
- Solução 0,1 M/L: 418,08 $(mu S)/"cm"$
- Solução 6 M/L: 13,68 $(mu S)/"cm"$
- Solução 17 M/L (glacial): 7,94 $(mu S)/"cm"$

A condutividade não aumenta proporcionalmente com a concentração, característica de um eletrólito fraco.

== Você classificaria a sacarose como eletrólito forte, fraco ou não eletrólito? Justifique sua resposta.

A sacarose é um não eletrólito, como mostra sua baixa condutividade (28,24 $(mu S)/"cm"$), muito próxima à da água pura. Ela não se ioniza em solução aquosa, mantendo-se como moléculas neutras.

== Comparando os dados obtidos para as medidas de condutividade de ácido acético glacial, ácido acético em propanol e ácido acético em ága, explique a influência dos solventes nas propriedades químicas dos sistemas e descreva suas respectivas representações através de equações químicas. 

- Ácido acético glacial (17 M/L). Baixa condutividade (7,94 $(mu S)/"cm"$), pouca autoionização.

- Ácido acético em propanol (1:1). Condutividade similar (8,81 $(mu S)/"cm"$), o propanol não favorece a ionização.

- Ácido acético em água (1:1). Maior condutividade (294,1 $(mu S)/"cm"$), a água promove a ionização:

$
  "CH"₃"COOH"("aq") + "H"₂O("l") arrow "CH"₃"COO"⁻("aq") + "H"₃O⁺("aq")
$

== Comparando qualitativamente a velocidade das reações 11 [30 $"mL"$ HCl (6 M/L) + $"CaCO"_3$] e 12 [30 $"mL"$ Ácido Acético (6 M/L) + $"CaCO"_3$], explique a relação entre as velocidades observadas e os dados de condutividade obtidos para os sistemas químicos 9 [60 $"mL"$ HCl (6 M/L)] e 10 [60 $"mL"$ Ácido Acético (6 M/L)]. Faça o mesmo para as reações 13 [30 $"mL"$ HCl (6 M/L) + $"Zn(s)"$] e 14 [30 $"mL"$ Ácido Acético (6 M/L) + $"Zn(s)"$], também comparando com as condutividades obtidas nas reações 9 [60 $"mL"$ HCl (6 M/L)] e 10 [60 $"mL"$ Ácido Acético (6 M/L)]

=== Reações 11 e 12 ($"CaCO"_3$ + HCl e $"CaCO"_3$ + Ácido Acético)

- Reação 11 ($"HCl" + "CaCO"_3$). Reação rápida, condutividade inicial alta (182,3 µS/cm): 

  $
    2"HCl"("aq") + "CaCO"_3("aq") arrow "CaCl"_2("aq") + "H"_2"O"("l") + "CO"_2("g")
  $

- Reação 12 ($"CH"_3"COOH" + "CaCO"_3$). Reação mais lenta, condutividade inicial baixa (6,30 µS/cm): 

  $
    2"CH"_3"COOH"("aq") + "CaCO"_3("aq") arrow ("CH"_3"COO")_2"Ca"("aq") + "H"_2"O"("l") + "CO"_2("g")
  $

=== Reações 13 e 14 ($"Zn(s)"$ + HCl e $"Zn(s)"$ + Ácido Acético)

- Reação 13 ($"HCl"("aq") + "Zn(s)"$). Reação rápida, condutividade inicial alta: 

  $
    2"HCl"("aq") + "Zn(s)" arrow "ZnCl"_2("aq") + "H"_2("g")
  $

- Reação 14 ($"CH"_3"COOH"("aq") + "Zn(s)"$). Reação muito lenta, condutividade inicial baixa: 

  $
    2"CH"_3"COOH"("aq") + "Zn(s)" arrow ("CH"_3"COO")_2"Zn"("aq") + "H"_2("g")
  $

== Explique, usando equações de reações químicas e as teorias de força e eletrólitos as diferenaçs de condutividade observadas para os reagentes em separado e para os produtos formados nas reações 16 [15 $"mL"$ HCl (0,01 M/L) + 15 $"mL"$ NaOH (0,01 M/L)] e 17 [30 $"mL"$ Ácido Acético (0,1 M/L) + 15 $"mL"$ $"NH"_3$ (0,1 M/L)]

Reação 16 ($"HCl"("aq") + "NaOH"("aq")$). Condutividade inicial alta (devido aos íons H⁺ e OH⁻) que diminui durante a reação (formação de água) e depois aumenta novamente (excesso de $"Na"^+$ e $"Cl"^-$).

$
  "H"^+("aq") + "Cl"^-("aq") + "Na"^+("aq") + "OH"^-("aq") arrow "Na"^+("aq") + "Cl"^-("aq") + "H"_2"O"("l")
$


Reação 17 ($"CH"_3"COOH"("aq") + "NH"_3("aq")$). Condutividade inicial baixa (poucos íons) que aumenta durante a reação (formação de CH₃COO⁻ e NH₄⁺): 

$
  "CH"_3"COOH"("aq") + "NH"_3("aq") arrow "CH"_3"COO"^-("aq") + "NH"_4^+("aq")
$


== Explique como você sabe que está usando corretamente o condutivimetro? 

1. Calibrar o aparelho com solução padrão
2. Lavar o eletrodo com água destilada entre as medidas
3. Secar suavemente o excesso de água sem esfregar
4. Mergulhar o eletrodo na solução até a marca indicada
5. Aguardar estabilização da leitura
6. Anotar o valor junto com a temperatura

A condutividade é afetada pela temperatura, então é importante registrar a temperatura durante as medições para correções posteriores, se necessário.

