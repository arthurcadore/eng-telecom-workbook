#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Conceitos Gerais Sobre Energia 
e Transferência de Calor: Exercicios 1",
  subtitle: "Fenomenos de Transporte",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "23 de Março de 2025",
  doc,
)

= Introdução:

Esse trabalho tem como objetivo estudar na apostila a introdução e até o item 1.1 (pp. 1 a 10) e em seguida assistir o vídeo explicativo. 

= Questões:

== Conceitue taxa de transferência de calor. 

A taxa de transferência de calor, é a quantidade de energia termica que é transferida entre dois objetos ou sistemas, devido a diferença de temperatura que existe entre eles. A taxa de transferência de calor é medida em Watts (W) e é diretamente proporcional a diferença de temperatura entre os sistemas (ou seja, quanto maior a diferença de temperatura, maior a taxa de transferência de calor).

A transferência de calor pode ocorrer de três formas: condução, convecção e radiação, a qual serão explicadas a seguir.

== O que é condução do calor?

A condução do calor é um dos mecanismos de transferência de calor, que ocorre em sólidos, líquidos e gases. A condução do calor ocorre devido a diferença de temperatura de dois materiais (ou do mesmo material) que estão em contato, fazendo com que a energia térmica se propague de um lugar para o outro, devido a vibração das moléculas do material. Isso diminui a diferença de temperatura entre os dois materiais (ou partes do mesmo material), até que a temperatura se iguale.

Um exemplo prático de condução é uma barra de metal que é aquecida por uma vela em uma das extremidades, a energia térmica é transferida de uma extremidade para a outra, até que a temperatura da barra se iguale.

A condução é determinada pela Lei de Fourier, que é dada pela seguinte equação:

$ Q = -k_A d_T/d_x $

Onde: 

- $Q$ é a taxa de transferência de calor (W)
- $k$ é a condutividade térmica do material (W/mK)
- $A$ é a área de transferência de calor (m²)
- $d_T/d_x$ é o gradiente de temperatura (K/m)

== O que é convecção do calor?

A convecção do calor é um dos mecanismos de transferência de calor, que ocorre em fluidos (líquidos e gases). A convecção do calor ocorre devido a diferença de temperatura de um fluido, fazendo com que o fluido se movimente, levando a energia térmica de um lugar para o outro.

Um exemplo pratico de convecção é um ar condicionado instalado na parte superior de uma parede, que ao ser ligado, resfria o ar quente que está proximo ao teto, fazendo com que o ar frio desça, por sua vez, o ar mais quente que estaba em baixo sobe e é resfriado pelo ar condicionado, criando um ciclo. 

A convecção é determinada pela Lei de Resfriamento de Newton, que é dada pela seguinte equação:

$ Q = h A (T_s - T_f) $


Onde:

- $Q$ é a taxa de transferência de calor (W)
- $h$ é o coeficiente de transferência de calor por convecção (W/m²K)
- $A$ é a área de transferência de calor (m²)
- $T_s$ é a temperatura da superfície (K)
- $T_f$ é a temperatura do fluido (K)

== O que é radiação do calor?

A radiação é o ultimo mecanismo de transferência de calor, que ocorre em todos os corpos, sólidos, líquidos e gases. A radiação ocorre devido a emissão de ondas eletromagnéticas, que são emitidas por um corpo devido a sua temperatura. A radiação térmica é emitida por todos os corpos, independente da temperatura, porém, quanto maior a temperatura do corpo, maior a quantidade de radiação emitida.

Um exemplo prático de radiação é o sol, que emite radiação térmica, que é absorvida pela terra, aquecendo-a.

A radiação é determinada pela Lei de Stefan-Boltzmann, que é dada pela seguinte equação:

$ Q = epsilon sigma A (T_s^4 - T_a^4) $

Onde:

- $Q$ é a taxa de transferência de calor (W)
- $epsilon$ é a emissividade do material
- $sigma$ é a constante de Stefan-Boltzmann (5.67 x 10^-8 W/m²K^4)
- $A$ é a área de transferência de calor (m²)
- $T_s$ é a temperatura da superfície (K)
- $T_a$ é a temperatura do ambiente (K)

== Qual o mecanismo dominante de transmissão de calor nos sólidos?

Nos sólidos, o mecanismo dominante de transmissão de calor é a condução, devido a vibração das moléculas do material, que faz com que a energia térmica se propague de um lugar para o outro. Isso também se da pela movimentação livre de eletrons no material (condutores / semicondutores), o que facilita a transferência de calor além de contribuir para a geração de mais calor, através do efeito Joule.

== Qual o mecanismo dominante de transmissão de calor nos fluidos?

Nos fluidos, o mecanismo dominante de transmissão de calor é a convecção, devido a diferença de temperatura do fluido, fazendo com que o fluido se movimente, levando a energia térmica de um lugar para o outro. Ele é dominante em relação a condução nesse caso pois permite que o fluido se movimente, fazendo com que as áreas com maior temperatura se misturem com as áreas de menor temperatura, diminuindo a diferença de temperatura.

== Existe mecanismo de transmissão de calor que ocorra no vácuo? Se afirmativo, qual seria ele?


Sim, esse mecanismo é a radiação térmica, como dado o exemplo do sol que aquece a terra, esse é o unico mecanismo de transferência de calor que ocorre no vácuo, pois não necessita de um meio material para se propagar, sendo transmitida por ondas eletromagnéticas.


== Referencias:

- Fenômenos de Transporte de Celso P. Livi (disponível no Minha Biblioteca) o capítulo 7, pp 157-164