library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity div_clk is
    generic (
        div : natural := 50000000
    );
    port (
        clk_in  : in std_logic;
        rst     : in std_logic;
        clk_out : out std_logic
    );
end entity div_clk;

architecture div_clk_v1 of div_clk is

begin

    l1 : process (clk_in, rst) is

        variable count : integer range 0 to div - 1;

    begin

        if (rst = '1') then
            count := 0;
            clk_out <= '1';
        elsif rising_edge(clk_in) then
            if (count = div - 1) then
                count := 0;
                clk_out <= '1';
            else
                count := count + 1;
                clk_out <= '0';
            end if;
        end if;

    end process l1;

end architecture div_clk_v1;
