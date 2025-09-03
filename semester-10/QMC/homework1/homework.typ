#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: doc => report(
  title: "Questionário 1 - Aplicação de elementos químicos na Telecomunicações",
  subtitle: "Química Geral",
  authors: ("Arthur Cadore Matuella Barcella","Gustavo Briance Mengue Mena"),
  date: "1 de Setembro de 2025",
  doc,
)

= Introdução

A química é uma ciência que estuda as substâncias e suas transformações. Ela é fundamental para a compreensão de muitos processos que ocorrem na natureza e na indústria. No caso da Telecomunicações, a química desempenha um papel crucial na compreensão e desenvolvimento de muitos dos componentes e processos que permitem a transmissão de dados e informações.

= Questões

== Quais elementos químicos da tabela periódica que são empregados em Telecomunicações? Relacionar os elementos empregados em telecomunicações com as suas propriedades e aplicação.

#align(center)[
#table(
  columns: 3,
  table.header(
    [Elemento], [Aplicação Principal], [Função]
  ),
  [Silício $"Si"$], [Chips, transistores, circuitos integrados], [Semi-condutor],
  [Fósforo $"P"$], [Chips, transistores, circuitos integrados], [Dopante N (N-type)],
  [Boro $"B"$], [Chips, transistores, circuitos integrados], [Dopante P (P-type)],
  [Gálio $"Ga"$], [LEDs, lasers semicondutores], [Base para GaAs, GaN],
  [Arsênio $"As"$], [Semicondutores (GaAs)], [Aumenta mobilidade de elétrons],
  [Germânio $"Ge"$], [Fibra óptica, semicondutores], [Baixa atenuação, sensibilidade IR],
  [Ítrio $"Y"$], [Amplificadores ópticos], [Elemento em dopagem de fibras],
  [Érbio $"Er"$], [Fibras ópticas amplificadas (EDFA)], [Amplificação em 1550nm],
  [Neodímio $"Nd"$], [Lasers de telecomunicações], [Fonte de emissão coerente],
  [Cobre $"Cu"$], [Cabos metálicos, conexões elétricas], [Alta condutividade],
  [Alumínio $"Al"$], [Cabos coaxiais, antenas], [Condutor leve],
  [Ouro $"Au"$], [Conexões em circuitos integrados], [Alta condutividade, anticorrosivo],
  [Prata $"Ag"$], [Conectores RF, revestimentos], [Melhor condutor elétrico],
)
]

== Pesquisa sobre elementos químicos aplicados em Telecomunicações

Um exemplo interessante do uso de elementos químicos em telecomunicações vem das *baterias de íons de lítio (Li-ion)*, que são fundamentais para alimentar celulares, roteadores móveis, notebooks e até estações base menores.  

Fonte 1: O artigo analisa o papel do *Silício (Si)* como substituto do *Carbono (C)* (grafite) nos anodos das baterias de lítio. A vantagem do Silício é a sua *capacidade de armazenar muito mais íons de Lítio (Li)* do que o carbono, permitindo que dispositivos móveis funcionem por mais tempo com uma única carga — algo essencial para a autonomia em redes móveis de alta demanda, como *5G* e futuras *6G*.  

O grande desafio, porém, é que o Silício sofre *expansão volumétrica (inchaço)* durante o processo de carga e descarga, o que pode levar à *fragmentação do material* e à perda de eficiência da bateria. Para superar isso, os cientistas têm explorado soluções como:

- Usar *nanopartículas de silício*, que suportam melhor a expansão.
- Criar *compósitos de Silício + Carbono*, unindo a alta capacidade do Si à estabilidade do C.
- Desenvolver *revestimentos e ligas especiais* que diminuem a degradação.  

Essa pesquisa mostra como um elemento tão presente na eletrônica (Si, base dos chips e semicondutores) também pode revolucionar o setor de *energia para telecomunicações*, aumentando a eficiência e a confiabilidade dos dispositivos que mantêm nossa sociedade conectada.  

= Referência:

[1] ASHOUR, A. S.; KHALID, M.; HAKEEM, A. S.; RAHIM, A. A. A critical review of developments on silicon anodes for lithium-ion batteries. *Journal of Power Sources*, Amsterdam, v. 258, p. 163-176, jul. 2014.
