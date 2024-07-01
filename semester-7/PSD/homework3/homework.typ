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
  title: "Filtros Digitais",
  subtitle: "Processamento de Sinais Digitais",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "05 de Maio de 2024",
  doc,
)

= Questão 1:

Projete um filtro passa-baixas usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 200
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 

= Questão 2: 

Projete um filtro passa-altas usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 
- Agora aumente o número de amostras, mantendo a paridade e faça suas considerações.

= Questão 3: 

Projete um filtro passa-faixa usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 
- Agora aumente o número de amostras, mantendo sua paridade e faça suas considerações.

= Questão 4: 

Projete um filtro rejeita-faixa usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 


= Questão 5: 

Projete um filtro passa-faixa tipo III usando o método da amostragem em frequência que satisfaça a especificação a seguir:

- M = 52
- $Omega "r1"$ = 2 $"rad" / s$ 
- $Omega "p1"$ = 3 $"rad" / s$ 
- $Omega "r2"$ = 7 $"rad" / s$ 
- $Omega "p2"$ = 8 $"rad" / s$ 
- $Omega s$ = 20,0 $"rad" / s$ 

= Questão 6:

Projete um filtro passa-baixas usando o método da amostragem em frequência que satisfaça a especificação a seguir

- M = 53
- $Omega p$ = 4 $"rad" / s$ 
- $Omega r$ = 4,2 $"rad" / s$ 
- $Omega s$ = 10,0 $"rad" / s$ 
