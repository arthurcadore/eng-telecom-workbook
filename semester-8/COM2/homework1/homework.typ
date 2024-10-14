#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Diversidade de Antenas",
  subtitle: "Sistemas de Comunicação II",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "14 de Outubro de 2024",
  doc,
)


= Introdução

O objetivo deste documento é apresentar as técnicas de diversidade de antenas utilizadas em sistemas de comunicação sem fio. A diversidade de antenas é uma tecnologia que permite melhorar a qualidade do sinal enviado pelo tranmissor em sistemas de comunicação, reduzindo a probabilidade de erro de bit e aumentando a eficiência da comunicação.

= Técnicas de Diversidade de Antenas: 

== Maximum Ratio Combining (MRC)

O MRC é uma técnica de combinação de sinais que utiliza pesos proporcionais à potência do sinal recebido em cada antena como base para maximizar a SNR (Signal-Noise Ratio). 

Com base em uma SNR aumentada em relação a um sistema com apenas uma antena, o MRC é capaz de melhorar a qualidade do sinal recebido, reduzindo a probabilidade de erro de bit. O MRC é dividido nas seguintes etapas: 

=== Recepção: 

A primeira etapa do MRC é a recepção dos sinais transmitidos pelas antenas. Neste caso, consideramos que o sinal recebido em cada antena é composto por um sinal desejado e um ruído aditivo. 

Cada sinal coresponde há uma antena, ou seja, se temos 2 antenas, teremos 2 sinais recebidos.

=== Ganho de Combinação:

Cada sinal recebido é associado a um ganho, que é calculado com base no valor conjugado do coeficiente do canal de cada antena, desta forma temos que: 

$
alpha_i = h_i^\*
$

Tal que: 

- $alpha_i$ é o ganho associado ao sinal recebido na antena i
- $h_i$ é o coeficiente do canal da antena i

=== Combinação dos Sinais:

Para calcular o valor combinado de todos os sinais recebidos, é necessário aplicar um somatório de todos os termos (sinais) de entrada: 

$
y = sum^N_(i=1) alpha_i x_i
$

Tal que:

- $y$ é o sinal combinado
- $N$ é o número de antenas
- $alpha_i$ é o ganho associado ao sinal recebido na antena i
- $x_i$ é o sinal recebido na antena i


=== SNR Resultante: 

A SNR total pode ser obtida através do somatório das SNRs individuais de cada termo: 

$
"SNR"_("total") = sum^N_(i=1) "SNR"_i
$

Tal que: 

- "SNR" é a relação sinal-ruído do sinal combinado
- "$"SNR"_i$" é a relação sinal-ruído do sinal recebido na antena i


== Selection Combining (SC)

O SC é uma técnica de diversidade de antenas que seleciona o sinal com a maior SNR para ser utilizado na recepção do sinal propriamente dito. 

Desta forma, caso hajam 3 chains por exemplo, o SC irá selecionar o sinal com a melhor qualidade/Definição (maior SNR) entre as 3 antenas para ser utilizado na interpretação dos dados transmitidos.

=== Recepção:

A primeira etapa do SC é a recepção dos sinais transmitidos pelas antenas. Neste caso, consideramos que o sinal recebido em cada antena é composto por um sinal desejado e um ruído aditivo.

=== Avaliação de Qualidade:

Para avaliar a qualidade de cada sinal recebido, é necessário calcular a SNR de cada sinal. O calculo da SNR é feito simplesmente dividindo a potência do sinal pelo ruído aditivo: 

$
"SNR"_i = (P_s)/(P_n)
$

Ou realizando sua subtração, caso a SNR seja dada em dB:

$
"SNR"_i ("dB") = P_s - P_n
$

=== Seleção do Sinal: 

O sinal a ser utilizado na amostragem / quantização / interpretacao dos dados é aquele que possui a maior SNR entre todos os sinais recebidos, portanto: 

$
y = max("SNR_i")
$ 

=== SNR Resultante: 

Por fim, a SNR total do sistema é dada pela SNR do sinal selecionado:

$
"SNR"_("total") = "SNR"_("max")
$

== Equal Gain Combining (EGC)

O ECG é uma técnica de diversidade de antenas que combina os sinais recebidos de cada antena com mesmo ganho, ou seja, sem aplicar pesos proporcionais à potência do sinal recebido em cada antena, essa técnica permite aumentar a SNR do sinal recebido em relação a um sistema com apenas uma antena.

=== Recepção: 

A primeira etapa do EGC é a recepção dos sinais transmitidos pelas antenas. Neste caso, consideramos que o sinal recebido em cada antena é composto por um sinal desejado e um ruído aditivo.


=== Combinação dos Sinais: 

Para calcular o valor combinado de todos os sinais recebidos, é necessário aplicar um somatório de todos os termos (sinais) de entrada:

$
y = sum^N_(i=1) x_i
$

Neste ponto é fundamental garantir que os sinais de entrada estejam em fase, caso contrário a combinação dos sinais pode resultar em cancelamento de sinal, reduzindo a SNR do sinal combinado ao invés de aumentar, oque pioraria a qualidade do sinal recebido.


=== SNR Resultante:

A SNR total pode ser obtida através do somatório das SNRs individuais de cada termo:

$
"SNR"_("total") = sum^N_(i=1) "SNR"_i
$

Desta forma, a SNR total sempre será maior que a SNR de cada sinal individualmente, oque resulta em uma melhora na qualidade do sinal recebido.

== Alamouti 

O Alamouti é uma técnica de diversidade de antenas que utiliza a técnica de codificação de espaço-tempo para transmitir dois sinais em um único intervalo de tempo. 

Essa técnica baseia-se na transmissão de dois sinais em antenas diferentes, com a segunda antena transmitindo o sinal conjugado do primeiro. 

As antenas receptoras recebem os sinais transmitidos e, através de um processo de combinação, são capazes de recuperar os sinais originais transmitidos, formando uma espécie de "cruzamento" entre os sinais transmitidos e recebidos.

=== Transmissão: 

Suponhamos que hajam duas informações a serem transmitidas, $x_1$ e $x_2$. O Alamouti transmite essas informações em duas (ou mais) antenas diferentes, operando de maneira diferente em instantes de tempo diferentes, vejamos um exemplo:

==== Instante t=1: 

Neste intervalo de tempo temos que: 

- $A_1$ transmite $x_1$
- $A_2$ transmite $x_2$

==== Instante t=2 (instante  seguinte): 

Neste momento, temos que a transmissão se dá pelo conjugado dos sinais transmitidos no instante anterior, ou seja:

- $A_1$ transmite $-x_2^*$
- $A_2$ transmite $x_1^*$

O processo se repete para todas as mensagens a serem enviadas pelo transmissor de sinal usando a técnica Alamouti. Onde cada mensagem ocupa dois intervalos de tempo para ser transmitida com a redundância espaço-temporal necessária para a recuperação do sinal original.

=== Recepção: 

No processo de recepção, as antenas receptoras recebem o sinal enviado tanto nos instantes de t=1 e t=2, e através de um processo de combinação, são capazes de recuperar os sinais originais transmitidos: 

$
X_1 = h_1 x_1 + h_2 x_2 + n_1
$

$
X_2 = h_1(-x_2^*) + h_2 x_1^* + n_2
$

Tal que: 

- $X_1$ e $X_2$ são os sinais recebidos
- $x_1$ e $x_2$ são os sinais originais transmitidos
- $h_1$ e $h_2$ são os coeficientes do canal das antenas receptoras
- $n_1$ e $n_2$ são os ruídos aditivos

= Conclusão: 

As técnicas de diversidade de antenas são fundamentais para melhorar a qualidade do sinal recebido em sistemas de comunicação sem fio. O MRC, SC, EGC e Alamouti são exemplos de técnicas que utilizam a diversidade de antenas para aumentar a SNR do sinal recebido, reduzindo a probabilidade de erro de bit e melhorando a qualidade da comunicação.



= Referências

- #link("https://www.researchgate.net/profile/Mohamed_Mourad_Lafifi/post/if_anyone_can_support_with_matlab_code_to_plot_the_CDF_of_SINR_in_massive_MIMO/attachment/59d64a8479197b80779a4cc7/AS%3A475667000238080%401490419258391/download/SampleChapters+Wireless+Communications.pdf", "Goldsmith, A. (2005). Wireless Communications. Cambridge University Press.")

- #link("https://ieeexplore.ieee.org/document/730453", "Alamouti, S. M. (1998). A simple transmit diversity technique for wireless communications. IEEE Journal on Selected Areas in Communications, 16(8), 1451-1458.")