library ieee;
  use ieee.std_logic_1164.all;

entity ff_d is
  port (
    clock          : in    std_logic;
    reset          : in    std_logic;
    enable         : in    std_logic;
    d              : in    std_logic;
    reset_sincrono : in    std_logic;
    q              : out   std_logic
  );
end entity ff_d;

architecture v_reset_subida of ff_d is

begin

  -- Flip Flop tipo D com reset assincrono, sensivel a borda de subida.
  prc : process (clock, reset) is
  begin

    if (reset = '1') then
      q <= '0';
    -- elsif (clock'event and clock = '1') then or
    elsif (rising_edge(clock)) then
      q <= d;
    end if;

  end process prc;

end architecture v_reset_subida;

architecture v_enable_reset_subida of ff_d is

begin

  -- Flip Flop tipo D com reset assincrono, sensivel a borda de subida, com enable.
  prc : process (clock, reset) is
  begin

    if (reset = '1') then
      q <= '0';
    elsif (rising_edge(clock)) then
      if (enable = '1') then
        q <= d;
      end if;
    end if;

  end process prc;

end architecture v_enable_reset_subida;

architecture v_enable_sync_reset_subida of ff_d is

begin

  -- Flip Flop tipo D com reset sincrono, sensivel a borda de subida, com enable
  prc : process (clock, reset) is
  begin

    if rising_edge(clock) then
      if (reset = '1') then
        q <= '0';
      elsif (enable = '1') then
        q <= d;
      end if;
    end if;

  end process prc;

end architecture v_enable_sync_reset_subida;

configuration cfg_FF_D of FF_D is
-- for v_reset_subida     end for;
-- for v_enable_reset_subida end for;
  for v_enable_sync_reset_subida end for;
end configuration;
