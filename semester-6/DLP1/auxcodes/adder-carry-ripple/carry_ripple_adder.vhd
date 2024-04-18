library ieee;
  use ieee.std_logic_1164.all;

entity carry_ripple_adder is
  generic (
    n : integer := 3
  );
  port (
    a    : in    std_logic_vector(n - 1 downto 0);
    b    : in    std_logic_vector(n - 1 downto 0);
    cin  : in    std_logic;
    s    : out   std_logic_vector(n - 1 downto 0);
    cout : out   std_logic
  );
end entity carry_ripple_adder;

architecture estrutural_sequencial_v1 of carry_ripple_adder is

begin

  -- Uso de um codigo sequencial para geracao de um circuito combinacional
  prc : process (a, b, cin) is

    variable c : std_logic;

  begin

    c := cin;

    for i in 0 to n - 1 loop

      s(i) <= a(i) xor b(i) xor c;
      c    := (a(i) and b(i)) or (a(i) and c) or (b(i) and c);

    end loop;

    cout <= c;

  end process prc;

end architecture estrutural_sequencial_v1;

architecture estrutural_concorrente_v1 of carry_ripple_adder is

  signal c : std_logic_vector(n downto 0);

begin

  -- Uso de um codigo concorrente para geracao de um circuito combinacional
  c(0) <= cin;

  l1 : for i in 0 to n - 1 generate
    s(i)     <= a(i) xor b(i) xor c(i);
    c(i + 1) <= (a(i) and b(i)) or (a(i) and c(i)) or (b(i) and c(i));
  end generate l1;

  cout <= c(n);

end architecture estrutural_concorrente_v1;

configuration cfg_carry_ripple_adder of carry_ripple_adder is
  for estrutural_sequencial_v1 end for;
-- for estrutural_concorrente_v1 end for;
end configuration cfg_carry_ripple_adder;
