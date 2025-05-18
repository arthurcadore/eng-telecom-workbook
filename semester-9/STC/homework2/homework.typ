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
  title: "Projeto 2 - Link PTMP com RadioMobile",
  subtitle: "Sistemas de Telecomunicações",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "16 de Maio de 2025",
  doc,
)

= Introdução


#figure(
  figure(
    rect(image("./pictures/image.png")),
    numbering: none,
    caption: [Distância entre POPs ]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)