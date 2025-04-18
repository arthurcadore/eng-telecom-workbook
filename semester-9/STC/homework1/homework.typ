#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show table.cell.where(y: 0): strong
#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: (x, y) => (
    if x > 0 { center }
    else { left }
  )
)

#show: doc => report(
  title: "Projeto 1 - Link PTP com RadioMobile",
  subtitle: "Sistemas de Telecomunicações",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "10 de Abril de 2025",
  doc,
)

= Introdução: 

== Requisitos do proejto: 

- Solução: PTP para estabelecer link redundante entre dois POPs (Ponto de Presença) de provedores para acesso a internet. 
- Enlace PTP 
- Distância: min 3km
- Taxa de Confiabilidade: < 85%

== Especificação do PTP:

- Distância estabelecida: 9,71km

Na Figura 1 apresentada abaixo é possível observar a distância entre os dois POPs, que foram definidos como POP1 e POP2.

#figure(
  figure(
    rect(image("./pictures/distance.png")),
    numbering: none,
    caption: [Distância entre POPs ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Desenvolvimento: 

== Definição das coordenadas dos POPs

POP Actual: -27.575749467926816, -48.60869538318272

#figure(
  figure(
    rect(image("./pictures/pop_actual.png")),
    numbering: none,
    caption: [POP Actual ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

- POP Palhoça: -27.6461879263444, -48.66701470039055

#figure(
  figure(
    rect(image("./pictures/pop_palhoça.png")),
    numbering: none,
    caption: [POP Palhoça ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Analisando visada direta: 

Realizando um PTP diretamente entre os POPs nota-se que não a visada devido ao desnível do terreno, portanto é necessário uma repetição do enlace. 

Note que na Figura 4, é apresentado uma simulação entre os dois POPs diretamente, onde a zona de fresnel está totalmente obstruída, o que impossibilita a comunicação entre os dois pontos.

#figure(
  figure(
    rect(image("./pictures/PTP_direto.png")),
    numbering: none,
    caption: [POP Palhoça ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Definição de repetição: 

Para que o enlace funcione, é necessário a repetição do sinal. Para isso, foi definido um ponto intermediário entre os dois POPs, onde atualmente já possuem torres de telecomunicações.

#figure(
  figure(
    rect(image("./pictures/1.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Verificando as torres disponíveis, foi definido a torre da operadora claro como ponto de repetição: 

#figure(
    grid(
        columns: (auto, auto),
        rows:    (auto, auto),
        gutter: 1em,
        [ 
#figure(
  figure(
    rect(image("./pictures/torre_claro1.png",width: 75%)),
    numbering: none,
    caption: [Torre claro vista do morro]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
        ],
        [
#figure(
  figure(
    rect(image("./pictures/torre_claro2.png",width: 75%)),
    numbering: none,
    caption: [Torre claro vista street view]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
        ],
    ),
)

== Definição de repetição:

Para que o enlace funcione, é necessário a repetição do sinal. Para isso, foi definido um ponto intermediário entre os dois POPs, onde atualmente já possuem torres de telecomunicações.

=== PTP Torre Claro - POP Palhoça: 


#figure(
  figure(
    table(
     columns: (1fr, 1fr),
    align: (left, center),
    table.header[Especificação][Valor],
    [TX power	      ],  [29.03	dBm],
    [TX line loss	  ],  [0.50	dB],
    [TX antenna gain	],  [35.00	dBi],
    [RX antenna gain	],  [35.00	dBi],
    [RX line loss	  ],  [0.50	dB],
    [RX sensitivity	],  [-65.42	dBm],
    [Free space loss	  ],[121.84	dB],
    [Obstruction loss	],[0.38	dB],
    [Forest loss	      ],[0.00	dB],
    [Urban loss	      ],[0.00	dB],
    [Statistical loss	],[13.23	dB],
    [Total path loss	  ],[135.45	dB],
    ),
    numbering: none,
    caption: [Tabela de resultados da implementação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/PTP_palhoça-Torre.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/PTP_palhoça-Torre2.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Adiquirindo a seginte performace: 

#figure(
  figure(
    table(
     columns: (1fr, 1fr),
    align: (left, center),
    table.header[Especificação][Valor],
    [Distance	            ],[5.246	km],
    [Precision	            ],[10.0	m],
    [Frequency             ],[5650.000	MHz],
    [EIRP	                ],[2254.706	W],
    [System gain	          ],[163.45	dB],
    [Required reliability	],[85.000	%],
    [Received Signal	      ],[-37.42	dBm],
    [Received Signal	      ],[3014.28	μV],
    [Fade Margin	          ],[28.00	dB],
    ),
    numbering: none,
    caption: [Tabela de resultados da implementação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== PTP Torre Claro - POP Actual:

#figure(
  figure(
    table(
     columns: (1fr, 1fr),
    align: (left, center),
    table.header[Especificação][Valor],
    [TX power	        ],[29.03	dBm],
    [TX line loss	    ],[0.50	dB],
    [TX antenna gain	  ],[35.00	dBi],
    [RX antenna gain	  ],[35.00	dBi],
    [RX line loss	    ],[0.50	dB],
    [RX sensitivity	  ],[-113.02	dBm],
    [Free space loss	  ],[120.41	dB],
    [Obstruction loss	],[-0.35	dB],
    [Forest loss	      ],[0.00	dB],
    [Urban loss	      ],[0.00	dB],
    [Statistical loss	],[13.25	dB],
    [Total path loss	  ],[133.31	dB],
    ),
    numbering: none,
    caption: [Tabela de resultados da implementação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/PTP_actual_Torre.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/PTP_actual_Torre2.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    table(
     columns: (1fr, 1fr),
    align: (left, center),
    table.header[Especificação][Valor],
    [Distance	            ],[4.451	km],
    [Precision	            ],[10.0	m],
    [Frequency	            ],[5650.000	MHz],
    [EIRP	                ],[2254.706	W],
    [System gain	          ],[211.05	dB],
    [Required reliability	],[85.000	%],
    [Received Signal	      ],[-35.28	dBm],
    [Received Signal	      ],[3853.78	μV],
    [Fade Margin	          ],[77.74	dB],
    ),
    numbering: none,
    caption: [Tabela de resultados da implementação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Especificação dos equipamentos:

=== Radio APC-5A Giga: 

#figure(
  figure(
    rect(image("./pictures/APC_5A-giga.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

=== Antena 5Ghz:

#figure(
  figure(
    rect(image("./pictures/Antena.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/Antena2.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

#figure(
  figure(
    rect(image("./pictures/Antena3.png")),
    numbering: none,
    caption: [Mapa de torres de telecomunicações - Fonte[1] ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Orçamento 

O curso total orçado para a implementação do enlace PTP entre os dois POPs, considerando a repetição do sinal na torre da claro é de R\$ 17.115,04 + R\$ 1000,00 (aluguel da torre)

Portanto, no primeiro mês, após a instalação, o custo será: R\$ 18.115,04

E nos meses seguintes , o custo será de R\$ 1.000,00 (aluguel da torre)

=== Equipamentos

- Antena: 3.506,76
- Radio: 400,00

Como são utilizados 2 PTPs, o custo total de equipamento é de: 

- Antena: 3.506,76 . 4 = 14.027,04
- Radio: 400,00 . 4 = 1.600,00
- Total: 15.627,04 

=== Mão de Obra

- Considerando cada técnico com uma diária de R\$248,00 (R\$ 5463 / mês)

- Equipe de 2 técnicos para instalação: 248 . 2 = 496,00 / dia

- Considerando 3 dias de instalação e testes (um dia para cada localização): 3 . 496,00 = 1488,00
- Total: 1488,00

== Alugel da Torre: 

- Considerando o aluguel da torre da claro, o custo mensal é de R\$ 1.000,00
- Considerando o aluguel por 12 meses, o custo total é de R\$ 12.000,00
- Total: 12.000,00

= Conclusão: 

= Referências: 

[1] - #link("https://conexis.org.br/numeros/mapa-de-antenas-completo/#")[Mapa de torres Santa Catarina]