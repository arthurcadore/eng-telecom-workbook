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
  date: "29 de Julho de 2025",
  authors: ("Arthur Cadore M. Barcella , Deivid Fortunato Frederico"),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário
 
#outline()

= Parte 2 - Projeto de ADS incluindo trafegos TDP e UDP ao showcase

==  Objetivo do Experimento
\
#set text(size: 16pt)
- Avaliar o impacto do handover Wi-Fi em comunicações TCP e UDP
- Simular perdas de pacotes
- Simular variações de vazão
- Simular comportamento sob mobilidade.

\
\

https://inet.omnetpp.org/docs/showcases/wireless/handover/doc/index.html


== Fatores Variáveis
\
- Tipo de protocolo: TCP vs UDP
- Velocidade do host móvel
- Distância entre os APs
- Potência de transmissão

== Métricas de Avaliação:
\
- Taxa de perda de pacotes UDP
- Vazão TCP (throughput)
- Tempo de resposta / latência
- Número de retransmissões TCP (implícito via logs)
- Momentos e duração do handover

== Modelos de Simulação usados
\
- Plataforma: INET Framework para OMNeT++
- Modelo de mobilidade: LinearMobility
- Tecnologia de acesso: IEEE 802.11 (Wi-Fi) com activeScan e dois APs em canais distintos
- Aplicações:
  - Aplicação UDP: UDPBasicApp e UDPSink  
  - Aplicação TCP: TcpBasicClient e TcpBasicServer
- Modelo físico: potência de transmissão de 2 mW, interferência parcial desabilitada

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

== Configuração do Cenário

#sourcecode[```go
network HandoverShowcase
{
    parameters:
        @display("bgb=800,600");
    types:
        channel Eth100M extends ned.DatarateChannel {
            datarate = 100Mbps;
            delay = 0.1ms;
        }

        [...]

        host2: StandardHost {
            parameters:
                @display("p=750,280;r=,,#707070");
        }

        [...]

        sw: EthernetSwitch {
            parameters:
                @display("p=300,350;r=,,#707070");
        }

    connections allowunconnected:
        ap1.ethg++ <--> Eth100M <--> sw.ethg++;
        ap2.ethg++ <--> Eth100M <--> sw.ethg++;
        host2.ethg++ <--> Eth100M <--> sw.ethg++;
}
```]

== Configurações adicionais de Simulação

#sourcecode[```c

# Ativa bridging L2 nos APs entre wlan e eth
**.ap1.hasEthernetBridging = true
**.ap2.hasEthernetBridging = true

# IPs estáticos e rotas padrão
*.host1.ipv4.address = "10.0.0.2"
*.host1.ipv4.netmask = "255.255.255.0"
*.host1.wlan[0].mgmt.associateToSsid = "AP1"

*.host2.ipv4.address = "10.0.0.3"
*.host2.ipv4.netmask = "255.255.255.0"
*.host2.ipv4.defaultGateways = "10.0.0.1"

# MAC address manual
*.host1.eth[0].macAddress = "00:00:00:00:00:01"
*.ap1.eth[0].macAddress = "00:00:00:00:00:02"
*.ap2.eth[0].macAddress = "00:00:00:00:00:03"
*.host2.eth[0].macAddress = "00:00:00:00:00:04"
*.switch.eth[*].macAddress = auto

# Ativa pingApp em host2 para testar conectividade
*.host2.numApps = 1
*.host2.app[0].typename = "PingApp"
*.host2.app[0].destAddr = "10.0.0.1"  # ping do host2 para host1
*.host2.app[0].startTime = 1s
*.host2.app[0].count = 5

```]


== Configurações de TCP e UDP

#sourcecode[```c

# Aplicações UDP no host1 (cliente) e host2 (sink)
*.host1.numUdpApps = 1
*.host1.udpApp[0].typename = "UDPBasicApp"
*.host1.udpApp[0].destAddresses = "host2"
*.host1.udpApp[0].destPort = 1000
*.host1.udpApp[0].messageLength = exponential(1000B)
*.host1.udpApp[0].sendInterval = 0.1s
*.host1.udpApp[0].startTime = 1s
*.host1.udpApp[0].stopTime = 99s
*.host1.udpApp[0].verbose = true
*.host1.udpApp[0].packetName = "UDPData"
*.host1.udpApp[0].numPk = 1000

*.host2.numUdpApps = 1
*.host2.udpApp[0].typename = "UDPSink"
*.host2.udpApp[0].localPort = 1000
*.host2.udpApp[0].verbose = true


# Aplicações TCP no host1 (cliente) e host2 (servidor)
*.host1.numTcpApps = 1
*.host1.tcpApp[0].typename = "TcpBasicClient"
*.host1.tcpApp[0].connectAddress = "host2"
*.host1.tcpApp[0].connectPort = 2000
*.host1.tcpApp[0].startTime = 1s
*.host1.tcpApp[0].stopTime = 99s
*.host1.tcpApp[0].verbose = true
*.host1.tcpApp[0].messageLength = 1000B
*.host1.tcpApp[0].sendBytes = 1000000

*.host2.numTcpApps = 1
*.host2.tcpApp[0].typename = "TcpBasicServer"
*.host2.tcpApp[0].localPort = 2000
*.host2.tcpApp[0].verbose = true

```]


== Verbose pra export em logs

#sourcecode[```c

# Estatísticas UDP e TCP para hosts
*.host1.udpApp[0].recordPacketsSent = true
*.host1.udpApp[0].recordBytesSent = true
*.host1.udpApp[0].recordPacketsReceived = true
*.host1.udpApp[0].recordBytesReceived = true
*.host2.udpApp[0].recordPacketsReceived = true
*.host2.udpApp[0].recordBytesReceived = true

*.host1.tcpApp[0].recordPacketsSent = true
*.host1.tcpApp[0].recordBytesSent = true
*.host1.tcpApp[0].recordPacketsReceived = true
*.host1.tcpApp[0].recordBytesReceived = true
*.host2.tcpApp[0].recordPacketsReceived = true
*.host2.tcpApp[0].recordBytesReceived = true


# Estatísticas em vetor para aplicações e camadas Wi-Fi
*.host1.udpApp[*].statistic-recording = "vector"
*.host2.udpApp[*].statistic-recording = "vector"
*.host1.tcpApp[*].statistic-recording = "vector"
*.host2.tcpApp[*].statistic-recording = "vector"
*.host1.wlan[*].agent.statistic-recording = "vector"
*.host1.wlan[*].radio.statistic-recording = "vector"
*.host1.wlan[*].mac.statistic-recording = "vector"


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

== Handover

#figure(
  figure(
    rect(image("./pictures/plot_handover.svg", width: 100%)),
    numbering: none,
    caption: [Tempo vs AP conectado (handover)],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


// == Estatísticas de Pacotes

// #figure(
//   figure(
//     rect(image("./pictures/plot_packets.svg", width: 70%)),
//     numbering: none,
//     caption: [Estatísticas de Pacotes],
//   ),
//   caption: figure.caption([Elaborada pelo Autor], position: top)
// )

== Eventos de Backoff

#figure(
  figure(
    rect(image("./pictures/evento_backoff_active.svg", width: 100%)),
    numbering: none,
    caption: [Evento Backoff Active],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Taxa de Dados e Frame Sequence

#figure(
  figure(
    rect(image("./pictures/evento_datarates_selected.svg", width: 100%)),
    numbering: none,
    caption: [Taxas de Dados Selecionadas],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Estatísticas de Tráfego
#figure(
  figure(
    rect(image("./pictures/plot_traffic_stats.svg", width: 100%)),
    numbering: none,
    caption: [Estatísticas de Tráfego],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Estatísticas UDP/TCP
#figure(
  figure(
    rect(image("./pictures/plot_udp_tcp_stats.svg", width: 100%)),
    numbering: none,
    caption: [Estatísticas UDP/TCP],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Estatísticas de Bytes

#figure(
  figure(
    rect(image("./pictures/plot_bytes.svg", width: 100%)),
    numbering: none,
    caption: [Estatísticas de Bytes],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Taxa de Dados In/out

#figure(
  figure(
    rect(image("./pictures/evento_incoming_packet_lengths.svg", width: 100%)),
    numbering: none,
    caption: [Comprimento de Pacotes Entrantes],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Taxa de Dados In/out

#figure(
  figure(
    rect(image("./pictures/evento_outgoing_packet_lengths.svg", width: 100%)),
    numbering: none,
    caption: [Comprimento de Pacotes Saintes],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Análise de Filas

#figure(
  figure(
    rect(image("./pictures/evento_queue_length.svg", width: 100%)),
    numbering: none,
    caption: [Comprimento da Fila],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Análise com Iperf

== Cenário

#align(horizon+center)[

#figure(
  figure(
    image("./pictures/scenario2.png", width: 100%),
    numbering: none,
    caption: [Cenário de Teste com Iperf],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
]

== Configuração de interface e VLAN

#sourcecode[```
[SW-CADORE]vlan 1234
[SW-CADORE-vlan1234]exit


[SW-CADORE]interface range GigabitEthernet 1/0/9 to GigabitEthernet 1/0/11
[SW-CADORE-if-range]port link-type access 
[SW-CADORE-if-range]port access vlan 1234
```]

== Verificação de interface

#sourcecode[```
[SW-CADORE]display interface GigabitEthernet 1/0/9 brief 
Brief information on interfaces in bridge mode:
Link: ADM - administratively down; Stby - standby
Speed: (a) - auto
Duplex: (a)/A - auto; H - half; F - full
Type: A - access; T - trunk; H - hybrid
Interface            Link Speed   Duplex Type PVID Description                
GE1/0/9              UP   1G(a)   F(a)   A    1234 
```]

== Tabela ARP

#sourcecode[```
[SW-CADORE-Vlan-interface1234]ping 172.16.10.2
Ping 172.16.10.2 (172.16.10.2): 56 data bytes, press CTRL+C to break
56 bytes from 172.16.10.2: icmp_seq=0 ttl=64 time=3.562 ms

[SW-CADORE-Vlan-interface1234]display arp vlan 1234
  Type: S-Static   D-Dynamic   O-Openflow   R-Rule   M-Multiport  I-Invalid
IP address      MAC address    VLAN/VSI name Interface                Aging Type
172.16.10.1     8c47-be17-8271 1234          GE1/0/9                  1191  D   
172.16.10.2     2800-afb5-b278 1234          GE1/0/11                 1189  D   
```]

== Teste de Conectividade

#figure(
  figure(
    rect(image("./pictures/ping.png", width: 100%)),
    numbering: none,
    caption: [Teste de Conectividade],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Configuração de Speed: 

#sourcecode[```
[SW-CADORE]interface range GigabitEthernet 1/0/9 to GigabitEthernet 1/0/11
[SW-CADORE-if-range]sp
[SW-CADORE-if-range]speed ?
  10    Specify speed as 10 Mbps
  100   Specify speed as 100 Mbps
  1000  Specify speed as 1000 Mbps
  auto  Enable port's speed negotiation automatically

[SW-CADORE-if-range]speed 10
```]

== Teste de Iperf:

#sourcecode[```bash
SERVER_IP="172.16.10.1"  # IP do servidor
TEMPO=1000

echo "Iniciando teste UDP (9 Mbps)..."
iperf3 -c $SERVER_IP -u -b 9M -t $TEMPO > udp_result.txt &

sleep 1  # Pequeno atraso para evitar conflito de conexão

echo "Iniciando teste TCP..."
iperf3 -c $SERVER_IP -t $TEMPO > tcp_result.txt

echo "Testes finalizados. Resultados em udp_result.txt e tcp_result.txt"
```]

== Flows

#align(horizon+center)[
#figure(
  figure(
    rect(image("./pictures/flows.png", width: 100%)),
    numbering: none,
    caption: [Flows TCP e UDP],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
] 
== Simular queda do link 

#align(horizon+center)[
#sourcecode[```bash
[SW-CADORE]interface GigabitEthernet 1/0/11
[SW-CADORE-GigabitEthernet1/0/11]port access vlan 10
[SW-CADORE-GigabitEthernet1/0/11]port access vlan 1234
```] 
]

== Captura Wireshark

#figure(
  figure(
    rect(image("./pictures/tcp_udp.png", width: 100%)),
    numbering: none,
    caption: [Captura Wireshark],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Trafego UDP

#figure(
  figure(
    rect(image("./pictures/udp.png", width: 100%)),
    numbering: none,
    caption: [Captura Wireshark do Iperf UDP],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Captura TCP

#figure(
  figure(
    rect(image("./pictures/tcp.png", width: 100%)),
    numbering: none,
    caption: [Captura Wireshark TCP],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Resultados no iperf3

#figure(
  figure(
    rect(image("./pictures/iperf2.png", width: 100%)),
    numbering: none,
    caption: [Resultados do Iperf3],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Conclusão

== Conclusão

- O handover Wi-Fi impacta significativamente o desempenho de TCP e UDP.
- TCP sofre mais com perdas e latência, enquanto UDP é mais resiliente.
- A mobilidade e a distância entre APs afetam a taxa de perda de pacotes