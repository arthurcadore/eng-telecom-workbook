library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity bcd_counter is
    generic (
        max_decimal : integer := 2;
        max_unit    : integer := 3;
        n           : integer := 9
    );
    port (
        clk         : in std_logic;
        rst         : in std_logic;
        bcd_unit    : out std_logic_vector(3 downto 0);
        bcd_decimal : out std_logic_vector(3 downto 0);
        clk_out     : out std_logic
    );
end entity bcd_counter;

architecture bcd_counter_v1 of bcd_counter is

begin

    bcd_counter_v1_prc : process (clk, rst) is

        variable count_unit, count_decimal : integer range 0 to 9;

    begin

        if (rst = '1') then
            count_unit := 0;
            count_decimal := 0;
            clk_out <= '1';
        elsif rising_edge(clk) then
            clk_out <= '0';

            if (count_unit = max_unit and count_decimal = max_decimal) then
                count_decimal := 0;
                count_unit := 0;
                clk_out <= '1';
            elsif (count_unit = n) then
                count_unit := 0;
                if (count_decimal = max_decimal) then
                    count_decimal := 0;
                else
                    count_decimal := count_decimal + 1;
                end if;
            else
                count_unit := count_unit + 1;
            end if;
        end if;

        bcd_unit <= std_logic_vector(to_unsigned(count_unit, 4));
        bcd_decimal <= std_logic_vector(to_unsigned(count_decimal, 4));

    end process bcd_counter_v1_prc;

end architecture bcd_counter_v1;
