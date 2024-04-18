library ieee;
use ieee.std_logic_1164.all;

entity ff is
    port (
        clk : in std_logic;
        rst : in std_logic;
        q   : out std_logic;

        pedestrian_button_1 : in std_logic;
        pedestrian_button_2 : in std_logic;
        pedestrian_button_3 : in std_logic;
        pedestrian_button_4 : in std_logic
    );
end entity ff;

architecture rtl of ff is
begin
    process (clk, rst)
    begin
        if rst = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            if pedestrian_button_1 = '1' or pedestrian_button_2 = '1' or pedestrian_button_3 = '1' or pedestrian_button_4 = '1' then
                q <= '1';
            end if;
        end if;
    end process;
end architecture rtl;
