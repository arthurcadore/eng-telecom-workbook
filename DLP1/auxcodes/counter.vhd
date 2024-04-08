library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   

entity counter is
  generic (WIDTH : in natural := 4);
  port (
	 CLK50MHz : in std_logic;
    RST   : in std_logic;
    CLK   : in std_logic;
    LOAD  : in std_logic;
    DATA  : in std_logic_vector(WIDTH-1 downto 0);
    R0	  : out std_logic;
    Q     : out std_logic_vector(WIDTH-1 downto 0));
end entity;

architecture ifsc_v1 of counter is
	signal Q_aux : std_logic_vector(WIDTH-1 downto 0);
	signal CLK_db:	std_logic := '0';
begin
  process(RST,CLK) is
  begin
    if RST = '1' then
      Q_aux <= (others => '0');
    elsif rising_edge(CLK) then
      if LOAD= '1' then
        Q_aux <= DATA;
      else
        Q_aux <= std_logic_vector(unsigned(Q_aux) + 1);
      end if;
    end if;
  end process;
  -- Adaptacao feita devido a matriz de leds acender com ZERO
  Q <= not Q_aux;
  -- Para acender um led eh necessario colocar ZERO na linha correspondente da matriz.
  R0 <= '0';
  
  -- debouncer de 10ms
	process (CLK50MHz, CLK, RST, CLK_db) is
		constant max_cnt: natural := 500000; -- 500000 10ms para clk 20ns
		variable cnt_db : integer range 0 to max_cnt-1;
	begin
			if (RST = '1') then
				cnt_db := 0;
				CLK_db <= '0';
			elsif ((CLK = '0') and (CLK_db = '0')) or 
			      ((CLK = '1') and (CLK_db = '1')) then
				cnt_db := 0;
			elsif (rising_edge(CLK50MHz)) then
				if (cnt_db = max_cnt - 1) then
					CLK_db <= not CLK_db;
				else
					cnt_db := cnt_db + 1;
				end if;
			end if;
 	end process;
end architecture;