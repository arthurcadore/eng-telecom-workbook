library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_adder is
    generic (
        n_length : integer := 7
    );
    port (

        in_1  : in  std_logic_vector(n_length - 1 downto 0);
        in_2  : in  std_logic_vector(n_length - 1 downto 0);
        out_1 : out std_logic_vector(n_length downto 0)
    );
end bin_adder;

architecture behaviour of bin_adder is

    signal bin1, bin2 : unsigned(n_length downto 0);
    signal out_bin    : unsigned(n_length downto 0);

begin

    bin1 <= resize(unsigned(in_1), n_length + 1);
    bin2 <= resize(unsigned(in_2), n_length + 1);

    out_bin <= bin1 + bin2;
    out_1   <= std_logic_vector(out_bin);

end behaviour;