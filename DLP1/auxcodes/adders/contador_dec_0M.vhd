library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity contador_dec_0m is
  generic (
    n   : natural := 7;
    max : natural := 6
  );
  port (
    clk       : in    std_logic;
    rst       : in    std_logic;
    fim_count : out   std_logic;
    out_count : out   std_logic_vector(n - 1 downto 0)
  );
end entity contador_dec_0m;

architecture ifsc_v1 of contador_dec_0m is begin

  l_count : process (clk, rst) is

    variable count : integer range 0 to max;

  begin

    if (rst = '1') then
      count := max;
    elsif rising_edge(clk) then
      count := count - 1;
    end if;

    out_count <= std_logic_vector(to_unsigned(count, n));

  end process l_count;

end architecture ifsc_v1;

architecture ifsc_v2 of contador_dec_0m is begin

  l_count : process (clk, rst) is

    variable count : integer range 0 to max;

  begin

    if (rst = '1') then
      count := max;
    elsif rising_edge(clk) then
      if (count = 0) then
        count := max;
      else
        count := count - 1;
      end if;
    end if;

    out_count <= std_logic_vector(to_unsigned(count, n));

  end process l_count;

end architecture ifsc_v2;

architecture ifsc_v3 of contador_dec_0m is begin

  l_count : process (clk, rst) is

    variable count : integer range 0 to max;

  begin

    if (rst = '1') then
      count     := max;
      fim_count <= '0';
    elsif rising_edge(clk) then
      if (count = 0) then
        fim_count <= '1';
      else
        count := count - 1;
      end if;
    end if;

    out_count <= std_logic_vector(to_unsigned(count, n));

  end process l_count;

end architecture ifsc_v3;

configuration cfg_contador_dec_0M of contador_dec_0M is
-- for ifsc_v1 end for;
-- for ifsc_v2 end for;
  for ifsc_v3 end for;
  end configuration;
