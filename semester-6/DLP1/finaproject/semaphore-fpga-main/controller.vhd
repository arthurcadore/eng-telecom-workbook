library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity controller is
    generic (
        time_green            : integer := 5;
        time_yellow           : integer := 5;
        time_pedestrian       : integer := 99;
        time_pedestrian_green : integer := 33;
        blink_period          : integer := 1
    );

    port (
        clk    : in std_logic;
        reset  : in std_logic;
        enable : in std_logic;
        ac_ccn : in std_logic;

        light_detector      : in std_logic;
        pedestrian_button_1 : in std_logic;
        pedestrian_button_2 : in std_logic;
        pedestrian_button_3 : in std_logic;
        pedestrian_button_4 : in std_logic;

        g_semaphore_a : out std_logic;
        y_semaphore_a : out std_logic;
        r_semaphore_a : out std_logic;

        g_semaphore_b : out std_logic;
        y_semaphore_b : out std_logic;
        r_semaphore_b : out std_logic;

        g_pedestrian          : out std_logic;
        r_pedestrian          : out std_logic;
        light_pedestrian      : out std_logic;
        sound_pedestrian      : out std_logic;
        button_led_pedestrian : out std_logic;
        ssd_seconds_unit      : out std_logic_vector(6 downto 0);
        ssd_seconds_decimal   : out std_logic_vector(6 downto 0)
    );
end entity;

architecture controller_v1 of controller is

    component ff is
        port (
            clk : in std_logic;
            rst : in std_logic;
            q   : out std_logic;

            pedestrian_button_1 : in std_logic;
            pedestrian_button_2 : in std_logic;
            pedestrian_button_3 : in std_logic;
            pedestrian_button_4 : in std_logic
        );
    end component;

    component fsm is
        generic (
            time_green            : integer := 5;
            time_yellow           : integer := 5;
            time_pedestrian       : integer := 99;
            time_pedestrian_green : integer := 33;
            blink_period          : integer := 1
        );

        port (
            clk    : in std_logic;
            reset  : in std_logic;
            enable : in std_logic;

            light_detector : in std_logic;
            button_pressed : in std_logic;

            button_clear      : out std_logic;
            output_pedestrian : out std_logic;

            g_semaphore_a : out std_logic;
            y_semaphore_a : out std_logic;
            r_semaphore_a : out std_logic;

            g_semaphore_b : out std_logic;
            y_semaphore_b : out std_logic;
            r_semaphore_b : out std_logic;

            g_pedestrian          : out std_logic;
            r_pedestrian          : out std_logic;
            light_pedestrian      : out std_logic;
            sound_pedestrian      : out std_logic;
            button_led_pedestrian : out std_logic
        );
    end component;

    component pedestrian_countdown is
        port (
            clk                 : in std_logic;
            reset               : in std_logic;
            ac_ccn              : in std_logic;
            ssd_seconds_unit    : out std_logic_vector(6 downto 0);
            ssd_seconds_decimal : out std_logic_vector(6 downto 0)
        );
    end component;

    signal button_pressed : std_logic;
    signal button_clear : std_logic;
    signal output_count : std_logic;
begin

    ff_1 : ff
    port map(
        clk                 => clk,
        rst                 => button_clear,
        q                   => button_pressed,
        pedestrian_button_1 => pedestrian_button_1,
        pedestrian_button_2 => pedestrian_button_2,
        pedestrian_button_3 => pedestrian_button_3,
        pedestrian_button_4 => pedestrian_button_4
    );

    fsm_1 : fsm
    generic map(
        time_green            => time_green,
        time_yellow           => time_yellow,
        time_pedestrian       => time_pedestrian,
        time_pedestrian_green => time_pedestrian_green,
        blink_period          => blink_period
    )
    port map(
        clk            => clk,
        reset          => reset,
        enable         => enable,
        light_detector => light_detector,
        button_pressed => button_pressed,

        button_clear      => button_clear,
        output_pedestrian => output_count,

        g_semaphore_a => g_semaphore_a,
        y_semaphore_a => y_semaphore_a,
        r_semaphore_a => r_semaphore_a,

        g_semaphore_b => g_semaphore_b,
        y_semaphore_b => y_semaphore_b,
        r_semaphore_b => r_semaphore_b,

        g_pedestrian          => g_pedestrian,
        r_pedestrian          => r_pedestrian,
        light_pedestrian      => light_pedestrian,
        sound_pedestrian      => sound_pedestrian,
        button_led_pedestrian => button_led_pedestrian
    );

    pedestrian_countdown_1 : pedestrian_countdown
    port map(
        clk                 => clk,
        reset               => output_count,
        ac_ccn              => ac_ccn,
        ssd_seconds_unit    => ssd_seconds_unit,
        ssd_seconds_decimal => ssd_seconds_decimal
    );

end architecture;
