-- Aluno: Arthur Cadore M. Barcella
-- DLP1: Eng telecom
---------------------------------------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin_to_bcd_lab is
    port (
        A : in std_logic_vector(14 downto 0);  -- Entrada de 15 bits em binário
        sm : out std_logic_vector(4 downto 0);  -- Milhar - Entrada mais significativo
        sc : out std_logic_vector(4 downto 0);  -- Centena
        sd : out std_logic_vector(4 downto 0);  -- Dezena
        su : out std_logic_vector(4 downto 0)   -- Unidade - Entrada menos significativo
    );
end entity bin_to_bcd_lab;

architecture ae4 of bin_to_bcd_lab is
    signal A_uns : unsigned(14 downto 0);  -- Sinal para armazenar o valor de entrada.
    signal slice_mil : unsigned(14 downto 0);  -- Milhar em BCD
    signal slice_cem : unsigned(14 downto 0);  -- Centena em BCD
    signal slice_dez : unsigned(14 downto 0);  -- Dezena em BCD
    signal slice_uni : unsigned(14 downto 0);  -- Unidade em BCD
begin
    
    -- Converter entrada binária para número inteiro sem sinal
    A_uns <= unsigned(A);

    -- Converter binário para BCD
    process(A_uns)
    begin
        slice_mil <= A_uns / 1000;  -- Extrair milhar do número BCD
        slice_cem <= (A_uns mod 1000) / 100;  -- Extrair centena do número BCD
        slice_dez <= (A_uns mod 100) / 10;  -- Extrair dezena do número BCD
        slice_uni <= A_uns mod 10;  -- Extrair unidade do número BCD
    end process;

    -- Saída dos dígitos BCD
    -- Converter para vetor lógico
    sm <= std_logic_vector(slice_mil(4 downto 0));  
    sc <= std_logic_vector(slice_cem(4 downto 0));
    sd <= std_logic_vector(slice_dez(4 downto 0));
    su <= std_logic_vector(slice_uni(4 downto 0));
end architecture;
