library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity binAdder is
    generic(
		Nlength: integer := 7
		);
    port(
	 
	 in_1: in std_logic_vector(Nlength - 1 downto 0);
	 in_2: in std_logic_vector(Nlength - 1 downto 0);
	 out_1: out std_logic_vector(Nlength downto 0)
        
    );
end binAdder;

architecture behaviour of binAdder is
 
   signal bin1, bin2: unsigned(Nlength downto 0);
	 signal out_bin: unsigned(Nlength downto 0);

begin

	  bin1 <= resize(unsigned(in_1),Nlength + 1); 
	  bin2 <= resize(unsigned(in_2),Nlength + 1);
	
  	out_bin <= bin1 + bin2;
  	out_1 <= std_logic_vector(out_bin);

end behaviour;