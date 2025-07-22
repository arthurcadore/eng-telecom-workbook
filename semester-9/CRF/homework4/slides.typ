#import "@preview/slydst:0.1.4": *
#import "@preview/codelst:2.0.2": sourcecode
#show heading: set block(below: 1.5em)
#set text(size: 12pt)
#set text(lang: "pt")
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)

#show: slides.with(
  title: "Modulador e demodulador BPSK",
  subtitle: "Circuitos de Rádio Frequência",
  date: "22 de Julho de 2025",
  authors: ("Arthur Cadore M. Barcella , Gabriel Luiz, Gustavo"),
  layout: "medium",
  ratio: 16/9,
  title-color: none,
)

== Sumário

 
#outline()

= Sinal BPSK

== Formato do sinal 

#figure(
  figure(
    rect(image("./scripts/sinal_bpsk.svg", width: 100%)),
    numbering: none,
    caption: [Modulador],
  ),

)

== FFT do sinal 


#figure(
  figure(
    rect(image("./scripts/fft_bpsk.svg", width: 100%)),
    numbering: none,
    caption: [FFT do sinal],
  ),

)

== Aplicações 

- Simulação do sinal BPSK
- Simulação do demodulador
- Simulação da curva BER vs SNR

== Curva BER vs SNR 

#figure(
  figure(
    rect(image("./scripts/curva_ber_comparativa.svg", width: 100%)),
    numbering: none,
    caption: [Curva BER vs SNR],
  ),

)

= Modulador

== Esquemático do modulador

#align(horizon+center)[
#figure(
  figure(
    rect(image("./pictures/esq_modulador.svg", width: 100%)),
    numbering: none,
    caption: [Circuito Modulador],
  ),

)
]

== Simulação do modulador

#figure(
  figure(
    rect(image("./pictures/modulador2.png", width: 100%)),
    numbering: none,
    caption: [Sinal Modulado no tempo],
  ),

)

== FFT Modulante 

#figure(
  figure(
    rect(image("./pictures/fft_modulante.png", width: 100%)),
    numbering: none,
    caption: [FFT modulante],
  ),

)

== FFT Portadora 

#figure(
  figure(
    rect(image("./pictures/fft_carrier.png", width: 100%)),
    numbering: none,
    caption: [FFT portadora],
  ),

)
== Sinal modulado

#figure(
  figure(
    rect(image("./pictures/modulador.png", width: 100%)),
    numbering: none,
    caption: [Sinal modulado],
  ),

)

== FFT Sinal Modulado

#figure(
  figure(
    rect(image("./pictures/fft_bpsk.png", width: 100%)),
    numbering: none,
    caption: [FFT sinal modulado],
  ),

)

= Demodulador

== Esquemático do demodulador
#align(horizon+center)[
#figure(
  figure(
    rect(image("./pictures/esq_demodulador.svg", width: 100%)),
    numbering: none,
    caption: [Circuito Demodulador],
  ),

)
]

== Simulação do demodulador

#figure(
  figure(
    rect(image("./pictures/demodulado.png", width: 100%)),
    numbering: none,
    caption: [Sinal demodulado no tempo],
  ),

)

== FFT Demodulado

#figure(
  figure(
    rect(image("./pictures/fft_demodulado.png", width: 100%)),
    numbering: none,
    caption: [FFT sinal demodulado],
  ),

)

= Cadeia de modulação e demodulação

== Esquemático da cadeia

#align(horizon+center)[
#figure(
  figure(
    rect(image("./pictures/moddemod.svg", width: 100%)),
    numbering: none,
    caption: [Modulador e Demodulador],
  ),

)
]


== Sinal modulado vs sinal demodulado

#figure(
  figure(
    rect(image("./pictures/demodulado2.png", width: 100%)),
    numbering: none,
    caption: [Comparação sinal modulante e sinal demodulado],
  ),

)

= Conclusão

== Conclusão

- colocar conclusão aqui 

