library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA1 is
	generic ( 
	
		N : natural := 3
	);
	
	port
	(
		a	: in  std_logic_vector(N-1 downto 0);
		b	: in 	std_logic_vector(N-1 downto 0);
		cin	: in std_logic;
		opcode : std_logic_vector(3 downto 0);
		
		y_log	: buffer std_logic_vector(N-1 downto 0);
		y_arit	: buffer unsigned(N-1 downto 0);
		y	: out std_logic_vector(N-1 downto 0)
	);
end ULA1;


architecture IFSC_V1 of ULA1 is
	
	alias op3 IS opcode(3);
	alias op20 IS opcode(2 downto 0);
	
	signal a_uns, b_uns : unsigned(N-1 downto 0);

begin

	with op20 select
	y_log <= not a  	 when "000",
				not b 	 when "001",
				a and b   when "010",
				a or b    when "011",
				a nand b  when "100",
				a nor b   when "101",
				a xor b   when "110",
				a xnor b  when others;
				
a_uns <= unsigned(a);
b_uns <= unsigned(b);

	with op20 select
	y_arit <= a_uns  	 		 when "000",
				 b_uns 	 		 when "001",
				a_uns + 1   		 when "010",
				b_uns + 1  	    when "011",
				a_uns - 1  		 when "100",
				b_uns - 1   		 when "101",
				a_uns + b_uns   	    when "110",
				a_uns + b_uns when others; -- colocar cin
				
				
   y <= 
	y_log when op3 = '0' else std_logic_vector(y_arit);
				
end architecture;





