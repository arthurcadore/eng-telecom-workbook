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


- asifjasdm

- asjdaosd

- ajsksda

- asdkmasd

= Escolha do Local

== Mapa Topográfico

== Verificação de Habitantes (IBGE)

== Verificação de Empresas (Telecomunicações)

== Verificação de Preços de Internet

Os planos de internet foram definidos com base em pesquisa de mercado, considerando os planos de internet mais comuns no local de instalação e seu valor correspondente.

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

== Mapa de atendimento PON

- Destacar que escolhemos o centro da cidade para a implantação da rede GPON, pois é o local com maior concentração de habitantes e empresas, o que justifica o investimento.

== Topologia da Rede


== Backbone da Rede

== Derivação e Distribuição


== Ampliação da Rede (cenários futuros)



= Equipamentos Ativos:

== OLT 

colocar foto e especificações


Colocar ref 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #figure(
           figure(
             rect(image("./pictures/OLT.png", width: 60%)),
             numbering: none,
             caption: figure.caption([OLT - Optical Line Terminal], position: top)
           ),
          )
          #link("http://asdasd")[aasdasd]
        ],
        [
          #align(horizon+center)[
            
          #figure(
           figure(
             rect(image("./pictures/GPOA.png", width: 90%)),
             numbering: none,
             caption: figure.caption([GPOA - Placa GPON (16 portas)], position: top)
           ),
          )
          ]
          #link("http://asdasd")[aasdasd]

        ],
    ),
)




== ONU

colocar foto e 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
          #align(left)[ 
              ASKDMAKSDAKSDMPAOSKDMASKDAPOSDKASPODKAPSODKAS
          ]
          #figure(
            figure(
              table(
               columns: (1fr,  1fr),
              align: (left, center),
              table.header[Especificação][Valor],
              [Potência], [± 10 ppm], 
              [Temperature Range], [\~40 \~+85℃],
              [Aging (at 25℃ )], [± 5 ppm / year],
              ),
              numbering: none,
              caption: figure.caption([Especificações Técnicas], position: top)
            ),
          )
        ],
        [

         ASKLDAMLSDKMASDMASDKMALSKDMLA

          #figure(
           figure(
             rect(image("./pictures/ONU.png", width: 65%)),
             numbering: none,
             caption: figure.caption([ONU - Optical Network Unit], position: top)
           ),
          )
        ],
    ),
)


== Transceivers

colocar foto e especificações

== Nobreak

colocar foto e especificações

= Equipamentos Passivos

== Splitters Balanceados

 colocar uma foto e uma tabela de atenuação. 

== Splitters Desbalanceados

== DIO (Distribuidor Interno Óptico)

== Rack de Telecomunicações

== Patch-cords de Fibra Óptica


== Conectores e acopladores SC/APC e SCP/UPC


= Lançamento e Ancoragem:

== Backbone Mini-RA (AS-80) 36FO

Procurar Preço 24/36FO 

== Derivação Mini-RA  6FO 

== Distribuição Drop 1FO

== CE/CF (Caixa de Emenda/Fusão)

== CTO (Caixa de Terminação Óptica)

== Cojunto de Ancoragem

- Abraçadeira BAP-3
- Isolador BAP-3
- Alça Preformada
- Cruzeta

= Alugueis

== Poste 

== POP (Ponto de Presença)

- foto do POP via street view 

== Uplink

se possivel procurar por cotação (joga no chat umas trẽs posibilidades com ref)

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


