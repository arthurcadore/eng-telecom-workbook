#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode

#show: doc => report(
  title: "Dispositivos Lógicos Progamáveis II",
  subtitle: "Consumo de área em bin2bcd e contagem binária",
  // Se apenas um autor colocar , no final para indicar que é um array
  authors: ("Arthur Cadore Matuella Barcella e Gabriel Luiz Espindola Pedro",),
  date: "02 de Abril de 2023",
  doc,
)

= Descrição de desenvolvimento

#figure(
  outlined: true,
  image("./assets/image.png", width: 80%),
  caption: [Definições de $x_1[n]$ e $x_2[n]$ \ Figura elaborada pelo autor],
  supplement: "Figura"
);

= Conceitos teóricos utilizados
\




= Implementação com somador BCD:
\

Para implementação da primeir parte da atividade, implementamos quatro códigos VHDL para a contagem ocorrer em diretamente em BCD. 

Para isso, utilizamos os códigos bcd_counter, bcd2ssd, bcd2ssd e project1.

= Implementação com somador binário e conversor BCD:
\
Para realizar a segunda etapa da atividade, implementamos quatro códigos VHDL para a contagem ocorrer em binário (de maneira mais simples), e em seguida realizar sua conversão para BCD. Para isso, utilizamos os códigos bin2bcd, binAdder e bcd2ssd, além de um código que declara os componentes utilizados, chamado project1.

O código bin2bcd é responsável por converter um número binário de 8 bits para BCD, dividindo o número em centenas, dezenas e unidades. \
O código binAdder é responsável por somar dois números binários de 8 bits, e o código bcd2ssd é responsável por converter um número BCD para um display de 7 segmentos. \
Por fim, o código project1 declara os componentes utilizados e realiza a conexão entre eles.

= Conclusão:
\

Podemos concluir que a implementação X é mais rápida devido ao tempo de propagação amostrado em cada um dos casos. Também podemos concluir que a implementação Y é mais eficiente em termos de área, pois o consumo de área foi menor em relação à implementação X. 

#table(
  columns: (1fr, 1fr, 1fr),
  table.header[Implementacao][Área][Tempo de propagação],
  [Parte 1], [], [],
  [Parte 2], [], [],
)

= Códigos VHDL utilizados - Parte 1:
\

#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity bcd_adder_4d is
    port(
        b0, b1: in std_logic_vector(3 downto 0);
        a0, a1: in std_logic_vector(3 downto 0);
        s0, s1, s2: out std_logic_vector(3 downto 0)
    );
end entity bcd_adder_4d;

architecture bcd_adder_4d of bcd_adder_4d is
    component bcd_adder is
        port(
            cin: in std_logic;
            a, b: in std_logic_vector(3 downto 0);
            s: out std_logic_vector(3 downto 0);
            cout: out std_logic
        );
    end component;

    signal c0, c1: std_logic;
begin
    bcd_adder_0: bcd_adder port map(
        cin => '0',
        a => a0,
        b => b0,
        s => s0,
        cout => c0 
    );

    bcd_adder_1: bcd_adder port map(
        cin => c0,
        a => a1,
        b => b1,
        s => s1,
        cout => c1
    );

    s2 <= "000" & c1;

end architecture bcd_adder_4d;
```]




= Códigos VHDL utilizados - Parte 2:
\
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

== binAdder
#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binAdder is
    generic(
		Nlength: integer := 7
		);
    port(
	 
	 in_1: in std_logic_vector(Nlength - 1 downto 0);
	 in_2: in std_logic_vector(Nlength - 1 downto 0);
	 out_1: out std_logic_vector(Nlength downto 0)
        
    );
end binAdder;

architecture v1 of binAdder is
 
   signal bin1, bin2: unsigned(Nlength downto 0);
	 signal out_bin: unsigned(Nlength downto 0);

begin

	  bin1 <= resize(unsigned(in_1),Nlength + 1); 
	  bin2 <= resize(unsigned(in_2),Nlength + 1);
	
  	out_bin <= bin1 + bin2;
  	out_1 <= std_logic_vector(out_bin);

end v1;
```]

== bcd2ssd:

#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd2ssd is
    port (
        bcd     : in std_logic_vector(3 downto 0);
        ssd_out : out std_logic_vector(6 downto 0);
        ac_ccn  : in std_logic
    );
end entity bcd2ssd;

architecture bcd2ssd_v1 of bcd2ssd is

    signal ssd : std_logic_vector(6 downto 0);
    signal bcd_int : integer range 0 to 9;

begin

    ssd_out <= ssd when ac_ccn = '1' else
        not ssd;
    bcd_int <= to_integer(unsigned(bcd));

    with bcd_int select ssd <=
        "0111111" when 0,
        "0000110" when 1,
        "1011011" when 2,
        "1001111" when 3,
        "1100110" when 4,
        "1101101" when 5,
        "1111101" when 6,
        "0000111" when 7,
        "1111111" when 8,
        "1101111" when 9,
        -- Character "E" when others: 
        "1111001" when others;

end architecture bcd2ssd_v1;
```]

== Project-1 (declaração de componentes):
\

#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity project1 is
port(
  clk   		 : in    std_logic;
  reset 		 : in    std_logic;

  input1     : in std_logic_vector(6 downto 0);
  input2     : in std_logic_vector(6 downto 0);
  
  ssd_unit    : out std_logic_vector(6 downto 0);
  ssd_decimal : out std_logic_vector(6 downto 0);
  ssd_centena : out std_logic_vector(6 downto 0)
);
end entity;

architecture ifsc of project1 is

  component div_clk is
    generic (
      div : natural := 50
    );
    port (
      clk_in  : in    std_logic;
      rst     : in    std_logic;
      clk_out : out   std_logic
    );  
  end component div_clk;
  
	component bin2bcd is
    port (
        A      : in  std_logic_vector (7 downto 0);
        sd, su, sc : out std_logic_vector (3 downto 0)
    );
	end component bin2bcd ;
  
  component bcd2ssd is 
    port (
      bcd     : in    std_logic_vector(3 downto 0);
      ssd_out : out   std_logic_vector(6 downto 0);
      ac_ccn  : in    std_logic
    );
  end component bcd2ssd;

  component binAdder is
    generic (
		Nlength : natural := 7
    );
    port(
	 in_1: in std_logic_vector(Nlength - 1 downto 0);
	 in_2: in std_logic_vector(Nlength - 1 downto 0);
	 out_1: out std_logic_vector(Nlength downto 0)   
    );
  end component binAdder;
  
	signal adder_out : std_logic_vector(7 downto 0); 
	signal bcd_out0, bcd_out1, bcd_out2 : std_logic_vector(3 downto 0);
	signal ac_ccn0, ac_ccn1, ac_ccn2 : std_logic;

begin
	 
 adder : component binAdder
	 generic map(
	 Nlength => 7
	 )
    port map (
      in_1  => input1,
      in_2  => input2,
      out_1     => adder_out
    );
	 
 bin2bcd_1 : component bin2bcd
    port map (
      A => adder_out,
		su => bcd_out0,
		sd => bcd_out1,
		sc => bcd_out2
    );
	 
  bcd2ssd_1 : component bcd2ssd
  port map (
    bcd     => bcd_out0,
    ssd_out => ssd_unit,
	 ac_ccn => ac_ccn0 
  );
  
  bcd2ssd_2 : component bcd2ssd
  port map (
    bcd     => bcd_out1,
    ssd_out => ssd_decimal,
	 ac_ccn => ac_ccn1 
  );

  bcd2ssd_3 : component bcd2ssd
  port map (
    bcd     => bcd_out2,
    ssd_out => ssd_centena,
	 ac_ccn => ac_ccn2 
  );


end architecture;
```]
