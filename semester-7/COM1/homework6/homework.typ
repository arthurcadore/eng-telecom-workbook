#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Atividade Extra",
  subtitle: "Sistemas de Comunicação I",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "30 de Junho de 2024",
  doc,
)

= Questão 1: 

== Realize os seguintes procedimentos: 

- 1. Gerar uma sequência de bits aleatórios

#sourcecode[```matlab
pkg load signal;

% quantidade de bits que serão gerados;
num_bits = 1000;

% Gerando bits aleatórios com rand inteiro;
bits = randi([0 1], 1, num_bits);
```]

- 2. Mapear a sequência de bits para símbolos utilizando uma sinalização 4-PAM.

#sourcecode[```matlab
% Mapeamento dos bits para símbolos 4-PAM

% Para esse mapeamento utilizei a seguinte lógica: 

% 00 -> -3
% 01 -> -1
% 11 -> 1
% 10 -> 3

symbols = zeros(1, num_bits/2);
for i = 1:2:num_bits
    if bits(i) == 0 && bits(i+1) == 0
        symbols((i+1)/2) = -3;
    elseif bits(i) == 0 && bits(i+1) == 1
        symbols((i+1)/2) = -1;
    elseif bits(i) == 1 && bits(i+1) == 1
        symbols((i+1)/2) = 1;
    else
        symbols((i+1)/2) = 3;
    end
end
```]


- 3. Aplicar o filtro cosseno levantado com um fator de roll-off especificado (r) e uma taxa de amostragem adequada.

#sourcecode[```matlab
% Parâmetros do filtro cosseno levantado
roll_off = 0.25; 

% Taxa de amostragem
fs = 8 

% Duração do filtro;
T = 6;  

% Gerando o vetor de tempo;
t = -T/2:1/fs:T/2;

% Geração do filtro cosseno levantado
h = (sin(pi*t*(1-roll_off)) + 4*roll_off*t.*cos(pi*t*(1+roll_off))) ./ (pi*t.*(1-(4*roll_off*t).^2));

h(t==0) = (1-roll_off)+4*roll_off/pi;

h(abs(t)==1/(4*roll_off)) = roll_off/sqrt(2)*((1+2/pi)*sin(pi/(4*roll_off)) + (1-2/pi)*cos(pi/(4*roll_off)));

% Aumentando a quantidade de Amostras com o upsample para normalizar a taxa de amostragem
upsampled_symbols = upsample(symbols, fs);
filtered_signal = conv(upsampled_symbols, h, 'same');
```]

- 4. Plotar a forma de onda resultante no domínio do tempo.

#sourcecode[```matlab
% Plot da forma de onda no domínio do tempo
figure;
subplot(2,1,1);
plot(filtered_signal);
title('Forma de Onda no Domínio do Tempo');
xlabel('Amostras');
ylabel('Amplitude');
```]

- 5. Calcular e plotar a densidade espectral de potência do sinal filtrado.

#sourcecode[```matlab
% Cálculo e plot da densidade espectral de potência
[pxx, f] = pwelch(filtered_signal, [], [], [], fs);

subplot(2,1,2);
plot(f-pi,10*log10(fftshift(pxx)));
title('Densidade Espectral de Potência');
xlabel('Frequência Normalizada');
ylabel('Densidade Espectral de Potência');
```]

#figure(
  figure(
    rect(image("./pictures/q1.png")),
    numbering: none,
    caption: [Forma de onda no domínio do tempo e densidade espectral de potência do sinal filtrado.]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Responda as questões: 

- Qual o efeito do fator de roll-off na forma de onda do sinal e na densidade espectral de potência?

O fator de roll-off afeta a forma de onda do sinal deixando ele mais suavisado ou variando mais drasticamente. Um exemplo claro dessa diferença é uma onda senoidal (onde a trasição é a mais suave possivel ou em uma onda quadrada (onde a transição é a mais rápida possível entre o valor negativo e positivo).

Quanto menor o roll-off, mais proximo de uma onda quadrada, ou seja, com transições rápidas a onda se torna, isso melhora sua eficiência no espectro, pois concentra sua potência em uma determinada região. 

- Como a taxa de amostragem afeta a qualidade da formatação do sinal?

A taxa de amostragem afeta diretamente a qualidade da formatação do sinal, pois quanto maior a taxa de amostragem, mais amostras do sinal são coletadas e mais detalhes do sinal são amostrados. 

Isso é muito importante para garantir que o sinal seja corretamente amostrado e que não haja perda de informações importantes. Caso a taxa de amostragem seja muito baixa, o sinal pode ser subamostrado (ou seja, tão poucas amostras que o sinal não pode ser compreendido no receptor) e informações importantes podem ser perdidas.

= Questão 2: 

Responda as seguintes perguntas:

== Item 1:  

Explique o princípio de operação de um filtro casado e sua importância na detecção de sinais.

O filtro casado é um filtro que é projetado para maximizar a relação sinal-ruído (SNR) na saída do receptor para um determinado tipo de sinal.

Ele é projetado para ser o filtro que melhor se adapta ao sinal transmitido, ou seja, em uma transmissão FM por exemplo, podemos utilizar um filtro que "copie" de certa maneira as caracteristicas de transmissão que o sinal poderá ter, sua largura no espectro, formato de transmissão, componente da onda que irá variar (no caso do FM a frequência) de forma a maximizar a SNR para esse tipo de sinal. 

== Item 2: 

Quais são as vantagens e desvantagens de aumentar o número de níveis M em M-PAM?

A principal vantagem em aumentar o número de níveis M em M-PAM é que a eficiência espectral do sistema aumenta, ou seja, é possivel mandar mais informação pelo meio de transmissão a partir de uma mesma "região do espectro"

Isso é possivel pois a quantidade de bits transmitidos por símbolo aumenta mas sem aumentar o consumo do espectro, o que permite transmitir mais informações em um determinado intervalo de tempo.

Por outro lado, a principal desvantagem de aumentar o número de níveis M em M-PAM é que a sensibilidade do sistema ao ruído aumenta e também é muito mais dificil implementar o circuito de transmissão/recepção para operar com uma densidade de simbolos mais alta, ou seja, quanto mais níveis M, mais sensível o sistema se torna ao ruído, o que pode levar a uma maior probabilidade de erro de bit.

Um exemplo de transmissão que aumenta a densidade mas não necessáriamente possui desvantagem na recepção é passar de FDM para OFDM, onde ao adicionar uma componente de transmissão ortogonal aumentamos a quantidade de portadoras para a transmissão mas sem necessáriamente aumentar a sensibilidade ao ruído.

== Item 3: 

Defina o Pulso Ideal de Nyquist e descreva suas propriedades principais.

O pulso de Nyquist é um pulso que é projetado para ser o mais eficiente possível em termos de eficiência espectral, ou seja, ele é projetado para maximizar a quantidade de informação transmitida por um determinado intervalo de tempo.

Esse pulso é utilizado para servir de base para a transmissão de sinais digitais, pois ele é capaz de transmitir a maior quantidade de informação possível em um determinado intervalo de tempo, sem que haja interferência entre os símbolos transmitidos.

== Item 4: 

Explique o que é a Inter-Symbol Interference (ISI) e como ela afeta a performance de um sistema de comunicação digital

A interferência entre simbolos é um problema que ocorre quando um símbolo transmitido interfere com o símbolo seguinte, ou seja, quando a transmissão de um símbolo não é completamente finalizada antes que o próximo símbolo seja transmitido.

Isso pode ocorrer devido a diversos fatores, como atrasos na transmissão, reflexões do sinal, interferência de outros sinais, entre outros.

Para evitar esse problema em redes wi-fi por exemplo é utilizado um parâmetro denominado GI ou intervalo de guarda, para evitar que um símbolo interfira no próximo.

= Questão 3: 

== Item 3.10: 

Dados binários a 9600 bits/s são transmitidos usando modulação PAM 8-ária com um sistema usando uma característica de filtro de decaimento cosseno levantado. O sistema tem uma resposta
em frequência de até 2.4 kHz.

- Qual a taxa de símbolos do sistema?
 
$
log_2(8)=3
$

Desta forma, temos que `3` é a quantidade de bits utilizada. 

$
R_s = 9600/3 = 3200 #text("simbolos/s") 
$

- Qual é o fator de decaimento da característica do filtro?

$

2.4"kHz" = (1 + alpha) * R_s 

1 + alpha = (2.4 * 10^3) / 3200
$

$
1 + alpha = 0.75 = alpha = -0.25 
$

Encontrando alfa, podemos determinar o valor de beta através da seguinte equação: 

$
beta = 1/alpha  = beta = 1/(-0.25) = -4
$

== Item 3.14:

Considere que pulsos binários NRZ são transmitidos ao longo de um cabo que atenua a potência do sinal em 3 dB (do transmissor para o receptor). Os pulsos são detectados coerentemente no receptor, e a taxa de dados é de 56 kbit/s. Suponha ruído Gaussiano com $N_0$ = $10^(−6)$ Watt/Hz. Qual é a quantidade mínima de potência necessária no transmissor para manter uma probabilidade de erro de bit de Pb = $10^(−3)$? A capacidade do canal é dada por:

$
C = B * log_2(1 + "SNR")
$

Dados do problema: 

- 56Kbps = B = R
- $P_("TX")$ = $P_("RX") - 3"dB"$ 

Desta forma temos que: 

$
56 * 10^3 = 56 * 10^3 * log_2(1 + "SNR")
$
$
56 * 10^3 = 56 * 10^3 * log_2(1 + P/(2 * 10^(-6)))
$
$
1 = log_2(1 + P/(2 * 10^(-6)))
$
$
2 = 1 + P / (2 * 10^(-6)) 
$
$ 
1 = P / (2 * 10^(-6))
$

Portanto temos que a potência mínima necessária é de $2 * 10^(-6)$ Watt.

= Referências Bibliográficas 

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]


