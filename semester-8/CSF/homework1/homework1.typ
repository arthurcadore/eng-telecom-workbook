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
  title: "Calculo de Transmissão/Recepção em ERBs",
  subtitle: "Comunicações Sem Fio",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "14 de Outubro de 2024",
  doc,
)


= Introdução
 
Neste documento, serão resolvidos alguns exercícios de comunicações sem fio, com o intuito de aplicar os conhecimentos adquiridos em sala de aula.

= Questão 1: 

Em uma área rural, duas estações rádio base (ERB1 e ERB2) cobrem um segmento reto de uma rodovia. Um terminal móvel se desloca sobre a rodovia, no segmento que liga a ERB1 à ERB2, com velocidade uniforme de 90 km/h, enquanto mantém uma chamada servida pela ERB1. A direção de movimento é tal que o móvel se afasta de ERB1 enquanto se aproxima de ERB2. As duas ERBs estão distantes 2 km. Quando o móvel está a 500m da ERB1, a intensidade de sinal é de -100 dBm. O nível mínimo de sinal necessário para manter a chamada é -120 dBm. 

Dados da questão: 

- dt: 2 km
- V = 90 km/h
- d1 = 500 m
- Pr1 = -100 dBm
- Prmin = -120 dBm

== Distância máxima sobre o segmento da rodovia: 

Qual distância máxima d sobre o segmento da rodovia deve ocorrer um handoff da chamada de ERB1 para ERB2 (considere a ERB1 posicionada em d=0). 

Considerando que a potência recebida é igual a potência de sensibilidade do receptor, temos que:

$
P_r = P_o - 10n log(d/d_0) -> -120 = -100 - 40log(d) + 40log(500) 
$

$
-(-120 + 100 - 107,95)/40 = log(d) -> log(d) = 3,198
$

Calculando d temos que:

$
d = 10^(3,198) = 1589,4 m
$

== Efetuar o handoff com 5 segundos de delay:

Considerando que o sistema celular leva 5 segundos para processar todas as informações e efetuar o handoff, sugira o valor mínimo de um limiar de iniciação do processo de handoff (em dBm) para evitar a queda da chamada. Considere que neste ambiente de opagação o expoente de perda de percurso vale n=4, podendo-se utilizar um modelo simplificado de perda de percurso.

Primeiro precisamos calcular a distância de handoff entre as torres, para isso, calculamos a velocidade do veiculo em m/s e o tempo que ele leva para percorrer a distância entre as torres:

$ d_"handoff" = V * t $

Desta forma temos que: 

$ V = (90 "km")/h -> (25 m)/s $

Como o tempo de handoff 5 segundos temos que: 
 $
d_"handoff" = V . t = 25 .  5 = 125 m
$


Caso consideremos que o handoff ocorra em 5 segundos, devemos deduzir essa distância da distância total entre as torres, temos que:

$
d_"handoff" = 1589,4 m - 125 m = 1464,4 m
$

Também devemos considerar que para limitar o handoff, deve-se deduzir a potência na área de sobreposição do sinal, portanto: 

$
gamma_"HO" = P_o - 10n log((d_max - d_"HO") /d_0) -> -118,57"dBm"
$


= Questão 2:

Em um sistema de telefonia móvel a relação sinal-ruído (SNR) mínima para recepção com boa qualidade é de 10 dB. Foi medido que a potência de ruído térmico no telefone móvel é de –120
dBm. Considere ainda os seguintes parâmetros: 

- (a) ganhos das antenas transmissora e receptora: 3 dBi
- (b) frequência de operação: 800 MHz 
- (c) altura da antena da estação base 20m; 
- (d) altura da antena da estação móvel: 1,5 m; 
- (e) potência de alimentação na antena da base: 1 W. 

Calcule o alcance de um sinal de rádio realizado nestas condições utilizando: 

== Modelo de propagação do espaço-livre 

Para calcular o primeiro modelo, temos a seguinte formula: (Considerando L = 1  )

$
P_r(d) = (P_t . G_t . G_r . lambda^2) / ((4 . pi)^2 . d^2 . L) -> P_r(d) = (P_t . G_t . G_r . lambda^2) / ((4 . pi)^2 . d^2)  
$

Calculando lambda, temos que:

$
lambda = (3 . 10^8) / (800 . 10^6 ) = 0,375 m  -> lambda^2 = 0,375^2 = 0,140625
$

Aplicando os valores dados pela questão, temos que: 

$
10^(-14) = ( 1 . 2 . 2 . 0,140625) / ((4.pi)^2 d^2) -> 10^(-14) = (0,5625) / (157,91 d^2)
$

Dessa forma, temos que: 

$
1,579 . 10^12 d^2 = 0,5625 -> d^2 = 3,561^11 -> d = 596.741,149m -> 596,741 "km"
$

== Modelo de propagação de 2 raios 

Para o modelo de raios, temos que: 

$
 P_r(d) = P_t . G_t . G_r . (h_1^2 . h_2^2) / d^4
$

Dessa forma temos que: 

$
"SNR" = P_r - P_n -> 10 = p - (-120) -> p = -110 "dBm"
$

Aplicando na formula, temos que: 

$
10^(-14) = 1 . 2 . 2 . (20^2 . 1,5^2 ) / d^4 -> d^4 = 3600 / 10^(-14) -> 3,600 . 10^14 -> 3,6 . 10^17
$

Dessa forma temos que:

$
d = (3,6 . 10^17)^(1/4) = 24495m -> 24,495 "km"
$

== Modelo COST231-Hata para cidade grande.

Para o modelo de Hata, temos que:

$
A(h_r) = 3,2 log^2(11,75h_r) - 4,97
$

Aplicando os valores dados pela questão, temos que:

$
A(1,5) = 3,2 log^2(11,75 . 1,5) - 4,97 -> A(1,5) = 3,2 log^2(17,625) - 4,97 
$

Dessa forma, temos que: 

$
A(1,5) = 3,2 . 1,552 - 4,97 -> A(1,5) = 4,969 - 4,97 = 0,001
$

$
P_l = 30 + 3 + 3 + 110 -> P_l = 146 "dB"
$

Aplicando na formula de perda de percurso, temos que:

$
1 = 69,55   + 26,16log(f) - 13,82log(h_t) - A(h_r) + (44,9 - 6,55log(h_t))log(d) 
$

$
146 = 69,55  + 75,86 - 17,96 + 36,38 log(d)
$

$
log(d) = (146 - 69,55 - 75,86 + 17,96) / (36,38) -> log(d) = 0,51
$

Dessa forma, temos que:

$
d = 10^(0,51) = 3,16 "km"
$
= Questão 5: 

Sejam dados: pa=15 W, Gt=12 dBi, Gr=3 dBi. Seja a potência de ruído térmico no receptor –120 dBm. Qual o máximo raio de célula para o qual uma relação sinal-ruído (SNR) de 20 dB pode ser garantida em 95% do perímetro da borda da célula? Assuma n=4, =8 dB, f=900 MHz. Calcule uma perda de percurso de referência média em d0=1 km utilizando o modelo de perda de percurso COST231-Hata sabendo-se que a altura da antena da ERB é de 20 m e a altura da antena do terminal móvel é de 1,8 m. O ambiente em questão é de área suburbana de uma cidade.

= Questão 8: 

Uma operadora de telefonia celular pretende cobrir uma grande cidade com área de 2500 km2 usando ERBs com pa=20 W e Gt=3 dBi. Os terminais móveis têm Gr=0 dBi. Determinar o número de ERBs omnidirecionais necessárias para cobrir a cidade quando é esperado que 90% da periferia das células experimente cobertura de sinal a -90 dBm. Assuma =8 dB e f=900 MHz. O modelo de COST231-Hata é válido neste ambiente. Você pode calcular uma potência média de referência em d0=1 km usando os seguintes parâmetros: hb=20 m, hm=1,8 m. 

= Questão 9:

Considere uma situação de propagação em ambiente interior (indoor). A antena transmissora encontra-se inicialmente fora da edificação e a perda de penetração estimada é 30 dB. O receptor encontra-se no piso térreo e o caminho do sinal até o mesmo atravessa uma partição horizontal e uma vertical cuja perda estimada é de 15 dB por partição. A antena transmissora encontra-se a 500 m da parede externa da edificação, sendo a frequência de operação f=900 MHz, hb=20 m, hm=1,8 m, podendo-se utilizar o modelo de COST231-Hata urbano para calcular uma perda de percurso de referência. Internamente à edificação a perda de percurso é proporcional a $d^-2,5$ além das perdas de penetração e partição já mencionadas. A distância interna entre a parede interna do edifício e o receptor é de 10 metros. Calcule a perda de percurso total nesta situação entre o transmissor e o receptor.

= Questão 10: 

O provimento de cobertura celular em áreas rurais e remotas é um desafio para países como o Brasil, de grande extensão territorial. Considere uma situação em que um assinante de serviço de comunicação móvel encontra-se a 10 km da ERB. Faça uma análise dos enlaces de descida e de subida considerando os seguintes parâmetros: potências EIRP: 37 dBm na ERB; 27 dBm no TM; despreze demais ganhos e perdas no transmissor e no receptor; a potência do ruído térmico vale Pn=-120 dBm; perda de percurso pode ser modelada como L(d)=120+30log(d), sendo d a distância ERB-TM em [km]; a razão sinal ruído mínima para estabelecer o enlace é 5 dB. Analise o equilíbrio de desempenho entre os enlaces de subida e de descida. A operadora pode instalar, quando necessário, um repetidor (relay) que regenera o sinal da ERB ou do TM, transmitindo-o novamente em posição mais favorável. Suponha que o relay opera com mesma potência EIRP do TM. Nessas condições avalie a necessidade de instalar um relay para atuar em um dos enlaces. Além disso, determine uma distância ou faixa de distâncias para a instalação do relay de forma a beneficiar a comunicação rural em questão. 

== Resolução: 

Para resolvermos a questão inicialmente calculamos a SNR: 
$
"SNR" = P_s - P_n -> 5 = P_s - (-120) -> P_s = -115 "dBm"
$

Dessa forma, temos que: 

$
l_p(10) = 120 + 30log(10) = 150 "dB"
$

Assim, podemos calcular a potência recebida no terminal móvel:

$
p_t_"Erb"_"tm" = 37 - 150 = -113 "dBm"
$

Da mesma maneira, podemos calcular a recebida na ERB pelo terminal movel: 

$
p_t_"tm"_"Erb" = 27 - 150 = -123 "dBm"
$

A partir dessa verificação, podemos determinar a faixa de distância para instalação do relay, pois a potência recebida no terminal móvel é menor que a potência minima de recepção, o que indica a necessidade de instalação de um relay.

$
-115 = 27 - L_p -> L_p = 142 "dB"
$

$
142 = 120 + 30 log(d) = 22/30 = log(d) -> d = 10^(22/30) = 10^0,733 = 5,5 "km"
$


= Questão 13: 

Um sistema móvel celular é montado em uma pequena cidade com o intuito de prover serviço de acesso à internet por banda larga móvel. Vislumbra-se o uso em terminais estacionários como computadores portáteis e do tipo tablet. Uma única célula foi instalada visando cobrir toda a área do município. O sistema provê degraus de taxa no enlace de descida de acordo com um esquema de modulação e codificação adaptativa. Uma aproximação razoável da taxa bruta de download desse sistema é dada pela função $R("SNR")="SNR"/5$ [Mbps], sendo $"SNR">0$ [dB] a razão sinal ruído. 

A transmissão é interrompida se $"SNR"<=0$. A taxa máxima do sistema satura em 10 Mbps. A operadora do serviço precisa dimensionar o raio de célula para fins de informação oficial à agência reguladora. Esta por sua vez requer que a taxa mínima oferecida para que se considere o serviço como de banda larga seja de 600 kbps. Esta vazão precisa ser observada em pelo menos 98% do perímetro definido como sendo a borda da célula. 

Considerando que o ambiente de propagação é caracterizado por uma perda de percurso que segue o modelo simplificado com n=3,5 e o desvio padrão do desvanecimento de larga escala na região é assumido em $rho$ = 8 dB, dimensione o raio da célula a ser informado. Outras informações do projeto: 

- potência do amplificador da antena transmissora: 20 W; 
- ganho da antena transmissora: 10 dBi; 
- ganho da antena receptora e demais perdas e ganhos de transmissão e recepção: 0 dB; 
- Pr(100 m) = - 45 dBm; (potência de referência medida a uma distância de 100 m da antena transmissora)
- potência do ruído térmico no receptor: -110 dBm. 

== Resolução: 


$
"SNR" = 3"dB" -> "SNR" = P_s - P_n -> 3 = P_s - (-110) -> P_s = -107 "dBm"
$

Dessa forma, aplicando na formula temos que: 

$
P_s = P_t + G_t - P_l -> -107 = 43 + 10 - P_l -> P_l = 160 "dB"
$

$
 P_o = P_t - P_l (d_o) -> -45 = 43 - P_l(d_o) -> P_l(d_o) = 88 "dB"
$

$
P_l(d) = P_l(d_o) + 10n log(d/d_o) -> 160 = 88 + 35 log(d) - 35log(100) + 8 
$

Dessa forma temos que: 

$
(160 - 88 - 8 + 70) / 35 = log(d) -> log(d) = 3,828 -> 10^(3,828) = 6,729 "km"
$

Considerando que a questão pede 98% do perímetro da célula, temos que:

$
d = 0,98 * 6,729 = 6,59 "km"
$

= Questão 17: 

Você foi designado para projetar um sistema de transmissão sem fio de 4ª geração. Trata-se de um sistema voltado exclusivamente para transmissão de dados sem fio. A taxa de transmissão em uma ERB no enlace de descida deste sistema é função da razão sinal-ruído (SNR, em dB) e pode ser aproximada pela seguinte expressão: $R("SNR")="SNR"$, para $0=<"SNR"<=50$ dB; $R("SNR")=0$, para $"SNR"<0 "dB"$; $R("SNR")=50$, para $"SNR">50$ dB, em que R é a taxa de transmissão em Megabits por segundo. 

Nesta primeira etapa do projeto uma única ERB será instalada no centro de uma cidade pequena e objetiva cobrir uma área circular de 10 km de raio. A Prefeitura da cidade está contratando o serviço e quer saber de antemão de você: 

Dados para o projeto: 

- perda de referência em d0=1km é 120 dB; 
- potência de ruído térmico Pn = −120 dBm; 
- modelo de propagação simplificado com n=3,5; 
- potência EIRP de transmissão da ERB pt=20W. 

Despreze outros ganhos, perdas e interferências. 

== Taxa média observada na periferia da cidade (borda da célula); 

Para calcular a taxa média observada na periferia da cidade, utilizamos a formula de perda de percurso:

$
P_l(d) = P_l("d0") + 10n log(d/10) 
$

$
P_l(10) = 120 + 35 log(10/1) -> P_l(10) = 155 "dB"
$

Dessa forma, aplicando na formula temos que:

$
P_r = P_t + G_t + G_r - P_l -> P_r = 43 - 155 = -112 "dBm" 
$

Dessa forma, podemos calcular a SNR do sinal nesta distância:

$
"SNR" = P_s - P_n -> "SNR" = -112 - (-120) = 8 "dB" 
$

Assim, como dado pela questão, o valor da taxa é: 

$
R"(SNR)" = "SNR" -> R"(8)" = 8 "Mbps"
$


== Taxa média observada em toda a área coberta. 

Para calcular a taxa coberta em toda a cidade o mesmo algoritmo apresentado acima foi utilizado em um script matlab para calcular a taxa de transmissão com base no distânciamento da ERB.

#sourcecode[```matlab
close all; clear all; clc;

%% entradas da questão: 
pt = 43;
ruido = -120;
d0 = 0;
df = 10000;

%% criando vetor de zeros para utilizar no laço 
r = zeros(1, 10e3 +1);

%% Laço de repetição para calcular de 0 á 10km
for d = d0 : df
    pl = 120 + (35*log10(d/1e3));
    pr = pt - pl;
    snr = pr -ruido;

    if 0 <= snr && snr <=50
        r(d+1) = snr;
    elseif snr < 0
        r(d+1) = 0;
    else
        r(d+1) = 50;
    end
end

figure;
bar(r);
title('Taxa observada no ráio de cobertura');
xlabel('Distância em metros');
ylabel('Taxa [Mbps]');
grid on;
```]

#figure(
  figure(
    rect(image("./pictures/17.png")),
    numbering: none,
    caption: []
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)