library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity firstHomework is
  generic (
    n   : natural := 15;
    B   : unsigned := 0000000000000001;
    C   : unsigned := 0000000010000000;
    D   : unsigned := 1000000000000000;
    E   : unsigned := 1010101010101010;
  );

  port (
    a         : in    std_logic_vector(n downto 0);
    b         : in    std_logic_vector(n downto 0);
    r         : out   std_logic_vector(n downto 0)
  );
  
end entity firstHomework;

architecture v1 of firstHomework is

  signal a_uns      : unsigned range n to 0;
  signal b_uns      : unsigned range n to 0;

begin

  a_uns <= to_unsigned(a)
  b_uns <= to_unsigned(b)
  
  r <= a_uns + B

end architecture v1;
