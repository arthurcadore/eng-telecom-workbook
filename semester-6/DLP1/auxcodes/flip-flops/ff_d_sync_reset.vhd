library ieee;
  use ieee.std_logic_1164.all;

entity ff_d_sync_reset is
  port (
    clock  : in    std_logic;
    reset  : in    std_logic;
    enable : in    std_logic;
    d      : in    std_logic;
    q      : out   std_logic
  );
end entity ff_d_sync_reset;

architecture without_enable of ff_d_sync_reset is

begin

  -- Flip Flop tipo D com reset sincrono, sensivel a borda de subida, sem enable
  prc : process (clock, reset) is
  begin

    if rising_edge(clock) then
      if (reset = '1') then
        q <= '0';
      else
        q <= d;
      end if;
    end if;

  end process prc;

end architecture without_enable;

architecture with_enable of ff_d_sync_reset is

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

end architecture with_enable;

configuration cfgff_d of ff_d_sync_reset is
-- for without_enable     end for;
  for without_enable end for;
end configuration;
