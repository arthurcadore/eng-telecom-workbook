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
  title: "Fichamento Crítico de Artigo",
  subtitle: "Metodologia de Pesquisa",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "11 de Abril de 2025",
  doc,
)

= Introdução:

Esta atividade tem como objetivo desenvolver um fichamento crítico de um artigo científico, aplicando as técnicas de leitura crítica e analítica aprendidas na disciplina de Metodologia de Pesquisa. O fichamento é uma ferramenta importante para a organização e síntese de informações relevantes, facilitando a compreensão e análise de textos acadêmicos.

== Tema escolhido:

O tema escolhido para o desenvolvimento dessa atividade foi "Measurement of OSPF-MPLS-TE-FRR Line Transitions and Data Losses", voltado para a análise de desempenho de protocolos de roteamento em redes IP, com foco na tecnologia MPLS-TE-FRR e sua eficiência em mitigar perdas de pacotes e reduzir o tempo de recuperação após falhas de enlace. *Link para acesso do artigo: #link("https://dergipark.org.tr/tr/download/article-file/39726")[Measurement of OSPF-MPLS-TE-FRR Line Transitions and Data Losses]*

== Legenda das cores: 

- 🟡 Ideias centrais / argumentos principais

- 🟠 Definições e conceitos técnicos

- 🔴 Problema de pesquisa / objetivos

- 🟢 Citações diretas relevantes

- 🔵 Metodologia e resultados principais


= Desenvolvimento: 

O desenvolvimento da atividade consistiu na leitura crítica do artigo selecionado, com o objetivo de identificar e analisar as principais ideias, conceitos e resultados apresentados pelos autores. A seguir, apresentamos uma tabela de fichamento crítico que sintetiza as informações mais relevantes do texto.

== Tabela de Fichamento: 
A tabela de fichamento crítico a seguir apresenta uma síntese das principais informações do artigo, organizadas de acordo com as categorias definidas na legenda.

#show table.cell.where(x: 0): strong

#align(left)[#table(
  columns: 2,
  gutter: 3pt,
  [Refer. do Texto], [Oğul, M., Akçam, N., Erkan, N. (2014). Measurement of OSPF-MPLS-TE-FRR Line Transitions and Data Losses. Balkan Journal of Electrical & Computer Engineering, 2(2).], 
  [Sinopse do texto], [O artigo analisa a eficiência da tecnologia MPLS-TE-FRR em redes IP para mitigar perdas de pacotes e reduzir o tempo de recuperação após falhas de enlace. Compara o desempenho do OSPF puro com a tecnologia MPLS-TE com Fast Reroute, usando geradores de tráfego Hping3 e Simena.],
  [Metodologia/Objetivos], [O objetivo central é comparar a performance do protocolo OSPF tradicional com a combinação OSPF+MPLS-TE-FRR no que se refere ao tempo de transição e perda de dados em caso de falhas de enlace.
  
  A metodologia envolve testes laboratoriais reais com roteadores Cisco GSR12000, com injeção de pacotes via Hping3 (em PCs Linux) e dispositivo Simena, simulando falhas e mensurando o desempenho de cada cenário. Os tempos de transição foram medidos em milissegundos e comparados entre as abordagens.
   ], 
  [Ideias Chave], [ 
    - Analisar / Apresentar solucação para perdas de pacotes  durante falhas de linha em redes IP
    - MPLS-TE-FRR garante tempos de transição < 50ms 
    - OSPF puro tem tempos de reconvergência > 200ms
    - FRR é mais eficiente e econômico que soluções com backup físico
    - Uso de MPLS para otimizar roteamento e recuperação de falhas
    - Uso de OSPF para roteamento em IP ao invés de roteamento estático / RIP
    ],
  [Citação],[
  - "Line transition time is guaranteed as under 50 ms on MPLS-TE-FRR used area" (p. 48)
  - "According to 100.000 packages sending per second, sending time for 201 packages is 201/100.000 = 0,00201s = 2,01ms" (p. 49)
  - "Transition time to backup line is circa 220ms when just OSPF protocol was used... But it is 2ms in MPLS-TE-FRR" (p. 50)
  ],
  [Comentários],[
    O texto traz dados empíricos relevantes que demonstram a superioridade técnica do MPLS-TE-FRR em ambientes que exigem alta disponibilidade e baixa latência. É particularmente útil para aplicações críticas como VoIP e sistemas industriais. Interessante também o uso comparativo entre ferramentas gratuitas (Hping3) e comerciais (Simena), refletindo realidades distintas de implementação.

    Essa metodologia pode ser adaptada para estudos de resiliência de redes corporativas ou acadêmicas, especialmente em contextos que lidam com alta carga de tráfego ou serviços sensíveis à perda.
  ],
  [Conclusão],[
    A tecnologia MPLS-TE com FRR apresenta vantagens claras na recuperação rápida de falhas de enlace e minimização de perdas de dados, especialmente quando comparada ao protocolo OSPF isolado. O uso de túneis de backup é uma solução eficaz e com menor custo do que enlaces físicos redundantes.
  ],
  [Referências],[
  - [1] Parziale et al. (2006), TCP/IP Tutorial
  - [4] Mishra & Sahoo (2007), S-OSPF
  - [10] Braden et al. (1997), RSVP
  - [11] Ghein (2007), MPLS Fundamentals
  - [14] Liotine (2003), Mission-critical network planning
  ]
)
]

== Artigo completo: 
