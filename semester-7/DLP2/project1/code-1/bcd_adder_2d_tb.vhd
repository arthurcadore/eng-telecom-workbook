library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity bcd_adder_2d_tb is
end;

architecture bench of bcd_adder_2d_tb is

    component bcd_adder_2d is
        port (
            b0, b1           : in  std_logic_vector(3 downto 0);
            a0, a1           : in  std_logic_vector(3 downto 0);
            s0, s1, s2       : out std_logic_vector(3 downto 0);
            ac_ccn           : in  std_logic;
            ssd0, ssd1, ssd2 : out std_logic_vector(6 downto 0)
        );
    end component;

    signal b0, b1           : std_logic_vector(3 downto 0);
    signal a0, a1           : std_logic_vector(3 downto 0);
    signal s0, s1, s2       : std_logic_vector(3 downto 0);
    signal ac_ccn           : std_logic;
    signal ssd0, ssd1, ssd2 : std_logic_vector(6 downto 0);

begin

    uut : bcd_adder_2d port map(
        b0     => b0,
        b1     => b1,
        a0     => a0,
        a1     => a1,
        s0     => s0,
        s1     => s1,
        s2     => s2,
        ac_ccn => ac_ccn,
        ssd0   => ssd0,
        ssd1   => ssd1,
        ssd2   => ssd2
    );

    ac_ccn <= '0';

    stimulus : process
    begin
        -- 00 + 00 = 000
        a1 <= "0000";
        a0 <= "0000";
        b1 <= "0000";
        b0 <= "0000";
        wait for 10 ns;
        assert (s2 = "0000" and s1 = "0000" and s0 = "0000") report "Test failed: 00 + 00 = 000" severity error;

        -- 00 + 01 = 001
        a1 <= "0000";
        a0 <= "0000";
        b1 <= "0000";
        b0 <= "0001";
        wait for 10 ns;
        assert (s2 = "0000" and s1 = "0000" and s0 = "0001") report "Test failed: 00 + 01 = 001" severity error;

        -- 00 + 99 = 099
        a1 <= "0000";
        a0 <= "0000";
        b1 <= "1001";
        b0 <= "1001";
        wait for 10 ns;
        assert (s2 = "0001" and s1 = "1001" and s0 = "1001") report "Test failed: 00 + 99 = 099" severity error;

        -- 99 + 00 = 099
        a1 <= "1001";
        a0 <= "1001";
        b1 <= "0000";
        b0 <= "0000";
        wait for 10 ns;
        assert (s2 = "0001" and s1 = "1001" and s0 = "1001") report "Test failed: 99 + 00 = 099" severity error;

        -- 99 + 01 = 100
        a1 <= "1001";
        a0 <= "1001";
        b1 <= "0000";
        b0 <= "0001";
        wait for 10 ns;
        assert (s2 = "0001" and s1 = "0000" and s0 = "0001") report "Test failed: 99 + 01 = 100" severity error;

        -- 99 + 99 = 198
        a1 <= "1001";
        a0 <= "1001";
        b1 <= "1001";
        b0 <= "1001";
        wait for 10 ns;
        assert (s2 = "0001" and s1 = "1001" and s0 = "1000") report "Test failed: 99 + 99 = 198" severity error;

        wait;
    end process;

end;