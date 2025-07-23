#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Investimento em Rede GPON",
  subtitle: "Economia para a Engenharia",
  date: "13 de Julho de 2025",
  authors: ("Arthur Cadore M. Barcella",),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário
 
#outline()


// = Necessidade Mapeada

// == Necessidade de Implantação de Rede GPON

// Requisitos:

// - Atender a um bairro;
// - Possuir pelo menos 10 portas PON;
// - Alcançar market share de 50%;
// - Orçamento total estimado: R\$ 50 mil a R\$ 70 mil.

= Escolha do Local

== Mapa Topográfico

#align(horizon+center)[
#figure(
  figure(
    rect(image("./pictures/mapa/1.png", width: 100%)),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
]

== Verificação de Habitantes (IBGE)


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
- O centro da cidade é o local escolhido para a implantação da rede GPON, pois concentra o maior número de habitantes e empresas.

- Além disso, o projeto atende uma pequena área dos seguintes bairros, com possibilidade de ampliação: 
  - Senhor Bom Jesus
  - Santo Antonio 
  - Nossa senhora de Lourdes

- #link("https://censo2022.ibge.gov.br/panorama/mapas.html?tema=numero_de_domicilios&recorte=bairros&localidade=4203600")[Ref: IBGE]

          ]
        ],
        [
#figure(
  figure(
    rect(image("./pictures/mapa/ibge4.png", width: 100%)),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)
        ],
    ),
)


== Verificação de Empresas (Telecomunicações)

Unico provedor de internet identificado na região foi: 

- GGNET Telecomunicações: #link("https://www.gegnet.com.br/")[Ref: GGNET]

Com base na análise de preços dos concorrentes, foi definido de maneira preliminar  os seguintes valores: 

#align(center)[
#table(
  columns: 3,
  table.header(
    [Plano], [Preço Mensal], [Taxa de Instalação]
  ),

  [Plano 100Mbps], [R\$115,00], [R\$100,00],
  [Plano 200Mbps], [R\$135,00], [R\$100,00],
  [Plano 500Mbps], [R\$145,00], [R\$100,00],
)
]

= Definição de topologia

== Backbone da Rede

#figure(
  figure(
    rect(image("./pictures/mapa/3.png", width: 100%)),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)

== Derivação e Distribuição

#figure(
  figure(
    rect(image("./pictures/mapa/2.png", width: 100%)),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)

== Topologia da Rede PON

#figure(
  figure(
    rect(image("./pictures/mapa/4.png", width: 100%)),
    numbering: none,
    caption: figure.caption([], position: top)
  ),
)

= Equipamentos Ativos:

== OLT AN6000-2 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            A OLT é o equipamento utilizado para conectar todos os clientes da rede PON e concentra-los em um único lugar para que possa ser feito o uplink.
            
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Portas GPON], [32 (16x2)], 
              [Max. clientes], [4096 ONUs],
              [Uplink], [12x Gbps],
              [Preço], [R\$ 4066,00],
              [Consumo Max.], [422W],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/OLT.jpeg", width: 80%)),
             numbering: none,
             caption: figure.caption([OLT - Optical Line Terminal], position: top)
           ),
          )
          #link("https://www.tudoemtecnologia.com.br/concentrador-de-interface-de-dados-an6000-2-1")[Ref: AN6000-2]
        ],
    ),
)



== Placa GPOA (16 portas)

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(horizon+center)[
            A plata GPOA é o equipamento que de fato faz o serviço de conectar todos os clientes, sendo utilizada no chassis apresentado anteriormente. 
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Interface Óptica], [ITU-T G.988, G.984.1-4], 
              [Downstream], [2.4Gbps],
              [Upstream], [1.2Gbps],
              [Quantidade de clientes], [16*128 = 2048],
              [Preço], [R\$ 9860,00],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #align(horizon+center)[
          #figure(
           figure(
             rect(image("./pictures/GPOA.jpeg", width: 80%)),
             numbering: none,
             caption: figure.caption([Placa de serviço GPOA], position: top)
           ),
          )
          ] 
          #link("https://www.mercadolivre.com.br/hub-de-rede-fiberhome-fiberhome-an6000-16-pon-c-do-16-portas/p/MLB27122233?matt_tool=18956390&utm_source=google_shopping&utm_medium=organic&pdp_filters=item_id:MLB5066667798&from=gshop")[Ref: GPOA]
        ],
    ),
)

== ONU AN5506-01-A

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ #align(left)[
          A ONU é o equipamento instalado no cliente, que é responsável por receber o sinal da OLT e "transforma-lo" em um sinal que possa ser utilizado para conexão ethernet.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Distância máxima], [20km], 
              [Potência Óptica TX], [0,5 a 5dBm],
              [Potência Óptica RX], [-8 a -29dBm],
              [Preço], [R\$ 81,00],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/ONU.jpeg", width: 80%)),
             numbering: none,
             caption: figure.caption([ONU - Optical Network Unit], position: top)
           ),
          )
          #link("https://shopee.com.br/product/1187512053/18899691452?gads_t_sig=VTJGc2RHVmtYMTlxTFVSVVRrdENkWHlFU0hvQlZFVENpb1FnT09uNDlDSTE2TjBXYzFTdG1pUnlhT2IwRXQ5WmE3L3BrWmo4TCt6a0R3dkE3dE9KUmVIcFNaY2R5emFBcldnTklYSStYSm01TmhnckVrNXhKZUVMRE5CZzJ6MVJzT09UdGZ5RUljTWhpVE10a201NGVRPT0")[Ref: ONU AN5506-01-A]
        ],
    ),
)


== Transceiver GPON C++


#figure(
    grid(
        columns: (50%, 50%),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O transceiver GPON é utilizado para fechar o enlace na rede PON entre a placa de serviço e todos os clientes conectados a PON (mesmo meio óptico).
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Taxa TX], [2,488 Gbit/s], 
              [Taxa RX], [1,244 Gbit/s],
              [Potencia Óptica de saída], [5,5 a 10dBm],
              [Potencia Óptica de entrada], [-10dBm],
              [Preço], [R\$ 319,32],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #align(center)[
            Transceiver GPON C++
          #figure(
           figure(
             rotate(-90deg, reflow: true)[#rect(image("./pictures/transceiver2.png", width: 80%))],
             numbering: none,
           ),
          )
          #link("https://produto.mercadolivre.com.br/MLB-4009798167-sfp-gbic-intelbras-gpon-olt-c-para-olt-fiberhome-_JM?matt_tool=18956390&utm_source=google_shopping&utm_medium=organic")[Ref: Transceiver GPON C++]
          ]
        ],
    ),
)

== Transceiver KTS 2110+

#figure(
    grid(
        columns: (50%, 50%),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[ 
              O transceiver KTS 2110+ é um equipamento utilizado para fechar o enlace de 10Gbps entre a OLT que estiver no POP e o dispositivo "acima" (tipicamente topo de rack) que fará o uplink dos clientes, como um roteador.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Alcance], [10 km], 
              [Taxa de transferência], [10 Gbps],
              [Preço], [R\$ 364,90],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #align(center)[
            Transceiver Ethernet 10Gbps
          #figure(
           figure(
             rotate(-90deg, reflow: true)[#rect(image("./pictures/transceiver.png", width: 80%))],
             numbering: none,
           ),
          )
          #link("https://www.segurancaetelecom.com.br/p/modulo-conversor-sfp-10gbps-monomodo-10km-kts-2110")[Ref: Transceiver KTS 2110+]
          ]
        ],
    ),
)

== Nobreak 3000VA

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O nobreak é um equipamento para proteger a infraestrutura de energia elétrica,  evitando que a energia seja interrompida de forma repentina até uma fonte de energia alternativa ser ativada.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Potência], [3000VA], 
              [Peso], [\~40 \~+85℃],
              [Preço], [R\$ 4.931,00],
              [Autonomia (500w)], [1:15hr],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/nobreak.jpeg", width: 80%)),
             numbering: none,
             caption: figure.caption([Nobreak], position: top)
           ),
          )
          #link("https://www.kalunga.com.br/prod/nobreak-senoidal-racktorre-snb-3000va-bi-rt-4822042-intelbras-cx-1-un/446921?srsltid=AfmBOor7xTK77tKhOoruNxiUYvhupgtyOCmuuafeMHAcDGk9F_fYu8XBp6M")[Ref: Nobreak 3000VA]
        ],
    ),
)

== Rack de Telecomunicações

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O rack de telecomunicações é uma estrutura metálica usada para acomodar, organizar e proteger equipamentos de rede, como switches, servidores e distribuidores ópticos.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Tamanho], [20U],
              [Dimensão Externas (L × A × P)], [600 × 956 × 670 mm],
              [Peso], [44kg],
              [Preço], [R\$ 2552,10],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/rack.jpeg", width: 90%)),
             numbering: none,
             caption: figure.caption([Modelo: RPD 2067], position: top)
           ),
          )
          #link("https://www.kabum.com.br/produto/630758/rack-piso-intelbras-desmontavel-20u-670mm-rpd-2067-4770059?srsltid=AfmBOoplSIAXO8KOtkB5O1CrK7QRfvNoPM6LCaiY_8Lx2z-m1r1JIrZJF1U")[Ref: Rack]
        ],
    ),
)


= Equipamentos Passivos

== Splitters Desbalanceados

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O splitter desbalanceado é um equipamento passivo que divide uma fibra em duas fibras com nivel de atenuação diferente entre elas, permitindo que o sinal seja transmitido em várias direções.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr, 1fr, 1fr),
              align: (left, center, center, center),
              table.header[Modelo][Porta 1][Porta 2][Emenda],
              [XFSD 10/90], [$<11.0$dB], [$1,1$dB], [$0,2$dB],
              [XFSD 20/80], [$<7.9$dB], [$1.6$dB], [$0,2$dB],
              [XFSD 30/70], [$<6.1$dB], [$2,2$dB], [$0,2$dB], 
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/splitterbal2.jpeg", width: 90%)),
             numbering: none,
             caption: figure.caption([Ref: Splitter Balanceado], position: top)
           ),
          )
          #link("https://shopee.com.br/product/349240281/5789113149?gads_t_sig=VTJGc2RHVmtYMTlxTFVSVVRrdENkWVp3RFo3Mkw5czd4Z0hzdEF1WVFibUFPN2RubTV4RWJ0SUFCc3JveHBNTWxwRGljSVRHdVRIcE4yMSs2NzdjY2FyM3ROaHZCMzlpeU9YaXhUa1JvYW1vaitCb2F0MWJ2U2ZDdUpCQmRxUDI1VVRhMjMwWHkxZFE4QXlJVnJUMU5nPT0")[Ref: Splitter Desbalanceado]
        ],
    ),
)

== Splitters Balanceados

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O splitter balanceado é um equipamento passivo que divide uma fibra em diversas fibras com nivel de atenuação igual entre elas. 
          #figure(
            figure(
              table(
               columns: (1fr,  1fr, 1fr),
              align: (left, center, center),
              table.header[Modelo][Porta Clientes][Emenda],
              [XFSD 141], [$<7,3$dB],  [$0,2$dB], 
              [XFSD 181], [$<10,5$dB], [$0,2$dB],
              [XFS 1161], [$<13,7$dB], [$0,2$dB],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/splitterbal1.jpeg", width: 90%)),
             numbering: none,
             caption: figure.caption([Ref: Splitter Balanceado], position: top)
           ),
          )
          #link("https://shopee.com.br/product/349240281/5789113149?gads_t_sig=VTJGc2RHVmtYMTlxTFVSVVRrdENkWVp3RFo3Mkw5czd4Z0hzdEF1WVFibUFPN2RubTV4RWJ0SUFCc3JveHBNTWxwRGljSVRHdVRIcE4yMSs2NzdjY2FyM3ROaHZCMzlpeU9YaXhUa1JvYW1vaitCb2F0MWJ2U2ZDdUpCQmRxUDI1VVRhMjMwWHkxZFE4QXlJVnJUMU5nPT0")[Ref: Splitter Balanceado]
        ],
    ),
)

== DIO (Distribuidor Interno Óptico)


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O DIO (Distribuidor Óptico Interno) é um equipamento passivo utilizado para organizar, proteger e interligar fibras ópticas em ambientes internos de redes de telecomunicações.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Adaptadores SP/APC], [48],
              [Bandejas de fusão], [4],
              [Capacidade de fusões], [até 24 por bandeja],
              [Capacidade de splitter PLC], [até 3 por bandeja],
              [Preço], [R\$ 995,46],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/dio.jpeg", width: 90%)),
             numbering: none,
             caption: figure.caption([DIO 48FO], position: top)
           ),
          )
          #link("https://produto.mercadolivre.com.br/MLB-5003421636-dio-completo-48fo-distribuidor-interno-optico-sc-apc-2u-_JM")[Ref: DIO]
        ],
    ),
)




== Conectores e Acopladores

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 

          #figure(
           figure(
             rect(image("./pictures/SCAPC.png", width: 43%)),
             numbering: none,
             caption: figure.caption([Conector SC/APC], position: top)
           ),
          )
          #figure(
           figure(
             rect(image("./pictures/SCAPC2.png", width: 43%)),
             numbering: none,
             caption: figure.caption([Acoplador SC/APC], position: top)
           ),
          )
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/patch1.png", width: 50%)),
             numbering: none,
             caption: figure.caption([Patch Cord SC/APC-SC/APC], position: top)
           ),
          )
          #figure(
           figure(
             rect(image("./pictures/patch_cord.jpeg", width: 50%)),
             numbering: none,
             caption: figure.caption([Patch Cord SC/APC-SC/UPC], position: top)
           ),
          )
        ],
    ),
)



= Lançamento e Ancoragem:

== Backbone Mini-RA (AS-80) 24FO


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            O backbone (linha vermelha no mapa) será instalado inicialmente com 24 fibras (pensando em futuras expansões), sendo 24FO AS-80, (R\$1.776 o metro, Dollar á R\$5,55)
          - #link("https://plantec.com/produtos/detalhes/4830164/cabo-fibra-optica-3km-cfoa-sm-as80-24fo-nr-intelbras/")[Ref: CFOA-SM-ASU80-S-24F]
        #figure(
           figure(
             rect(image("./pictures/MiniRA-24FO AS-80.png", width: 50%)),
             numbering: none,
             caption: figure.caption([Bobina com 4Km], position: top)
           ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/MiniRA-24FO AS-80-2.png", width: 90%)),
             numbering: none,
             caption: figure.caption([Mini-RA 24FO AS-80], position: top)
           ),
          )
        ],
    ),
)

== Derivação Mini-RA (AS-80) 6FO


#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            A derivação (linhas azuis no mapa) serão instaladas inicialmente com 6 fibras (pensando em futuras expansões), sendo 6FO AS-80, (R\$1.11 o metro, Dollar á R\$5,55)
          - #link("https://www.pauta.com.br/bobina-cabo-optico-intelbrasfiberhome-asu80-6fo-3km-cfoa-sm-asu80-s-6f-nr-4830157")[Ref: CFOA-SM-ASU80-S-6F]
        #figure(
           figure(
             rect(image("./pictures/MiniRA-24FO AS-80.png", width: 50%)),
             numbering: none,
             caption: figure.caption([Bobina com 3Km], position: top)
           ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/ASU80-6FO-SM-ASU80.png", width: 90%)),
             numbering: none,
             caption: figure.caption([ASU80-6FO-SM-ASU80], position: top)
           ),
          )
        ],
    ),
)

== Distribuição Drop 1FO

          #align(left)[
            A distribuição (Entre a CTO e o cliente) será instalada utilizando drop 1FO, (R\$ 667 a bobina).
          - #link("https://www.mercadolivre.com.br/cabo-de-rede-fibra-optica-1km-de-extenso-lan-wan-intelbras/p/MLB28851010")[Ref: Drop 1FO]
          ]
#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
        #figure(
           figure(
             rect(image("./pictures/drop.png", width: 60%)),
             numbering: none,
             caption: figure.caption([Bobina com 1Km], position: top)
           ),
          )
        ],
        [


        #figure(
           figure(
             rect(image("./pictures/drop2.png", width: 90%)),
             numbering: none,
             caption: figure.caption([Drop 1FO], position: top)
           ),
          )
        
        ],
    ),
)


== CF 36FO (Caixa de Emenda/Fusão)

          #align(left)[
            As fusões em cada derivação serão feitas na caixa de emenda, que terá 36FO (R\$ 197,51 un). Podendo comportar até 72 fibras com sangria. 
          - #link("https://www.kabum.com.br/produto/415905/caixa-de-emenda-2-flex-telecom-ceo-36fo-ate-72-fibras-svt-3-bandejas?srsltid=AfmBOoqE8cOpNJ4JkMAS8yjAyj7gwS-IbmtM2Vi8i9EGOA8QNlZNx53Mxzs")[Ref: Caixa de Emenda]
          ]
#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
        #figure(
           figure(
             rect(image("./pictures/caixaemenda.jpeg", width: 50%)),
             numbering: none,
             caption: figure.caption([Caixa de emenda 36FO], position: top)
           ),
          )
        ],
        [


        #figure(
           figure(
             rect(image("./pictures/caixaemenda2.jpeg", width: 50%)),
             numbering: none,
             caption: figure.caption([Caixa de emenda 36FO], position: top)
           ),
          )
        
        ],
    ),
)


== Cojunto de Ancoragem
Além da própria caixa, será necessário o conjunto de ancoragem para fixar a caixa no poste.
#figure(
  grid(
    columns: 2,
    align: center,

    figure(
      image("./pictures/abracadeira_bap.jpeg", width: 40%),
      numbering: none,
      caption: [#link("https://netcomputadores.com.br/gs/bap3--abracadeira--p--poste-bap3/34961?srsltid=AfmBOorgnHeCbrs95rPLqJn_qefFZBIkk3osq935D4nqjREzSs5Qjlsz3MA", "Ref: Abraçadeira BAP-3 (R$ 22,00)")]
    ),

    figure(
      image("./pictures/alca_preformada.jpeg", width: 28%),
      numbering: none,
      caption: [#link("https://produto.mercadolivre.com.br/MLB-3871814471-alca-preformada-multiplex-70mm-az-107772-_JM?matt_tool=18956390&utm_source=google_shopping&utm_medium=organic", "Ref: Alça Preformada (R$ 11,00)")]
    ),

    figure(
      image("./pictures/isolador_bap.png", width: 45%),
      numbering: none,
      caption: [#link("https://www.unicaserv.com.br/rede-externa/ferragens/kit-conjunto-isolador-tipo-roldana-abracadeira-ajustavel-bap-3-com-parafuso?srsltid=AfmBOoqV8JDT8tTPq4oFZBlxpYjjNJTPF0EkyhGgmkKckSkK6MQo_oyeDag", "Ref: Isolador BAP-3 (R$ 40,20)")]
    ),
    
    figure(
      image("./pictures/suporte_emenda.jpeg", width: 45%),
      numbering: none,
      caption: [#link("https://www.santeconline.com.br/cruzeta-soldavel-marrom-25mm-tigre-15880?srsltid=AfmBOoql3GQKDxZXMJeoJNL8BOxpMNp9MbHAWQFnBuuLnJ76DeSH7pkuAAI", "Ref: Cruzeta (R$ 16,25)")]
    ),

  ),

)

== Ancoragem da caixa de emenda

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
           Para montar a caixa no poste, além do custo da própria caixa, foram considerados demais asessórios utilizados, como: 
            - Abracadeira BAP
            - Alça preformada 
            - Isolador BAP
            - Cruzeta 
            - Parafusos

            Dessa forma, o custo total por caixa de emenda é de R\$253,00
          ]

        ],
        [
          #figure(
           figure(
             rect(image("./pictures/emenda_poste.jpeg", width: 65%)),
             numbering: none,
             caption: figure.caption([Ancoragem da caixa de emenda], position: top)
           ),
          )
        ],
    ),
)

== CTO (Caixa de Terminação Óptica)

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[
            A CTO (Caixa de Terminação Óptica) é um equipamento passivo utilizado para derivar e proteger fibras ópticas em redes externas, facilitando a conexão entre a rede de distribuição e os assinantes.
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Conectores], [16 saídas SC/APC],
              [Splitter Interno], [1x16 PLC SC/APC],
              [Peso], [1.3kg],
              [Preço], [R\$ 229,99],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
          ]
        ],
        [
        #figure(
           figure(
             rect(image("./pictures/cto.png", width: 90%)),
             numbering: none,
             caption: figure.caption([Modelo: XFCT 1616], position: top)
           ),
          )
          #link("https://www.magazineluiza.com.br/caixa-de-terminacao-optica-aerea-intelbras-1x16-sc-apc-com-splitter/p/bg6dc5kgd5/et/dvsn/")[Ref: CTO]
        ],
    ),
)


= Orçamento da PON

== Calculo de distâncias e caminho 

Os dados brutos (latitude / longitude) obtidos do mapa foram então computados em um script, que para cada ponto, calculava a distância em linha reta, retornando as distância em km. 

#sourcecode[```text
POP - 0.02 - X0001 - 0.01 - CF(X0002) - 0.02 - X0003 - 0.03 - CF(X0004) - 0.00 - X0005 - 0.04 - X0006 - 0.04 - X0007 - 0.03 - X0008 - 0.04 - X0009 - 0.03 - X0010 - 0.03 - X0011 - 0.03 - CF(X0012) - 0.02 - X0013 - 0.03 - X0014 - 0.04 - X0015 - 0.03 - X0016 - 0.04 - X0017 - 0.04 - X0018 - 0.03 - CF(X0019) - 0.04 - X0020 - 0.03 - X0021 - 0.05 - X0022 - 0.04 - X0023 - 0.06 - X0024 - 0.02 - CF(X0025) - 0.04 - X0026 - 0.04 - X0027 - 0.02 - X0028 - 0.04 - X0029 - 0.04 - CF(X0030) - 0.02 - A0001 - 0.02 - A0002 - 0.03 - A0003 - 0.02 - A0004 - 0.03 - A0005 - 0.03 - A0006 - 0.02 - CC(A0007) - 0.03 - A0008 - 0.04 - A0009 - 0.02 - A0010 - 0.04 - A0011 - 0.05 - A0012 - 0.02 - CC(A0013) - 0.03 - A0014 - 0.04 - A0015 - 0.02 - CC(A0016) - 0.04 - A0017 - 0.05 - A0018 - 0.02 - A0019 - 0.03 - A0020 - 0.06 - CC(A0021)
```]

== Plotagem derivações norte

#figure(
 figure(
   rect(image("./caminho_cima.svg", width: 100%)),
   numbering: none,
   caption: figure.caption([Derivações norte], position: top)
 ),
)

== Plotagem derivações sul

#figure(
 figure(
   rect(image("./caminho_baixo.svg", width: 100%)),
   numbering: none,
   caption: figure.caption([Derivações sul], position: top)
 ),
)

== Calculo de atenuação

Para cada derivação apresentada anteriormente, foi então feita outra computação, considerando a atenução da fibra, emendas, fusões e splitagem, considerando um sinal +5dBm da OLT para alcançar o gráfico abaixo:

#figure(
 figure(
   rect(image("./out/potencia_CC(A0021).svg", width: 80%)),
   numbering: none,
   caption: figure.caption([Atenução derivação A], position: top)
 ),
)

== Calculo de atenuação

#figure(
 figure(
   rect(image("./out/potencia_CC(J0015).svg", width: 100%)),
   numbering: none,
   caption: figure.caption([Atenuação derivação J], position: top)
 ),
)

== Ampliação da Rede 

O projeto prevê a ampliação da rede PON para atender mais clientes, com a possibilidade de: 

- Adicionar uma segunda placa de serviço da OLT (atendendo mais 2048 clientes), 4096 no total.  

- Ampliar o drop 24 para 36FO (permitindo atingir as 32 portas PON da OLT), sendo possivel atender até 3072 sem alterar o backbone ou adicionar uma fibra paralela. 

- Realizar fusões diretas nas caixas ao invés de splitter 1x2 (permitindo aumentar a área de atendimento mantendo os cabos de derivação já passados.


= Alugueis

== Aluguel de Poste 
#align(left)[
  Quantidade de postes pela cidade mapeada é de 338 postes, portanto:
  - R\$6,00 \* 338 = R\$2028,00 (mes) com postes. 
]

#figure(
 figure(
   rect(image("./pictures/postes2.png", width: 80%)),
   numbering: none,
   caption: figure.caption([Quantidade de postes], position: top)
 ),
)



== Aluguel de POP (Ponto de Presença)

#align(left)[
  Como base da empresa e POP, será alugada uma sala comercial com $115m^2$, no valor de R\$3.500,00 (mes).
- #link("https://www.maisnovacasa.com.br/58739647/imoveis/locacao-sala-centro-campos-novos-sc")[Ref: POP]
]

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 

          #figure(
           figure(
             rect(image("./pictures/pop.jpeg", width: 75%)),
             numbering: none,
             caption: figure.caption([POP], position: top)
           ),
          )
        ],
    ),
)

== Aluguel de Uplink

Inicialmente, o link dedicado previsto é de 2Gbps (primeiro ano), até que uma carteira de clientes minima (aprox. 240 clientes) seja atingida. 

- Para isso, o aluguel do uplink inicial será de R\$5000,00 (mês).

Após o aumento da quantidade de clientes para 1280, o uplink será aumentado para 5Gbps, considerando o aumento na quantidade de usuários simultâneos. 

- Para isso, o aluguel do uplink será de R\$10.000,00 (mês).

#link("https://racctelecom.com.br/link-dedicado-1gb-preco/", "Ref: Aluguel de Uplink")


= Custos Empresariais

// == Técnica Opção 1: Prestação de Serviços

// A mão de obra foi definida com base em discussão em sala, foi colocado um valor definido por demanda da mão de obra, apenas para simplificar o cálculo. 

// #align(center)[
// #table(
//   columns: 3,
//   table.header(
//     [Serviço], [Custo Mensal], [Quantidade]
//   ),
//   [Instalação POP], [5000], [1],
//   [Instalação Residencial], [50], [1280],
//   [Instalação Infraestrutura PON], [1], [10000],
//   [Fusões], [1], [1000],
// )
// ]

== Contratação de Funcionários

Custos para contratar dois funcionários para instalação da rede PON (1280 clientes). 

Para isso, devemos considerar o salário base de R\$3.000,00: 

- INSS 20% -> R\$600,00
- FGTS 8% -> R\$240,00
- 13° Salário (8,33%) -> R\$250,00
- Férias (11,11%) -> R\$330,00
- SAT (1%) -> R\$30,00

Dessa forma, o custo total por funcionário é de R\$4.530,00 (mês). Considerando 2 funcionários, o custo total é de R\$9.060,00 (mês). 

== Abertura da empresa, impostos e taxas

- Abertura: 
  - Honorários contador: R\$1.500,00
  - Junta comercial (SC): R\$200,00
  - Certificado Digital: R\$200,00 (ano)
  - Alvará de Funcionamento: R\$500,00

- Impostos e Taxas: 
  - SCM (Serviço de comunicação multimídea): R\$400,00 (Registro) + R\$1340,00 (licenciamento)
  - Taxas FISTEL (TFI e TFF): R\$ 1340,00 + R\$ 670,00 (ano)

- Outros custos: 
  - Divulgação: R\$2000,00 (mes)
  - Energia elétrica: R\$600,00 (mes)
  - Agua: R\$100,00 (mes)
  - Carro: R\$1500,00 (mes)

= Análise de Viabilidade Econômica

== Despesas 

Considerando todos os parâmetros anteriores, temos as seguintes despesas:

#figure(
  figure(
    rect(image("./eco/despesas.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([Despesas], position: top)
  ),
)

== Receitas (Bruta e Descontada)

Valor bruto: 

- mensalidade dos clientes
  - 20 Clientes novos por mês
  - Considera-se a distribuição de 70%, 20% e 10% de 100Mbps, 200Mbps e 300Mbps respectivamente. 
- venda de equipamentos (instalação)
  - 20 Instalações novas mês
  - Considera-se 100 reais de instalação. 
  
Valor descontado, considerando o valor de imposto sobre a prestação de serviço (Simples Nacional), temos: 

- 6% a 17% (em média 8-11% no estado).

== Receitas (Bruta e Descontada)

#figure(
  figure(
    rect(image("./eco/receitas.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([Receitas], position: top)
  ),
)

== Fluxo de Caixa

#figure(
  figure(
    rect(image("./eco/fc.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([Fluxo de Caixa], position: top)
  ),
)

== VPL (Valor Presente Líquido)

#figure(
  figure(
    rect(image("./eco/vpl.svg", width: 100%)),
    numbering: none,
    caption: figure.caption([VPL (Considerando TMA de 15%)], position: top)
  ),
)

== Payback e TIR

Considerando os dados apresentados temos: 

- Payback Simples: 12 meses
- Payback Descontado: 24 meses
- TIR: 8%

#figure(
  figure(
    rect(image("./eco/tir.png", width: 90%)),
    numbering: none,
    caption: figure.caption([TIR], position: top)
  ),
)

= Conclusão 

== Conclusão

Com base nos cálculos realizados, podemos concluir que o investimento é viavel *A LONGO PRAZO*, sendo necessario investir grandes somas, especialmente nos primeiros dois anos para poder manter a infraestrutrutura funcionando. 

A longo prazo o investimento se torna lucrativo, mesmo sem ampliação da rede, considerando a carteira de clientes que se formou, e os custos estabilizados de operação e manutenção. 




