library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity conta_vagas is
	generic
	( N: natural  :=	3);
	port
	(
		-- Input ports
		x	: in  std_logic_vector(N-1 downto 0);

		-- Output ports
		y	: out integer range 0 to N
	);
end;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture ifsc_arthur of conta_vagas is
begin
	
	with x select
	y <= 3 when "000",
				2 when "001",
				2 when "010",
				1 when "011",
				2 when "100",
				1 when "101",
				1 when "110",
				0 when others; --111
				
end architecture;
