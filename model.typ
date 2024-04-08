#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#show: doc => report(
  title: "Nome do Relatório",
  subtitle: "Disciplina / Área de atuação",
  authors: ("Arthur Cadore Matuella Barcella",),
  date: "DD de Mês de YYYY",
  doc,
)

= Introdução

Seção I - Descrição do que será desenvolvido/abordado no relatório

Imagem de exemplo: 

#figure(
  outlined: true,
  image("./pictures/image.png", width: 60%),
  caption: [Definições de $x_1[n]$ e $x_2[n]$ \ Figura elaborada pelo autor],
  supplement: "Figura"
);

Tabela de exemplo: 

#table(
  columns: (1fr, 1fr, 1fr),
  table.header[Implementacao][Área][Tempo de propagação],
  [Parte 1], [], [],
  [Parte 2], [], [],
)

trecho de código de exemplo: 

== bin2bcd
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

architecture ifsc_v1 of bin2bcd is
    signal A_uns          : unsigned (7 downto 0);
    signal sd_uns, su_uns, sc_uns : unsigned (7 downto 0);

begin
    A_uns  <= unsigned(A);
	 sc_uns <= A_uns/100;
    sd_uns <= A_uns/10;
    su_uns <= A_uns rem 10;
    sc     <= std_logic_vector(resize(sc_uns, 4));
    sd     <= std_logic_vector(resize(sd_uns, 4));
    su     <= std_logic_vector(resize(su_uns, 4));
end architecture;
```]

= Fundamentação teórica

Seção II - Conceitos teóricos utilizados no relatório

= Análise dos resultados

Seção III - Apresentação e comentários dos gráfios/figuras das etapas de desenvolvimento do relatório

= Scripts e Códigos Utilizados:
Seção IV -  Scripts e Codigos

= Conclusões
Seção V - Conclusões

= Referências
Seção VI - Referências bibliograficas