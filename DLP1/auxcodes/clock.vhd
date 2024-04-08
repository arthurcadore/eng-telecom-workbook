library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity clock is
  generic (
    mU: integer := 9;
    mD: integer := 5
  );
  port (
    clk   : in std_logic;
    reset : in std_logic;
    --enable: in std_logic;
    bcdU : out std_logic_vector(3 downto 0);
    bdcD : out std_Logic_vector(3 downto 0)
  );
end entity;

architecture version1 of clock is
begin
  process (clk, rst) is
    variable countU : integer range 0 to 10; 
    variable countD : integer range 0 to 10; 
    if rst = '1' then
      countD := 0;
      countU := 0;

    elsif rising_edge(clk) then
      if (countD = 2 and countU = 3) then
        countU := 0;
        countD := 0;
      elsif (countU = 9) then
        countU := 0;
        if (countD = 9) then
          countD := 0
        else
          countD := countD +1;
        end if;
      else
        countU := countU +1;
      end if; 
    end if;   
    
    bcdU <= std_logic_vector(to_unsigned(countU, 4));
    bcdD <= std_logic_vector(to_unsigned(countD, 4));

  begin
  end process;
end architecture;

