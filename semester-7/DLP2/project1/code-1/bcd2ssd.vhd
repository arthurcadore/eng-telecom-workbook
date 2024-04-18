library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd2ssd is
    port (
        bcd     : in std_logic_vector(3 downto 0);
        ssd_out : out std_logic_vector(6 downto 0);
        ac_ccn  : in std_logic
    );
end entity bcd2ssd;

architecture bcd2ssd_v1 of bcd2ssd is

    signal ssd : std_logic_vector(6 downto 0);
    signal bcd_int : integer range 0 to 9;

begin

    ssd_out <= ssd when ac_ccn = '1' else
        not ssd;
    bcd_int <= to_integer(unsigned(bcd));

    with bcd_int select ssd <=
        "0111111" when 0,
        "0000110" when 1,
        "1011011" when 2,
        "1001111" when 3,
        "1100110" when 4,
        "1101101" when 5,
        "1111101" when 6,
        "0000111" when 7,
        "1111111" when 8,
        "1101111" when 9,
        -- Character "E" when others: 
        "1111001" when others;

end architecture bcd2ssd_v1;	