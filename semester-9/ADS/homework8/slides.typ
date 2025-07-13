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

== Topologia
#sourcecode[```py
package inet.showcases.wireless.handover;
import inet.node.inet.WirelessHost;
import inet.node.wireless.AccessPoint;
import inet.physicallayer.wireless.ieee80211.packetlevel.Ieee80211ScalarRadioMedium;
import inet.visualizer.canvas.integrated.IntegratedCanvasVisualizer;


network HandoverShowcase
{
    parameters:
        @display("bgb=640,420");
    submodules:
        visualizer: IntegratedCanvasVisualizer {
            parameters:
                @display("p=100,200");
        }
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,100");
        }
        host: WirelessHost {
            parameters:
                @display("p=50,280;r=,,#707070");
        }
        ap1: AccessPoint {
            parameters:
                @display("p=100,350;r=,,#707070");
        }
        ap2: AccessPoint {
            parameters:
                @display("p=500,350;r=,,#707070");
        }
}
```]

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

== Parâmetros

#sourcecode[```ini
[General]
network = HandoverShowcase

# management submodule parameters
**.mgmt.numChannels = 5

# access point
**.ap1.wlan[*].mgmt.ssid = "AP1"
**.ap2.wlan[*].mgmt.ssid = "AP2"
**.ap*.wlan[*].mgmt.beaconInterval = 100ms

*.host*.mobility.typename = "LinearMobility"
*.host*.mobility.speed = 10mps
*.host*.mobility.initialMovementHeading = 0deg
*.host*.mobility.updateInterval = 100ms
*.host.mobility.constraintAreaMinX = 40m
*.host.mobility.constraintAreaMaxX = 600m
```]

#sourcecode[```ini
# wireless channels
**.analogModel.ignorePartialInterference = true
**.ap1.wlan[*].radio.channelNumber = 2
**.ap2.wlan[*].radio.channelNumber = 3
**.host.wlan[*].radio.channelNumber = 0  # just initially -- it'll scan
```]

#sourcecode[```ini
# wireless configuration
**.radio.transmitter.power = 2.0mW # sets communication ranges

**.networkConfiguratorModule = ""  # no need for configurator

**.wlan[*].agent.activeScan = true
**.wlan[*].agent.defaultSsid = ""
**.wlan[*].agent.channelsToScan = ""  # "" means all
**.wlan[*].agent.probeDelay = 0.1s
**.wlan[*].agent.minChannelTime = 0.15s
**.wlan[*].agent.maxChannelTime = 0.3s

# visualization
*.visualizer.physicalLinkVisualizer.displayLinks = true
*.ap*.wlan[*].radio.displayCommunicationRange = true
```]


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