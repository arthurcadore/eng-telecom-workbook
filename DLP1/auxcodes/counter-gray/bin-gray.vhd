library ieee;
  use ieee.std_logic_1164.all;

entity bin2gray is
  generic (
    n : natural := 10
  );
  port (
    g : out   std_logic_vector(n - 1 downto 0);
    b : in    std_logic_vector(n - 1 downto 0)
  );
end entity bin2gray;

architecture ifsc_v1 of bin2gray is

begin

  g(n - 1) <= b(n - 1);

  gen1 : for i in n - 2 downto 0 generate
    g(i) <= b(i) xor b(i + 1);
  end generate gen1;

end architecture ifsc_v1;