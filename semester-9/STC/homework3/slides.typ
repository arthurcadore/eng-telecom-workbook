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


= Necessidade Mapeada

== Necessidade de Implantação de Rede GPON

- escrever requisitos do projeto aqui

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

COLOCAR AQUI IBGE

- O centro da cidade é o local escolhido para a implantação da rede GPON, pois concentra o maior número de habitantes e empresas. 


== Verificação de Empresas (Telecomunicações)

COLOCAR AQUI TELECOMUNICAÇÕES

== Verificação de Preços de Internet

COLOCAR AQUI PREÇOS DE INTERNET (QUE FONTES?)

#align(center)[
#table(
  columns: 3,
  table.header(
    [Plano], [Preço Mensal], [Taxa de Instalação]
  ),

  [Plano 100Mbps], [100], [300],
  [Plano 200Mbps], [150], [300],
  [Plano 500Mbps], [200], [300],
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

== Ampliação da Rede (cenários futuros)

COLOCAR AQUI AMPLIAÇÃO

- MIGRAR DROP 24 PARA 36FO 

- realizar fusões diretas nas caixas ao invés de splitter 1x2

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
              [Temperature Range], [\~40 \~+85℃],
              [Preço], [R\$ 1.200,00],
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
          #link("https://www.kalunga.com.br/prod/nobreak-senoidal-racktorre-snb-3000va-bi-rt-4822042-intelbras-cx-1-un/446921?srsltid=AfmBOor7xTK77tKhOoruNxiUYvhupgtyOCmuuafeMHAcDGk9F_fYu8XBp6M")[Ref: Splitter Desbalanceado]
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
          #link("https://www.kalunga.com.br/prod/nobreak-senoidal-racktorre-snb-3000va-bi-rt-4822042-intelbras-cx-1-un/446921?srsltid=AfmBOor7xTK77tKhOoruNxiUYvhupgtyOCmuuafeMHAcDGk9F_fYu8XBp6M")[Ref: Splitter Balanceado]
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

        ],
        [
        #figure(
          figure(
            rect(image("./pictures/dio.jpeg", width: 35%)),
            numbering: none,
            caption: figure.caption([Distribuidor Interno Óptico], position: top)
          ),
        )
         #link("https://www.mercadolivre.com.br/mini-dio-em-aco-12fo-sc-preto/p/MLB28125651?utm_source=chatgpt.com")[Ref: DIO]
        ],
    ),
)

== Rack de Telecomunicações

#figure(
  figure(
    rect(image("./pictures/rack.jpeg", width: 65%, height: 65%)),
    numbering: none,
    caption: figure.caption([Rack de Telecomunicações], position: top)
  ),
)
#align(center)[
 #link("https://produto.mercadolivre.com.br/MLB-4750152146-rack-telecom-cabeamento-dados-cftv-19-10u-x-570mm-_JM?matt_tool=18956390&utm_source=google_shopping&utm_medium=organic")[R\$648,82]
]
== Patch-cords de Fibra Óptica

#figure(
  figure(
    rect(image("./pictures/patch_cord.jpeg", width: 45%)),
    numbering: none,
    caption: figure.caption([Patch-cord], position: top)
  ),
) 
#align(center)[
#link("https://www.mercadolivre.com.br/10-x-cordo-optico-patch-cord-sc-apc-sc-apc-15m/p/MLB39324367#polycard_client=search-nordic&searchVariation=MLB39324367&wid=MLB4996931928&position=4&search_layout=grid&type=product&tracking_id=ded7b86f-72d4-4d2f-80a4-f0ddc19da19b&sid=search")[R\$7,90 / m]
]


== Conectores e acopladores SC/APC e SCP/UPC


= Lançamento e Ancoragem:

== Backbone Mini-RA (AS-80) 36FO


GPT achou esse de  36FO mas parece estar mt barato:

https://www.alibaba.com/product-detail/fiber-optic-cable-36-core-single_60815455138.html?spm=a2700.7724857.0.0.27fb1796JHLnpO


e esse de 24FO (muitooo mais caro):

https://radiocom.com.co/producto/cable-fibra-optica-gyfty53-monomodo-24-fibras-pe-bloqueo-agua/?utm_source=chatgpt.com

== Derivação Mini-RA  6FO 

#figure(
  figure(
    rect(image("./pictures/6fo.jpeg", width: 65%)),
    numbering: none,
    caption: figure.caption([6FO], position: top)
  ),
)

== Distribuição Drop 1FO

== CE/CF (Caixa de Emenda/Fusão)

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 

          #figure(
           figure(
             rect(image("./pictures/emenda_poste.jpeg", width: 65%)),
             numbering: none,
             caption: figure.caption([Caixa de emenda no poste], position: top)
           ),
          )
        ],
        [
          #figure(
           figure(
             rect(image("./pictures/suporte_emenda.jpeg", width: 65%)),
             numbering: none,
             caption: figure.caption([Suporte pra caixa de emenda], position: top)
           ),
          )
        ],
    ),
)

== CTO (Caixa de Terminação Óptica)

#figure(
  figure(
    rect(image("./pictures/caixaterminaloptica.jpeg", width: 65%)),
    numbering: none,
    caption: figure.caption([CTO], position: top)
  ),
)


== Cojunto de Ancoragem


#figure(
  figure(
    rect(image("./pictures/abracadeira_bap.jpeg", width: 25%)),
    numbering: none,
    caption: figure.caption([abracadeira bap], position: top)
  ),
)

#figure(
  figure(
    rect(image("./pictures/alca_preformada.jpeg", width: 25%)),
    numbering: none,
    caption: figure.caption([alça preformada], position: top)
  ),
)

- Abraçadeira BAP-3
- Isolador BAP-3 (n achei)
- Alça Preformada
- Cruzeta (n achei, n sei se esse é a rozeta ou outra coisa).

= Alugueis

== Poste 

== POP (Ponto de Presença)

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 

          #figure(
           figure(
             rect(image("./pictures/pop.jpeg", width: 90%)),
             numbering: none,
             caption: figure.caption([POP], position: top)
           ),
          )
        ],
    ),
)

== Uplink



= Mão de Obra Técnica

== Opção 1: Prestação de Serviços

== Mão de Obra:

A mão de obra foi definida com base em discussão em sala, foi colocado um valor definido por demanda da mão de obra, apenas para simplificar o cálculo. 

#align(center)[
#table(
  columns: 3,
  table.header(
    [Serviço], [Custo Mensal], [Quantidade]
  ),
  [Instalação POP], [5000], [1],
  [Instalação Residencial], [50], [1280],
  [Instalação Infraestrutura PON], [1], [10000],
  [Fusões], [1], [1000],
)
]

== Opção 2: Contratação de Funcionários


= Custos Empresariais

== Abertura da empresa 

== Impostos 

== Taxas de Licenciamento

==  Custos de divulgação / Marketing

= Análise de Viabilidade Econômica

== Despesas 

- instalações
- manutenção da rede
- alugueis 
- mão de obra / salários
- impostos 
- marketing
- custos de abertura
- custos de equipamentos
- custos de energia

== Receitas (Bruta)

- mensalidade dos clientes
- venda de equipamentos (instalação)


== Receitas (Descontada)

- Procurar impostos para descontar no valor bruto (ICMS, ISS, etc), ver se entra agencias, imposto sobre Prestação de serviço ou comercio. 

==  Fluxo de Caixa

== Payback

== TIR (Taxa Interna de Retorno)

== VPL (Valor Presente Líquido)

= Conclusão


