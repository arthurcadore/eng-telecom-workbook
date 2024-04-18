library ieee;
use ieee.std_logic_1164.all;

entity gray2bin is
	generic (
	    N : natural := 4 
	);
	port
	(
		gout : buffer std_logic_vector(N-1 downto 0)
		gin : in std_logic_vector(N-1 downto 0)
	);
end entity;

architecture ifsc_v1 of gray2bin is
signal somain : unsigned(N-1 downto 0);
signal somaout : unsigned(N-1 downto 0);
begin

	somain(N-1) <= gin(N-1);
	
	label1: 
	for h in (N - 2) downto 0 generate
		somain(h) <= gin(h) xor somain(h+1);
		
	end generate;
	
	somaout = somain + 1;
	
begin

	gout(N-1) <= somaout(N-1);
	
	label1: 
	for h in (N - 2) downto 0 generate
		gout(h) <= somaout(h) xor somaout(h+1);
		
	end generate;
end architecture;

