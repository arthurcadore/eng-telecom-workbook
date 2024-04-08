library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_bcd is
	port (
		A      : in  std_logic_vector (6 downto 0);
		sd, su : out std_logic_vector (3 downto 0)
	);
end entity;

architecture ifsc_v1 of bin_to_bcd is
	signal A_uns          : unsigned (6 downto 0);
	signal sd_uns, su_uns : unsigned (6 downto 0);

begin
	sd     <= std_logic_vector(resize(sd_uns, 4));
	su     <= std_logic_vector(resize(su_uns, 4));
	sd_uns <= A_uns/10;
	su_uns <= A_uns rem 10;
	A_uns  <= unsigned(A);
end architecture;