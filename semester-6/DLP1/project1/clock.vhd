library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

  entity clock is 
port(
  -- Input ports
  clk    : in    std_logic;
  enable : in    std_logic;
  reset  : in    std_logic;
  ac_ccn : in    std_logic;

  -- Output SSD ports, to connect on 7segment display.
  ssd_seconds_unit    : out std_logic_vector(6 downto 0);
  ssd_seconds_decimal : out std_logic_vector(6 downto 0);
  ssd_minutes_unit    : out std_logic_vector(6 downto 0);
  ssd_minutes_decimal : out std_logic_vector(6 downto 0);
  ssd_hours_unit      : out std_logic_vector(6 downto 0);
  ssd_hours_decimal   : out std_logic_vector(6 downto 0)
);
end entity;

architecture ifsc of clock is

  component div_clk is
    generic (
      div : natural := 50
    );
    port (
      clk_in  : in    std_logic;
      rst     : in    std_logic;
      clk_out : out   std_logic
    );  
  end component div_clk;

  component bcd2ssd is 
    port (
      bin     : in    std_logic_vector(3 downto 0);
      ssd_out : out   std_logic_vector(6 downto 0);
      ac_ccn  : in    std_logic
    );
  end component bcd2ssd;

  component counter is
    generic (
      max_decimal : integer := 2;
      max_unit    : integer := 3;
      n           : integer := 9
    );
    port (
      clk         : in    std_logic;
      rst         : in    std_logic;
      bcd_unit    : out   std_logic_vector(3 downto 0);
      bcd_decimal : out   std_logic_vector(3 downto 0);
      clk_out     : out   std_logic
    );
  end component counter;

  signal clk_seconds : std_logic;
  signal clk_minutes : std_logic;
  signal clk_hours   : std_logic;
  signal clk_days    : std_logic;

  signal bcd_unit_seconds    : std_Logic_vector (3 downto 0);
  signal bcd_decimal_seconds : std_Logic_vector (3 downto 0);

  signal bcd_unit_minutes    : std_Logic_vector (3 downto 0);
  signal bcd_decimal_minutes : std_Logic_vector (3 downto 0);

  signal bcd_unit_hours      : std_Logic_vector (3 downto 0);
  signal bcd_decimal_hours   : std_Logic_vector (3 downto 0);

begin

  div_clk_1 : component div_clk
	 generic map(
	 div => 50
	 )
    port map (
      clk_in  => clk,
      clk_out => clk_seconds,
      rst     => reset
    );

-- Counter Section: 

    bcd_counter_seconds : component counter
    generic map (
      max_decimal => 5,
      max_unit    => 9,
      n           => 9
    )
    port map (
      clk         => clk_seconds,
      rst         => reset,
      bcd_unit    => bcd_unit_seconds,
      bcd_decimal => bcd_decimal_seconds,
      clk_out     => clk_minutes
    );

    bcd_counter_minutes : component counter
    generic map (
      max_decimal => 5,
      max_unit    => 9,
      n           => 9
    )
    port map (
      clk         => clk_minutes,
      rst         => reset,
      bcd_unit    => bcd_unit_minutes,
      bcd_decimal => bcd_decimal_minutes,
      clk_out     => clk_hours
    );

    bcd_counter_hours : component counter
    generic map (
      max_decimal => 2,
      max_unit    => 3,
      n           => 9
    )
    port map (
      clk         => clk_hours,
      rst         => reset,
      bcd_unit    => bcd_unit_hours,
      bcd_decimal => bcd_decimal_hours,
      clk_out     => clk_days
    );

-- SSD section: 

bcd2ssd_seconds_unit : component bcd2ssd
port map (
  bin     => bcd_unit_seconds,
  ssd_out => ssd_seconds_unit,
  ac_ccn  => ac_ccn
);

bcd2ssd_seconds_decimal : component bcd2ssd
port map (
  bin     => bcd_decimal_seconds,
  ssd_out => ssd_seconds_decimal,
  ac_ccn  => ac_ccn
);


bcd2ssd_minutes_unit : component bcd2ssd
port map (
  bin     => bcd_unit_minutes,
  ssd_out => ssd_minutes_unit,
  ac_ccn  => ac_ccn
);

bcd2ssd_minutes_decimal : component bcd2ssd
port map (
  bin     => bcd_decimal_minutes,
  ssd_out => ssd_minutes_decimal,
  ac_ccn  => ac_ccn
);


bcd2ssd_hours_unit : component bcd2ssd
port map (
  bin     => bcd_unit_hours,
  ssd_out => ssd_hours_unit,
  ac_ccn  => ac_ccn
);

bcd2ssd_hours_decimal : component bcd2ssd
port map (
  bin     => bcd_decimal_hours,
  ssd_out => ssd_hours_decimal,
  ac_ccn  => ac_ccn
);

end architecture;