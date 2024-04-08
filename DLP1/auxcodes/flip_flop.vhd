 -- Declaração das bibliotecas e pacotes
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 -- Especificação de todas as entradas e saídas do circuito
 ENTITY flip_flopN IS
 GENERIC (N: natural := 40);
  PORT (clk, rst: IN STD_LOGIC;
  d: in std_logic_vector(1 to N);
  q: OUT std_logic_vector(1 to N));
  END;
  
 -- Descrição de como o circuito deve funcionar
 ARCHITECTURE flip_flop OF flip_flopN IS
 BEGIN
   
  PROCESS (clk, rst)
  BEGIN
   IF (rst='1') THEN
    q <= (others => '0');
   ELSIF (clk'EVENT AND clk='1') THEN
    q <= d;
   END IF;
  END PROCESS;
  
 END;
