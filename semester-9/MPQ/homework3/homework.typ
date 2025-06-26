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
  title: "Estudo Experimental de Associações de Resistores em Série e Paralelo",
  subtitle: "Relatório de Laboratório",
  authors: ("Arthur Cadore Matuella Barcella, Faber Bernardo Junior",),
  date: "Junho de 2025",
  doc,
)

= Introdução:

Este experimento tem como objetivo analisar o comportamento de associações de resistores em série e paralelo, utilizando cinco resistores de 1kΩ e cinco de 1MΩ. Serão realizadas medições em corrente contínua (CC) e corrente alternada (CA), empregando multímetro e osciloscópio para observar as respostas dos circuitos.

= Revisão de literatura:

A associação de resistores é fundamental em circuitos elétricos. Em série, a resistência equivalente é a soma dos valores individuais. Em paralelo, o inverso da resistência equivalente é a soma dos inversos das resistências. Em CA, além da resistência, pode haver influência de capacitâncias e indutâncias parasitas, especialmente em altas frequências. O multímetro permite medir resistência, tensão e corrente em CC e CA, enquanto o osciloscópio possibilita a análise de formas de onda e resposta dinâmica dos circuitos.

= Materiais e métodos:

- 5 resistores de 1kΩ
- 5 resistores de 1MΩ
- Fonte de alimentação CC
- Gerador de funções (CA)
- Multímetro digital
- Osciloscópio
- Protoboard e cabos

Foram montados circuitos com resistores em série, paralelo e mista. As medições de resistência, tensão e corrente foram realizadas com o multímetro. Para análise em CA, aplicou-se um sinal senoidal e observou-se a resposta no osciloscópio.

= Cálculos e resultados obtidos:

== Cálculo teórico das resistências equivalentes:

#sourcecode[```python
# Resistores de 1kΩ
R_1k = 1000  # ohms
n_1k = 5
# Série
Req_serie_1k = n_1k * R_1k
# Paralelo
Req_paralelo_1k = R_1k / n_1k
print(f"Req série 1kΩ: {Req_serie_1k} Ω")
print(f"Req paralelo 1kΩ: {Req_paralelo_1k} Ω")

# Resistores de 1MΩ
R_1M = 1_000_000  # ohms
n_1M = 5
Req_serie_1M = n_1M * R_1M
Req_paralelo_1M = R_1M / n_1M
print(f"Req série 1MΩ: {Req_serie_1M} Ω")
print(f"Req paralelo 1MΩ: {Req_paralelo_1M} Ω")
```]

== Tabela de valores medidos (exemplo):

| Associação      | Teórico (Ω) | Medido CC (Ω) | Medido CA (Ω) |
|-----------------|-------------|---------------|---------------|
| Série 1kΩ       | 5000        |               |               |
| Paralelo 1kΩ    | 200         |               |               |
| Série 1MΩ       | 5000000     |               |               |
| Paralelo 1MΩ    | 200000      |               |               |

== Medidas de tensão e corrente (exemplo):

| Associação      | Tensão (V) | Corrente (mA) | Fonte         |
|-----------------|------------|---------------|---------------|
| Série 1kΩ       |            |               | CC/CA         |
| Paralelo 1kΩ    |            |               | CC/CA         |
| Série 1MΩ       |            |               | CC/CA         |
| Paralelo 1MΩ    |            |               | CC/CA         |

== Observação de formas de onda (CA):

Inclua aqui capturas de tela do osciloscópio mostrando a resposta dos circuitos em CA, destacando possíveis atenuações ou distorções.

// #figure(
//   figure(
//     rect(image("./pictures/image.png", width: 100%)),
//     numbering: none,
//     caption: [Exemplo de forma de onda observada no osciloscópio],
//   ),
//   caption: figure.caption([Elaborada pelo Autor], position: top)
// )

= Discussão:

Analise as diferenças entre os valores teóricos e experimentais, possíveis causas de erro (tolerância dos resistores, contatos, instrumentos), e o comportamento dos circuitos em CA (ex: influência de capacitâncias parasitas em altas frequências).

= Conclusão:

Resuma os principais resultados e aprendizados do experimento, destacando a importância da associação de resistores e do uso dos instrumentos de medição.

= Referências:

- BOYLESTAD, R. L.; NASHELSKY, L. Dispositivos Eletrônicos e Teoria de Circuitos. 11. ed. São Paulo: Pearson, 2014.
- HAYT, W. H.; KEMMERLY, J. E.; DURBIN, S. M. Análise de Circuitos em Engenharia. 8. ed. Porto Alegre: AMGH, 2019.
- Manuais dos instrumentos utilizados. 