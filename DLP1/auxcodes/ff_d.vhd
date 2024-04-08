library ieee;
use ieee.std_logic_1164.all;

entity FF_D is 
	
	port(
	
	clock, reset, enable, preset, reset_sinc, d : in std_logic;
	q : out std_logic
		 
		 );
end entity;

architecture v_reset_subida of FF_D is 
begin 

--Flip Flop tipo D com reset assincrono, sensivel a borda de subida.
process (clock,reset)
begin
   if (reset = '1') then
      q <= '0';
-- elsif (clock'event and clock = '1') then or
   elsif (rising_edge(clock)) then
      q <= d;
   end if;
end process;
end architecture;

architecture v_enable_reset_subida of FF_D is 
begin 
--Flip Flop tipo D com preset assincrono e sinal de enable, sensivel a borda de descida.
process (clock, preset)
begin
   if (preset = '1') then
      q <= '1';
   elsif (falling_edge(clock)) then
      if (enable = '1') then
         q <= d;
      end if;
   end if;
end process;
end architecture;

architecture v_reset_assinc_sinc_subida of FF_D is 
begin 
--Flip Flop tipo D com preset assincrono e sinal de enable, sensivel a borda de descida.
process (clock, preset)
begin
   if (preset = '1') then
      q <= '0';
   elsif (falling_edge(clock)) then
		if (reset_sinc = '1') then
			q <= '0';
	   else 
			q <= d;
      end if;
   end if;
end process;
end architecture;


configuration cfg_FF_D of FF_D is 
  -- for v_reset_subida end for
	-- for v_enable_reset_subida end for;
	for v_reset_assinc&sinc_subida end for;
end configuration; 
