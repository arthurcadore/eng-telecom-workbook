library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity gray_add_1 is
  generic (
    n : natural := 4
  );
  port (
    g_in  : in    std_logic_vector(n - 1 downto 0);
    g_out : out   std_logic_vector(n - 1 downto 0)
  );
end entity gray_add_1;

architecture ifsc_v1 of gray_add_1 is

  signal bin_in  : unsigned(n - 1 downto 0);
  signal bin_out : unsigned(n - 1 downto 0);

begin

  bin_in(n - 1) <= g_in(n - 1);

  gen1 : for i in n - 2 downto 0 generate
    bin_in(i) <= g_in(i) xor bin_in(i + 1);
  end generate gen1;

  bin_out <= bin_in + 1;

  g_out(n - 1) <= bin_out(n - 1);

  gen2 : for i in n - 2 downto 0 generate
    g_out(i) <= bin_out(i) xor bin_out(i + 1);
  end generate gen2;

end architecture ifsc_v1;
