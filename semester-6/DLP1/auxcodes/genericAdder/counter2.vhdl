library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity counter2 is
	-- criando um define: 
	generic(
		N : integer := 4
	);
	port (
		-- definindo as portas de entrada e sa
		a, b: in std_logic_vector(N-1 downto 0); 
		cin: in std_logic;
		cout: out std_logic;
		sum : out std_Logic_vector(N-1 downto 0)
	);
end entity;

architecture ifsc_v1 of counter2 is

	-- declaraçao de sinais para utilizar no codigo
	signal a_uns : unsigned(N downto 0);
	signal b_uns : unsigned(N downto 0);
	signal cin_uns : unsigned(0 downto 0);
	signal tmp : unsigned(N downto 0);
	
begin
	-- como o signal foi criado de N downto 0, sao 9 bits, portanto N+1
	a_uns <= resize(unsigned(a), N + 1);
	b_uns <= resize(unsigned(b), N + 1);
	
	cin_uns <= "1" when cin='1' 
		       else "0";
	
	tmp <= a_uns + b_uns + cin_uns;
	
	sum(N-1 downto 0) <= std_logic_vector(tmp (N-1 downto 0));
	
	cout <= tmp(N);
	
end architecture;

architecture ifsc_v2 of counter2 is

	-- declaraçao de sinais para utilizar no codigo
	signal a_uns : unsigned(N+1 downto 0);
	signal b_uns : unsigned(N downto 0);
	signal cin_uns : unsigned(0 downto 0);
	signal tmp : unsigned(N+1 downto 0);
	
begin
	-- como o signal foi criado de N downto 0, sao 9 bits, portanto N+1
	a_uns <= resize(unsigned(a), N+1) & cin;
	b_uns <= resize(unsigned(b), N) & "1";
	
	tmp <= a_uns + b_uns;
	
	sum <= std_logic_vector(tmp (N downto 1));
	
	cout <= tmp(N+1);
	
end architecture;

configuration conf_contador of counter2 is 
	for ifsc_v1 end for; 
	-- for ifsc_v2 end for;
end configuration;
