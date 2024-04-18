library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity bcd_adder is
port (
cin  : in  std_logic;
a, b : in  std_logic_vector(3 downto 0);
s    : out std_logic_vector(3 downto 0);
cout : out std_logic
);
end entity bcd_adder;

architecture bcd_adder_v1 of bcd_adder is

-- sum unsigned, sum ten less
signal s_uns, s_tl : unsigned(4 downto 0);
-- sum out
signal s_out : unsigned(3 downto 0);
-- carry in as std_logic_vector
signal cin_slv : std_logic_vector(4 downto 0);

begin

cin_slv(0)          <= cin;
cin_slv(4 downto 1) <= (others => '0');

s_uns <= resize(unsigned(a), 5) + resize(unsigned(b), 5) + resize(unsigned(cin_slv), 5);
s_tl  <= s_uns - 10;

cout <= '1' when s_uns > 9 else
        '0';
s_out <= s_tl(3 downto 0) when s_uns > 9 else
         s_uns(3 downto 0);

s <= std_logic_vector(s_out);

end architecture bcd_adder_v1;