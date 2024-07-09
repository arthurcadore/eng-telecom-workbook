LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY top_timer_de2_115 IS
  PORT (
    CLOCK_50 : IN STD_LOGIC;
    KEY : IN STD_LOGIC_VECTOR (0 DOWNTO 0);
    HEX0 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    HEX1 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    HEX2 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    HEX3 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    HEX4 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
    HEX5 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
  );

END ENTITY;

ARCHITECTURE top_a3_2019_2 OF top_timer_de2_115 IS

  COMPONENT timer IS
    PORT (
      clk, reset : IN STD_LOGIC;
      cen_u, cen_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      sec_u, sec_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      min_u, min_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT bin2bcd IS
    GENERIC (N : POSITIVE := 16);
    PORT (
      clk, reset : IN STD_LOGIC;
      binary_in : IN STD_LOGIC_VECTOR(N - 1 DOWNTO 0);
      bcd0, bcd1, bcd2, bcd3, bcd4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT bcd2ssd
    PORT (
      BCD : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
      SSD : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT pll5khz IS
    PORT (
      inclk0 : IN STD_LOGIC := '0';
      c0 : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL minT, minU : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL secT, secU : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL centT, centU : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL min, sec : STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL cent : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL r_reg, r_next : unsigned(22 DOWNTO 0);
  SIGNAL reset : STD_LOGIC;
  SIGNAL c0 : STD_LOGIC;

BEGIN

  reset <= NOT KEY(0);

  t0 : timer
  PORT MAP(
    clk => c0,
    reset => reset,
    cen_u => centU,
    cen_d => centT,
    sec_u => secU,
    sec_d => secT,
    min_u => minU,
    min_d => minT
  );

  pll5khz_inst : pll5khz PORT MAP(
    inclk0 => CLOCK_50,
    c0 => c0
  );

  bcd0 : bcd2ssd
  PORT MAP(
    BCD => centU,
    SSD => HEX0
  );

  bcd1 : bcd2ssd
  PORT MAP(
    BCD => centT,
    SSD => HEX1
  );

  bcd2 : bcd2ssd
  PORT MAP(
    BCD => secU,
    SSD => HEX2
  );

  bcd3 : bcd2ssd
  PORT MAP(
    BCD => secT,
    SSD => HEX3
  );

  bcd4 : bcd2ssd
  PORT MAP(
    BCD => minU,
    SSD => HEX4
  );

  bcd5 : bcd2ssd
  PORT MAP(
    BCD => minT,
    SSD => HEX5
  );

END top_a3_2019_2;