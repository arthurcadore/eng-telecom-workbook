#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)
#show: doc => report(
  title: "Dispositivos Lógicos Progamáveis II",
  subtitle: "Implementação de PLL para Relógio Digital (Milisegundos)",
  authors: ("Arthur Cadore Matuella Barcella e Gabriel Luiz Espindola Pedro",),
  date: "23 de Abril de 2024",
  doc,
)

= Introdução

Neste relatório, será apresentado o desenvolvimento de um relógio digital com precisão de milisegundos, utilizando um PLL (Phase-Locked Loop) para a geração de um sinal de clock de 5 kHz. O projeto foi desenvolvido utilizando a ferramenta Quartus Prime Lite Edition 20.1.0.720 e a placa de desenvolvimento DE2-115.


= Implementação 

A primeira etapa da implementação é a geração de um sinal de clock de 5 kHz. Para isso, foi utilizado um PLL com um clock de entrada de 50 MHz (valor de clock padrão para o chip implantado nesta placa). 
\


Para isso, geramos o PLL através da ferramenta `PLL Intel FPGA IP`. Após a configuração do PLL, o sinal de clock de 5 kHz foi obtido na saída deste componente, sendo na sua configuração um *divisor de frequência de 10.000.*
\

Abaixo está uma sessão do código VHD gerado pelo Quartus para a configuração do PLL.
\

#sourcecode[```vhd
	GENERIC MAP (
		bandwidth_type => "AUTO",
		clk0_divide_by => 25000,
		clk0_duty_cycle => 50,
		clk0_multiply_by => 1,
		clk0_phase_shift => "0",
		compensate_clock => "CLK0",
		inclk0_input_frequency => 20000,
		intended_device_family => "Cyclone IV E",
		lpm_hint => "CBX_MODULE_PREFIX=pll",
		lpm_type => "altpll",
		operation_mode => "NORMAL",
		pll_type => "AUTO",
```]



#figure(
  figure(
    image("./pictures/pinplanner.png"),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


= Implementação com somador binário e conversor BCD


= Conclusão


A partir da implementação do PLL vista anteriormente, juntamente com a implementação de divisão de clock sem o uso do PLL, podemos concluir que a utilização de um PLL é muito útil para a geração de sinais de clock com frequências específicas de maneira confiável.

Isso pois o PLL é capaz de gerar sinais de clock com frequências específicas, além de possuir uma maior precisão e estabilidade em relação a outros métodos de geração de clock.

Abaixo estão as principais diferenças de tempo de propagação e quantidade de registradores utilizados entre a implementação com e sem o uso do PLL: 

#figure(
  figure(
    table(
     columns: (1fr, 1fr, 1fr),
    align: (left, center, center),
    table.header[Implementacao][Área (LE)][Registradores],
    [Parte 1], [239], [124],
    [Parte 2], [83], [13.699],
    ),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)




= Códigos VHDL utilizados



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

O código binAdder é reponsavel por somar dois números binários de 7 (128 represetações possiveis, e portanto atendendo a especificação) bits e retornar o resultado em binário com 8 bits.