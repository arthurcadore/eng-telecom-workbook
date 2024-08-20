#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set highlight(
  fill: rgb("#c1c7c3"),
  stroke: rgb("#6b6a6a"),
  extent: 2pt,
  radius: 0.2em, 
  ) 

#show: doc => report(
  title: "Modulações GMSK e CPM",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "19 de Agosto de 2024",
  doc,
)

= Introdução: 

Neste relatório, iremos abordar as modulações GMSK (Gaussian Minimum Shift Keying) e CPM (Continuous Phase Modulation), que são técnicas de modulação digital utilizadas em sistemas de comunicação móveis e sem fio.

= Modulação GMSK: 

A modulação GMSK (Gaussian Minimum Shift Keying) é uma técnica de modulação digital que é utilizada em sistemas de comunicação móveis, como o GSM (Global System for Mobile Communications), implementado na técnologia do 2G. 

A modulação GMSK é uma variação da modulação MSK (Minimum Shif Keying) desenvolvida na década de 50 pelos desenvolvedores da Collins Radio.  A MSK é caracterisada por ser uma modulação de deslocamento mínimo de frequência, onde a frequência da portadora é deslocada de acordo com os bits de entrada. Vamos verificar suas princiapais vantagens e desvantagens em relação a modulação MSK.

== Desvantagens:

Uma das principais desvantagens, segundo [1] _In GMSK systems the BTb product refers to the pre-modulation Gaussian filter cut-off frequency. A BTb = 0.3 and BTb = 0.39 will lead to an increased spectral efficiency, as compared to BTb = 0.5, however, a more complex implementation and increased sensitivity to CII and to radio propagation_, a utilização do filtro gaussiano para a suavização das transições de fase no GMSK aumenta a memória de modulação no sistema e assim, podendo causar uma maior interferência intersimbólica. 

#figure(
  figure(
    rect(image("./pictures/3.png")),
    numbering: none,
    caption: [Suavização das transições  GMSK causada pela memoria do filtro gaussiano]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como apresentado acima, podemos verificar que a utilização do filtro gaussiano tornam mais suaves as transições entre os bits, oque pode dificultar a identificação do sinal recebido especialmente em sistemas com alta taxa de transmissão e com escorregamento de fase, onde pode-se coletar amostras do sinal em momentos incorretos. 

Dessa forma, fica mais difícil a diferenciação entre diferentes valores de dados transmitidos e necessitando de algoritmos de equalização de canal mais complexos. 

== Vantagens: 

A principal vatagem da modulação GMSK em relação a MSK é a utilização de um filtro gaussiano para suavizar as transições de fase, o que resulta em uma *maior eficiência espectral e uma melhor imunidade a interferências*.

O livro [1] também apresenta uma relação entre a relação entre a densidade espectral de potência e diferentes valores de BT (bandwidth-time product) para a modulação GMSK. 

#figure(
  figure(
    rect(image("./pictures/2.png")),
    numbering: none,
    caption: [Comparativo entre a modulação MSK e GMSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Nota-se pelos valores apresentados nas linhas 11 e 12, que quanto menor o valor de BT, maior a eficiência espectral da modulação, pois sua densidade espectral de potência é mais concentrada em torno da frequência central. 

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: [Comparativo entre a modulação MSK e GMSK]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Essa relação torna-se bastante visivel na imagem apresentada acima, onde os valores de BT "0.3" e "0.5" apresentam uma maior eficiência espectral em relação a modulação MSK. 

Segundo o livro [1] _Use of NLA power amplifier efficiency reasonably robust performance (Le., BER = 10-3; CIN = 30 dB) coherent and noncoherent detection possible; chips (silicon VLSI) available European standards use GMSK; and potential for simplified (somewhat) CR - synchronization. _, outra grande vantagem da modulação GMSK é a possibilidade de utilização de amplificadores de potência não lineares, o que resulta em uma maior eficiência energética do sistema.

= Modulação CPM:

A modulação CPM (Continuous Phase Modulation) é uma técnica de modulação digital que tem como principal caracteristica a continuidade da fase do sinal modulado. A modulação CPM é uma variação da modulação MSK, onde a continuidade da fase é mantida entre os símbolos transmitidos.

Segundo [2] _"Each symbol is modulated by gradually changing the phase of the carrier from the starting value to the final value, over the symbol duration. The modulation and demodulation of CPM is complicated by the fact that the initial phase of each symbol is determined by the cumulative total phase of all previous transmitted symbols, which is known as the phase memory."_ Essa modulação utiliza uma memoria de fase para gradualmente alterar a fase do sinal modulado, o que resulta em uma maior imunidade a interferências e uma maior eficiência espectral.

#figure(
  figure(
    rect(image("./pictures/4.png")),
    numbering: none,
    caption: [Diagrama de blocos de um sistema de comunicação CPM]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Como apresentado na imagem acima, o processo de modulação CPM é bastante similar ao processo de modulação MSK, onde a fase do sinal modulado é alterada de acordo com os bits de entrada. 

== Destavanagens:

A principal desvantagem segundo a wikipedia [2] _"Therefore, the optimal receiver cannot make decisions on any isolated symbol without taking the entire sequence of transmitted symbols into account."_ é a necessidade de se levar em conta todos os símbolos transmitidos para a tomada de decisão no lado do receptor, o que por consequência necessita de uma mémoria para guardar todos os simbolos recebidos e assim, aumentando a complexidade do sistema.



== Vantagens: 

A principal vantagem da modulação CPM é a sua caracteristica de suavidade na variação da fase na transmissão do sinal pelo meio, isso resulta em uma maior imunidade a interferências causadas por componentes de alta frequência geradas pela variação abrupta de potência e também lhe conferem uma maior eficiência espectral.

Segundo o livro [4] _"The CPFSK modulation in this paper is a special case of the more general class of continuous phase modulation (CPM) [9]. Because the signals defined in (1) are zero outside the symbol epoch [0, Ts), the CPFSK modulation in this paper is full-response."_a modulação CPM pode também ser aplicada junto a FSK (Frequency Shift Keying) para gerar uma outra técnica de modulaçã denominiada (CPFSK) que é utilizada em sistemas de comunicação. 

Essa técnica de modulação pode ser aplicada em diversos sistemas de comunicação baseados em FHSS (Frequency Hopping Spread Spectrum) e DSSS (Direct Sequence Spread Spectrum) para gerar uma maior eficiência espectral e uma maior imunidade a interferências, como comentado pelo autor [2] _"While the CPFSK modulation described in this paper can
be used for a variety of applications, it is especially attractive for frequency hopping spread spectrum (FHSS) systems"_


= Conclusão: 

A partir do estudo das modulações GMSK e CPM, podemos concluir que ambas as técnicas de modulação apresentam vantagens e desvantagens. 


A modulação GMSK é uma técnica de modulação que utiliza um filtro gaussiano para suavizar as transições de fase, o que resulta em uma maior eficiência espectral e uma maior imunidade a interferências. Já a modulação CPM é uma técnica de modulação que mantém a continuidade da fase do sinal modulado, o que resulta em uma maior imunidade a interferências e uma maior eficiência espectral.


= Referências Bibliográficas:

- [1] - #link("https://www.ieee802.org/11/Documents/DocumentArchives/1993_docs/1193097_scan.pdf")[Feher, K. (1993, July). FQPSK: A modulation-power efficient RF amplification proposal for increased spectral efficiency and capacity GMSK and Π/4-QPSK compatible PHY standard. In IEEE 802.11 Wireless Access Methods Phys. Layer Spec. Doc.]

- [2] - #link("https://en.wikipedia.org/wiki/Continuous_phase_modulation")[wikipedia - Continuous_phase_modulation]

- [3] - #link("https://www.electronics-notes.com/articles/radio/modulation/what-is-gmsk-gaussian-minimum-shift-keying.php")[Gaussian Minimum Shift Keying, GMSK is a form of modulation based on frequency shift keying that has no phase discontinuities and provides efficient use of spectrum as well as enabling high efficiency radio power amplifiers.]