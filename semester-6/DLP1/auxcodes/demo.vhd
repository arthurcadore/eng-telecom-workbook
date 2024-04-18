entity mux_novo is
	port
	(
		-- Input ports
		X: in  bit_vector (3 downto 0);
                S : in bit_vector (1 downto 0);
		-- Output ports
		Y : out bit
	);
end entity mux_novo;

-- Implementação com lógica pura
architecture v_logica_pura of mux_novo is

begin
 Y <= (X(0) and (not S(1)) and (not S(0))) or
      (X(1) and (not S(1)) and (S(0))) or
      (X(2) and (S(1)) and (not S(0))) or
      (X(3) and (S(1)) and (S(0)));
end architecture Logica_pura;

-- Implementação com WHEN ELSE
architecture v_WHEN of mux_novo is

begin
 Y <= X(0) when S = "00" else
      X(1) when S = "01" else
      X(2) when S = "10" else
      X(3);
end architecture v_WHEN;

-- Implementação com WITH SELECT
architecture v_WITH_SELECT of mux_novo is

begin
 with S select
 Y <= X(0) when "00",    -- note o uso da ,
      X(1) when "01",
      X(2) when "10",
      X(3) when others;  -- note o uso de others, para todos os demais valores.  
                         -- Não pode ser substituido por "11" mesmo que o signal seja bit_vector.
end architecture v_WITH_SELECT;

-- Implementação com IF ELSE
architecture v_IF_ELSE of mux_novo is

begin
-- Uma arquitetura vazia como essa é denominada de STUB, 
-- Pode ser utilizada em um projeto durante para conferir as conexões externas.
-- Posteriormente a arquitetura será descrita.  

end architecture v_IF_ELSET;

-- Design Unit que associa a architecture com a entity
configuration cfg_ifsc of mux_novo is
--	for v_WITH_SELECT end for;
	for v_WHEN end for;
end configuration;
