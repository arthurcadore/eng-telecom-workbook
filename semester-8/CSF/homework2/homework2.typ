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
  title: "Atenuação de Pequena Escala e 
Distribuição de Rayleigh e Ricean ",
  subtitle: "Comunicações Sem Fio",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "14 de Outubro de 2024",
  doc,
)


= Introdução

= Sintese 

Partindo da leitura da seção anterior (5.3), o texto mostra a diferenciação entre os modelos de atenuação dependendo das caracteristicas do sinal propagado, tais como largura de banda, periodo simbólico, entre outros, e também do ambiente em que o sinal se propaga. 

== A atenuação de pequena escala

Os diferentes mecanismos de dispersão da potência transmitida na frequência entre transmissor e receptor geram quatro possiveis casos de atenuação diferentes, o caso que irá se manifestar no ambiente de propagação dependerá das caracteristicas do sinal transmitido e do ambiente de transmissão, e da velocidade. 

Os quatro casos são apresentados abaixo, sendo que os dois primeiros são afetados de acordo com o Espalhamento de atraso de caminho multiplo. 

- Atenuação Pura: 

Nesse tipo de atenuação a BW (largura de banda) do sinal é muito menor que a largura de banda do canal, além de que o Espalhamento de atraso é muito menor que o periodo simbólico, o que faz com que o sinal seja atenuado de forma uniforme em todas as frequências.

- Atenuação Seletiva em Frequência:

Nesse tipo de atenuação a BW (largura de banda) do sinal é muito maior que a largura de banda do canal, além de que o Espalhamento de atraso é muito maior que o periodo simbólico, o que faz com que o sinal seja atenuado de forma seletiva em algumas frequências.

Enquanto que os dois ultimos são afetados de acordo com o efeito de Espalhamento Doppler: 

- Atenuação Rápida em Frequência: 

Nesse tipo de atenuação, o espalhamento Doppler possui um valor alto ($(Delta "Hz") / (Delta t)$), além do tempo de coerência ser muito menor que o periodo simbólico, o que faz com que o sinal seja atenuado de forma rápida em frequência. Isso ocorre em ambientes com alta velocidade de propagação.

- Atenuação Lenta em Frequência: 

Nesse tipo de atenuação, o espalhamento Doppler possui um valor baixo ($(Delta "Hz") / (Delta t)$), além do tempo de coerência ser muito maior que o periodo simbólico, o que faz com que o sinal seja atenuado de forma lenta em frequência. Isso ocorre em ambientes com baixa velocidade de propagação.



== Distribuição de Rayleigh

A distribuição de Rayleigh é utilizada para modelar a atenuação de pequena escala em ambientes urbanos, onde o sinal é refletido em diversos obstáculos, gerando multiplos caminhos de propagação. A distribuição de Rayleigh é uma distribuição de probabilidade que descreve a amplitude do sinal recebido, que é a soma de todos os caminhos de propagação. Os principais casos de uso dessa distritbuição são os seguintes: 

- Modelagem de Canais: A distribuição de Rayleigh é amplamente utilizada para modelar a variação do sinal em canais de comunicação móvel, permitindo a análise do desempenho de sistemas de comunicação.

- Projeto de Sistemas: Ao conhecer as características estatísticas do sinal, é possível projetar sistemas de comunicação mais robustos e eficientes, capazes de lidar com as variações do canal.

- Simulação: A distribuição de Rayleigh é utilizada em simulações para avaliar o desempenho de diferentes técnicas de modulação, codificação e equalização.

== Distribuição de Ricean

Diferentemente da distribuição de Rayleigh, a distribuição de Ricean é utilizada para modelar a atenuação de pequena escala em ambientes rurais, onde o sinal é composto por uma componente direta e uma componente refletida. 

A distribuição de Ricean é uma distribuição de probabilidade que descreve a amplitude do sinal recebido, que é a soma da componente direta e da componente refletida. A principal caracteristica da distribuição de Ricean é a presença de um componente de sinal estacionario, que representa a componente direta, e um componente de sinal variável, que representa a componente refletida.

Outro parâmetro importante da distribuição de Ricean é o fator K, que representa a relação entre a potência da componente direta e a potência da componente refletida. Quanto maior o fator K, maior a influência da componente direta no sinal recebido, e vice-versa.

= Conclusão

A atenuação de pequena escala e as distribuições de Rayleigh e Ricean são conceitos fundamentais em comunicações sem fio, que permitem modelar a variação do sinal em diferentes ambientes de propagação. A compreensão desses conceitos é essencial para o projeto, análise e simulação de sistemas de comunicação móvel, garantindo um desempenho adequado em condições adversas.

= Referências

#link("")[Rappaport, Theodore S.. Comunicações sem fio - Princípios e Práticas. . Pearson. 2009]

