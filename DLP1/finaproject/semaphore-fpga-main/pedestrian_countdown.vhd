library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pedestrian_countdown is
    port (
        clk                 : in std_logic;
        reset               : in std_logic;
        ac_ccn              : in std_logic;
        ssd_seconds_unit    : out std_logic_vector(6 downto 0);
        ssd_seconds_decimal : out std_logic_vector(6 downto 0)
    );
end entity;

architecture pedestrian_countdown_v1 of pedestrian_countdown is

    component div_clk is
        generic (
            div : natural := 50
        );
        port (
            clk_in  : in std_logic;
            rst     : in std_logic;
            clk_out : out std_logic
        );
    end component div_clk;

    component bcd_counter is
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
    end component bcd_counter;

    component bcd2ssd is
        port (
            bin     : in std_logic_vector(3 downto 0);
            ssd_out : out std_logic_vector(6 downto 0);
            ac_ccn  : in std_logic
        );
    end component bcd2ssd;

    signal clk_seconds : std_logic;
    signal countdown_end : std_logic;

    signal bcd_unit_seconds : std_logic_vector(3 downto 0);
    signal bcd_decimal_seconds : std_logic_vector(3 downto 0);
begin
    div_clk_1 : div_clk
    generic map(
        div => 50000000
    )
    port map(
        clk_in  => clk,
        clk_out => clk_seconds,
        rst     => reset
    );

    bcd_counter_seconds : bcd_counter
    generic map(
        max_decimal => 5,
        max_unit    => 9,
        n           => 9
    )
    port map(
        clk         => clk_seconds,
        rst         => reset,
        bcd_unit    => bcd_unit_seconds,
        bcd_decimal => bcd_decimal_seconds,
        clk_out     => countdown_end
    );

    bcd2ssd_seconds_unit : bcd2ssd
    port map(
        bin     => bcd_unit_seconds,
        ssd_out => ssd_seconds_unit,
        ac_ccn  => ac_ccn
    );

    bcd2ssd_seconds_decimal : bcd2ssd
    port map(
        bin     => bcd_decimal_seconds,
        ssd_out => ssd_seconds_decimal,
        ac_ccn  => ac_ccn
    );

end architecture pedestrian_countdown_v1;
