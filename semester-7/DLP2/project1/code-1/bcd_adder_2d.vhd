library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity bcd_adder_2d is
    port (
        b0, b1           : in  std_logic_vector(3 downto 0);
        a0, a1           : in  std_logic_vector(3 downto 0);
        s0, s1, s2       : out std_logic_vector(3 downto 0);
        ac_ccn           : in  std_logic;
        ssd0, ssd1, ssd2 : out std_logic_vector(6 downto 0)
    );
end entity;

architecture bcd_adder_2d of bcd_adder_2d is
    component bcd_adder is
        port (
            cin  : in  std_logic;
            a, b : in  std_logic_vector(3 downto 0);
            s    : out std_logic_vector(3 downto 0);
            cout : out std_logic
        );
    end component;

    component bcd2ssd is
        port (
            bcd     : in  std_logic_vector(3 downto 0);
            ssd_out : out std_logic_vector(6 downto 0);
            ac_ccn  : in  std_logic
        );
    end component;

    signal c0, c1           : std_logic;
    signal bcd0, bcd1, bcd2 : std_logic_vector(3 downto 0);
begin
    bcd_adder_0 : bcd_adder port map(
        cin  => '0',
        a    => a0,
        b    => b0,
        s    => bcd0,
        cout => c0
    );

    bcd_adder_1 : bcd_adder port map(
        cin  => c0,
        a    => a1,
        b    => b1,
        s    => bcd1,
        cout => c1
    );

    bcd2 <= "000" & c1;

    bcd2ssd_0 : bcd2ssd port map(
        bcd     => bcd0,
        ssd_out => ssd0,
        ac_ccn  => ac_ccn
    );

    bcd2ssd_1 : bcd2ssd port map(
        bcd     => bcd1,
        ssd_out => ssd1,
        ac_ccn  => ac_ccn
    );

    bcd2ssd_2 : bcd2ssd port map(
        bcd     => bcd2,
        ssd_out => ssd2,
        ac_ccn  => ac_ccn
    );

    s0 <= bcd0;
    s1 <= bcd1;
    s2 <= bcd2;
end architecture;