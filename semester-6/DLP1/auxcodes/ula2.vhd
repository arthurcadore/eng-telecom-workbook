library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ULA2 is
	generic ( 
	
		N : natural := 3
	);
	
	port
	(
		a	: in  std_logic_vector(N-1 downto 0);
		b	: in 	std_logic_vector(N-1 downto 0);
		cin	: in std_logic;
		opcode : std_logic_vector(3 downto 0);
	
		y	: out std_logic_vector(N-1 downto 0)
	);
end ULA2;


architecture IFSC_V1 of ULA2 is
	
	alias op3 IS opcode(3);
	alias op20 IS opcode(2 downto 0);
	
	signal a_uns, b_uns : unsigned(N-1 downto 0);
	signal y_log : std_logic_vector(N-1 downto 0);
	signal y_arit : unsigned(N-1 downto 0);
	
	function "+" (a: unsigned; b : std_Logic) return unsigned is
		begin
			
			if( b = '1') then return a + 1; 
			 
			else 
				return a;
			end if;
		end "+";

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
				a_uns + b_uns + cin when others; -- colocar cin
				
				
   y <= 
	y_log when op3 = '0' else std_logic_vector(y_arit);
	

				
end architecture;





