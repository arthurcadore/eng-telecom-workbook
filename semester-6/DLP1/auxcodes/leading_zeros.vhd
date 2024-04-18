-- Author: Arthur Cadore M. Barcella
-- Telecom Eng. Student

-- Import library and package list. 
library ieee;
use ieee.std_logic_1164.all;

entity leading_zeros is
  generic (
    -- Defines a natural number for code scalability
    N: natural := 8
  );
  port (
    -- Defines a input vector bit vector (std logic vector) to analyze .   
    data   : in std_logic_vector(0 to N-1);

    -- The output port it's an integer with the value counted. 
    zeros : out integer range 0 to N
  );
end entity;

architecture rtl of leading_zeros is
begin
  process (data)
    variable count : integer range 0 to N;
  begin
      count := 0
      for i in data'range loop
        case data(i) is
          when '0' => count := count + 1;
 --         when others => exit;
        end case;
      end loop;
        
      zeros <= count;
  end process;
end architecture;
