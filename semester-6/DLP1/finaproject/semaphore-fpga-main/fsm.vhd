library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity fsm is
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
        clk_pedestrian    : out std_logic;
        output_pedestrian : out std_logic;

        g_semaphore_a : out std_logic;
        y_semaphore_a : out std_logic;
        r_semaphore_a : out std_logic;

        g_semaphore_b         : out std_logic;
        y_semaphore_b         : out std_logic;
        r_semaphore_b         : out std_logic;
        g_pedestrian          : out std_logic;
        r_pedestrian          : out std_logic;
        light_pedestrian      : out std_logic;
        sound_pedestrian      : out std_logic;
        button_led_pedestrian : out std_logic
    );
end entity;

architecture fsm_v1 of fsm is
    type state is (Y_BLINKING, G_A, Y_A, G_B, Y_B, G_PED, G_BLINKING_PED, R_BLINKING_PED);
    signal current_state, next_state : state;

    signal timeout : integer range 0 to time_pedestrian;
begin

    sequential : process (clk, reset)
        variable count : integer := 0;
    begin
        if reset = '1' then
            current_state <= Y_BLINKING;
        elsif rising_edge(clk) then
            count := count + 1;

            if count >= timeout then
                current_state <= next_state;
            end if;
        end if;
    end process sequential;
    combinational : process (current_state, enable, light_detector, clk)
    begin
        -- Default values
        g_semaphore_a <= '0';
        y_semaphore_a <= '0';
        r_semaphore_a <= '1';

        g_semaphore_b <= '0';
        y_semaphore_b <= '0';
        r_semaphore_b <= '1';

        g_pedestrian <= '0';
        r_pedestrian <= '0';
        light_pedestrian <= '0';
        sound_pedestrian <= '0';
        button_led_pedestrian <= '1';
        output_pedestrian <= '1';

        -- State machine
        next_state <= current_state;

        case current_state is

                -- in blinking state the yellow light need to turn on and off every second 
                -- (by blink_period) if the enable is off, when the enable is on the state machine need to go to the next state 
            when Y_BLINKING =>
                if enable = '0' then
                    y_semaphore_a <= '1';
                    y_semaphore_b <= '1';
                    timeout <= blink_period;
                    next_state <= Y_BLINKING;
                else
                    next_state <= G_A;
                end if;

            when G_A =>

                g_semaphore_a <= '1';

                timeout <= time_green;
                next_state <= Y_A;

            when Y_A =>

                y_semaphore_a <= '1';

                timeout <= time_yellow;
                next_state <= G_B;

            when G_B =>

                g_semaphore_b <= '1';

                timeout <= time_green;
                next_state <= Y_B;

                -- in this state, if the pedestrian button is pressed, the next state is G_PED, if not, the next state is G_A
            when Y_B =>

                y_semaphore_b <= '1';

                if button_pressed = '1' then
                    next_state <= G_PED;
                    button_clear <= '1';
                else
                    next_state <= G_A;
                end if;

                -- if the light detector is on, enable the light pedestrian and the sound pedestrian. If it not, only enable the sound pedestrian   
            when G_PED =>

                g_pedestrian <= '1';

                if light_detector = '1' then
                    light_pedestrian <= '1';
                end if;

                sound_pedestrian <= '1';

                -- disable the led pedestrian button. 
                button_led_pedestrian <= '0';
                output_pedestrian <= '0';

                timeout <= time_pedestrian_green;
                next_state <= G_BLINKING_PED;
                -- G_BLINKGIN_PED the state wait for the time_pedestriang_green and then go to R_BLINKING_PED[
                -- the state blinks by blink_period.
            when G_BLINKING_PED =>

                g_pedestrian <= '1';
                sound_pedestrian <= '1';
                button_led_pedestrian <= '0';
                output_pedestrian <= '0';

                if light_detector = '1' then
                    light_pedestrian <= '1';
                end if;

                timeout <= blink_period;
                next_state <= R_BLINKING_PED;

            when R_BLINKING_PED =>

                r_pedestrian <= '1';
                sound_pedestrian <= '1';
                button_led_pedestrian <= '0';
                output_pedestrian <= '0';

                if light_detector = '1' then
                    light_pedestrian <= '1';
                end if;

                timeout <= blink_period;
                next_state <= G_A;

            when others =>
                next_state <= Y_BLINKING;

        end case;

    end process combinational;

end architecture;
