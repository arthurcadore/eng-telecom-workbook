library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity contador_dir_0m is
  generic (
    n   : natural := 7;
    max : natural := 6
  );
  port (
    clk       : in    std_logic;
    rst       : in    std_logic;
    dir       : in    std_logic;
    fim_count : out   std_logic;
    out_count : out   std_logic_vector(n - 1 downto 0)
  );
end entity contador_dir_0m;

architecture ifsc_v2 of contador_dir_0m is

  signal val_fim, val_inicio : integer range 0 to max;
  signal val_soma            : integer range -1 to 1;

begin

  val_fim    <= max when dir = '0' else
                0;
  val_inicio <= 0 when dir = '1' else
                max;
  val_soma   <= 1 when dir = '0' else
                - 1;

  prc : process (clk, rst) is

    variable count : integer range 0 to max;

  begin

    if (rst = '1') then
      count := val_inicio;
    elsif rising_edge(clk) then
      if (count = val_fim) then
        count := val_inicio;
      else
        count := count + val_soma;
      end if;
    end if;

    out_count <= std_logic_vector(to_unsigned(count, n));

  end process prc;

end architecture ifsc_v2;

configuration cfg_contador_inc_0M of contador_inc_0M is
  for ifsc_v2 end for;
  end configuration;
