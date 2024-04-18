library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity contador_modulo_n is
	-- criando um define: 
	generic(
		N : integer := 3
	);
	port (
		-- definindo as portas de entrada e sa
		clock, reset : in std_logic; 
		contagem_out : out std_Logic_vector(N-1 downto 0)
	);
end entity;

architecture ifsc_v1 of contador_modulo_n is
begin
	process (clock, reset)
	-- declarando variavel para fazer a soma dos valores inteiros. 
	variable contagem_int : integer range 0 to (2**N - 1);
	begin
		if (reset = '1') then
			contagem_int := 0;
		elsif (rising_edge(clock)) then
			if (contagem_int = 5) then
				contagem_int :=0;
			else
				contagem_int := (contagem_int + 1); 
		    end if;
		end if;
		-- convertendo para unsigned e em seguida para std_logic_vector
		contagem_out <= std_logic_vector(to_unsigned(contagem_int, N));
	end process;
end architecture;
