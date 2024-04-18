-- finite state machine in VHDL
library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        clk : in std_logic;
        rst : in std_logic;
        inputs : in std_logic_vector(3 downto 0);
        ouputs : out std_logic_vector(3 downto 0)
    );
end entity fsm;

architecture ifscv1 of fsm is
    type state_type is (state0, state1, state2);
    signal present_state : state_type;
    signal next_state : state_type;
begin
  -- sequencial logic of the FSM
  process (clk, rst) 
  begin
    if rst = '1' then
      present_state <= state0;
    elsif rising_edge(clk) then
      present_state <= next_state;
    end if;
  end process;

  -- combinational logic of the FSM
  -- state0 -> state1
  -- state1 -> state2
  -- state2 -> state0
  -- state1 -> state0
  process (present_state, inputs)
  begin
    case present_state is
      when state0 =>
        if inputs = "0001" then
          next_state <= state1;
        else
          next_state <= state0;
        end if;
      when state1 =>
        if inputs = "0010" then
          next_state <= state2;
        elsif inputs = "0001" then
          next_state <= state0;
        else
          next_state <= state1;
        end if;
      when state2 =>
        if inputs = "0001" then
          next_state <= state0;
        else
          next_state <= state2;
        end if;
      when others =>
        next_state <= state0;
    end case;
  end process;

-- Output logic section: 
process (clk, rst)
begin
  if rst = '1' then
    ouputs <= "0000";
  elsif rising_edge(clk) then
    case present_state is
      when state0 =>
        ouputs <= "0000";
      when state1 =>
        ouputs <= "0001";
      when state2 =>
        ouputs <= "0010";
      when others =>
        ouputs <= "0000";
    end case;
  end if;
end process;

end architecture ifscv1;

