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

#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)
#show: doc => report(
  title: "Implementação de FSM para Calculadora",
  subtitle: "Dispositivos Lógicos Progamáveis II",
  authors: ("Arthur Cadore Matuella Barcella e Gabriel Luiz Espindola Pedro",),
  date: "23 de Abril de 2024",
  doc,
)

= Introdução:

O objetivo deste relatório consiste na implementação de uma calculadora utilizando uma Máquina de Estados Finitos (FSM) para controle do datapath. A calculadora deve ser capaz de realizar operações de soma, subtração, adição de 1 e subtração de 1.

= Implementação ASM da FSM:

A primeira etapa do projeto é em montar o diagrama ASM da FSM que será responsável por controlar a calculadora. A Figura 1 apresenta o diagrama ASM da FSM que será implementada.

#figure(
  figure(
    image("./diagrams/diagram.svg", width: 60%),
    numbering: none,
    caption: [Diagrama ASM da FSM]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

A FSM é divida em 4 estados, sendos eles: 

- *Idle*: Estado inicial da máquina, onda ela fica em loop aguardando um pulso de "Enter" para iniciar a operação.

- *Operando1*: Estado após "idle", onde a máquina lê habilita o datapath para leitura do primeiro operando utilizando o sinal "Enable1". 

Neste ponto, o estado também valida a operação a se realizada através de um vetor de 2bits, sendo possivel aplicar 00, 01, 10 e 11, oque corresponde respectivamente á soma, subtração, adição+1 e subtração-1.

Nesta verificação, apenas o bit mais significativo 0X é utilizado, pois o bit de maior ordem define se a operação precisará ou não de um segundo operando. 

Após a verificação, caso o valor do bit mais significativo seja "0" a máquina irá para o estado "Operando2", caso seja "1" a máquina irá para o estado "Resultado".

- *Operando2*:  Estado onde a máquina fica em loop aguardando o segundo pulso de "Enter", para receber o segundo operando. 

- *Resultado*:  Estado onde a máquina lê habilita o datapath para processamento do resultado utilizando o sinal "Enable2".

= Implementação em VHDL:

Uma vez com o diagrama ASM da FSM pronto, é necessário implementar o código VHDL que irá controlar o datapath da calculadora. Além do datapath propriamente. Desta forma, iniciaremos com a implementação da FSM.

== Implementação do VHDL da FSM para controle:

A implementação da FSM consiste na 


== Implementação do VHDL datapath da calculadora:

== Instânciação dos componentes e conexão dos sinais:

== Aplicação na placa FPGA:

= Conclusão:

= Referências Bibliográficas: 