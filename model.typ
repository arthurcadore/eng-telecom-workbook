#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)

#show: doc => report(
  title: "Nome do Relatório",
  subtitle: "Disciplina / Área de atuação",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "DD de Mês de YYYY",
  doc,
)

= Exemplo de instânciação de componentes: 

== Imagem de exemplo: 

#figure(
  figure(
    image("./pictures/timeDomain.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Tabela de exemplo: 

#table(
  columns: (1fr, 1fr, 1fr),
  table.header[Implementacao][Área][Tempo de propagação],
  [Parte 1], [], [],
  [Parte 2], [], [],
)

== Trecho de código de exemplo: 

#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
    port (
        A      : in  std_logic_vector (7 downto 0);
        sd, su, sc : out std_logic_vector (3 downto 0)
    );
end entity;
```]

= Introdução

Seção I - Descrição do que será desenvolvido/abordado no relatório

= Fundamentação teórica

Seção II - Conceitos teóricos utilizados no relatório

= Análise dos resultados

Seção III - Apresentação e comentários dos gráfios/figuras das etapas de desenvolvimento do relatório

= Scripts e Códigos Utilizados:
Seção IV -  Scripts e Codigos

= Conclusão
Seção V - Conclusões

= Referências

Para o desenvolvimento deste relatório, foi utilizado o seguinte material de referência:

- #link("https://www.researchgate.net/publication/287760034_Software_Defined_Radio_using_MATLAB_Simulink_and_the_RTL-SDR")[Software Defined Radio Using MATLAB & Simulink and the RTL-SDR, de Robert W. Stewart]