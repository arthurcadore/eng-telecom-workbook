library ieee;
use ieee.std_Logic_1164.all;

entity genericCounter is
  generic(
    N : natural := 3
    MAX : natural := 6
  );
  port (
    clk   : in std_logic;
    rst   : in std_logic;
    fim_cnt : out std_logic;
    out_cnt : out std_logic_vector(N - 1 downto 0);
  );
end entity;

architecture version1 of genericCounter is
begin

  process (clk, rst) is
    variable count : integer range 0 to MAX;
  begin
    if (rst = '1') then
      count := 0;
    elsif rising_edge(clk) then
      count := count + 1; 
    end if 
    out_cnt <= std_logic_vector(to_unsigned(count, N));

  end process;
end architecture;

architecture version2 of genericCounter is
  begin
  
    process (clk, rst) is
      variable count : integer range 0 to MAX;r
    begin
      if (rst = '1') then
         fim_ctn <= '0'; 
      elsif rising_edge(clk) then
        if count = MAX then 
          fim_cnt <= '1';
        else 
          count := count + 1; 
        end if;
      end if;
      out_cnt <= std_logic_vector(to_unsigned(count, N));
  
    end process;
  end architecture;


configuration counterConfiguration of genericCounter is
  for version1 end for;
  for version2 end for;
end configuration <configuration_identifier>;