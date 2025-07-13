#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Showcase - 802.11 Wireless Handover",
  subtitle: "Avaliação de Desempenho de Sistemas",
  date: "13 de Julho de 2025",
  authors: ("Arthur Cadore M. Barcella , Deivid Fortunato Frederico"),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário
 
#outline()

= Parte 1 - Seleção e Apresentação de Showcase

==  Objetivo do Experimento

- Avaliar o comportamento de handover em redes Wi-Fi 802.11.
- Medir estatísticas de eventos wireless, troca de canal e backoff.
- https://inet.omnetpp.org/docs/showcases/wireless/handover/doc/index.html

= Breve Revisão de Conceitos e Tecnologias Usadas

== Handover em redes sem fio (802.11)
== Conceitos de AP, STA, canais e eventos MAC
- AP1/AP2: pontos de acesso
- STA: estação móvel
- Parâmetros de rádio, canal, potência, etc.

== Métricas: eventos wireless, handover, backoff

= Modelo Simulado

== Estrutura

- Estrutura dos nodos: APs, STA móvel, links
- Topologia e posicionamento dos elementos
- Modelos de tráfego e mobilidade

== Topologia 

#figure(
  figure(
    rect(image("./pictures/scenario.png", width: 90%)),
    numbering: none,
    caption: [Cenário de Handover],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= A Simulação

== Parâmetros

- Configuração da rede: número de APs, canais, STA
- Fatores e níveis: canal, distância, mobilidade
- Parâmetros fixados: potência, taxa de transmissão, etc.

- Coleta via vetores do OMNeT++/INET
- Métricas analisadas:
  - Eventos wireless por AP
  - Eventos de backoff
  - Trocas de canal (handover)

== Contagem de eventos

#figure(
  figure(
    rect(image("./pictures/plot2_eventos_ap1_ap2.svg", width: 100%)),
    numbering: none,
    caption: [Contagem de eventos wireless por AP],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Backoffs no tempo

#figure(
  figure(
    rect(image("./pictures/evento_backoff_active.svg", width: 90%)),
    numbering: none,
    caption: [Evento Backoff Active],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Handover

#figure(
  figure(
    rect(image("./pictures/plot_handover.svg", width: 90%)),
    numbering: none,
    caption: [Tempo vs AP conectado (handover)],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)