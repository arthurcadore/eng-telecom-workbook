library ieee;
  use ieee.std_logic_1164.all;

entity tb_bcd2ssd is
  port (
    bcd_unit    : in    std_logic_vector(3 downto 0);
    bcd_decimal : in    std_logic_vector(3 downto 0);
    ssd_unit    : out   std_logic_vector(6 downto 0);
    ssd_decimal : out   std_logic_vector(6 downto 0)
  );
end entity tb_bcd2ssd;

architecture rtl2 of tb_bcd2ssd is

  component bcd2ssd is
    port (
      bin     : in    std_logic_vector(3 downto 0);
      ssd_out : out   std_logic_vector(6 downto 0);
      ac_ccn  : in    std_logic
    );
  end component bcd2ssd;

begin

  bcd2ssd_unit : component bcd2ssd
    port map (
      bin     => bcd_unit,
      ssd_out => ssd_unit,
      ac_ccn  => '0'
    );

  bcd2ssd_decimal : component bcd2ssd
    port map (
      bin     => bcd_decimal,
      ssd_out => ssd_decimal,
      ac_ccn  => '0'
    );

end architecture rtl2;
