-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;
-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

entity detecta_vagas is
	port
	(
		-- Input ports
		x	: in  bit_vector(8 DOWNTO 0);
		y: out bit
	);
end entity;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture ifsc_arthur of detecta_vagas is

begin

	y <= not(x(0) and x(1) and x(2) and x(3) and x(4) and x(5) and x(6) and x(7) and x(8));

end architecture;
