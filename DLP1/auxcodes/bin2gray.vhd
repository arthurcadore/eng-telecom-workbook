library ieee;
use ieee.std_logic_1164.all;

entity bin2gray is
	generic (
	    N : natural := 4 
	);
	port
	(
		g  : out std_logic_vector(N-1 downto 0);
		b  : in std_logic_vector(N-1 downto 0)
	);
end entity;

architecture ifsc_v1 of bin2gray is
begin

	g(N-1) <= b(N-1);
	
	label1: 
	for h in (N - 2) downto 0 generate
		g(h) <= b(h) xor b(h+1);
		
	end generate;
end architecture;
