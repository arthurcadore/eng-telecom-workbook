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
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== FFT do sinal 


#figure(
  figure(
    rect(image("./scripts/fft_bpsk.svg", width: 100%)),
    numbering: none,
    caption: [FFT do sinal],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Aplicações 

= Modulador

== Esquemático do modulador

#figure(
  figure(
    rect(image("./pictures/esq_modulador.svg", width: 100%)),
    numbering: none,
    caption: [Modulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Simulação do modulador

#figure(
  figure(
    rect(image("./pictures/modulador2.png", width: 100%)),
    numbering: none,
    caption: [Modulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== FFT Modulante 

#figure(
  figure(
    rect(image("./pictures/fft_modulante.png", width: 100%)),
    numbering: none,
    caption: [FFT modulante],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== FFT Portadora 

#figure(
  figure(
    rect(image("./pictures/fft_carrier.png", width: 100%)),
    numbering: none,
    caption: [FFT portadora],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)
== Sinal modulado

#figure(
  figure(
    rect(image("./pictures/modulador.png", width: 100%)),
    numbering: none,
    caption: [Modulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Sinal Modulado no espectro 

#figure(
  figure(
    rect(image("./pictures/fft_bpsk.png", width: 100%)),
    numbering: none,
    caption: [Sinal Modulado no espectro],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

= Demodulador

== Esquemático do demodulador

#figure(
  figure(
    rect(image("./pictures/esq_demodulador.svg", width: 100%)),
    numbering: none,
    caption: [Demodulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Simulação do demodulador

#figure(
  figure(
    rect(image("./pictures/demodulado.png", width: 100%)),
    numbering: none,
    caption: [Demodulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Sinal demodulado



= Cadeia de modulação e demodulação

== Esquemático da cadeia

#figure(
  figure(
    rect(image("./pictures/moddemod.svg", width: 100%)),
    numbering: none,
    caption: [Modulador e Demodulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Sinal modulado vs sinal demodulado

#figure(
  figure(
    rect(image("./pictures/demodulado2.png", width: 100%)),
    numbering: none,
    caption: [Demodulador],
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Curva BER vs SNR

= Conclusão

== Conclusão

