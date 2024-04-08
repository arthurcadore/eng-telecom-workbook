library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
	generic (
	    N : natural := 4 
	);
	port
	(
		b  : buffer std_logic_vector(N-1 downto 0);
		g  : in std_logic_vector(N-1 downto 0)
	);
end entity;

architecture ifsc_v1 of gray2bin is
begin

	b(N-1) <= g(N-1);
	
	label1: 
	for h in (N - 2) downto 0 generate
		b(h) <= g(h) xor b(h+1);
		
	end generate;
end architecture;
