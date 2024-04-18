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