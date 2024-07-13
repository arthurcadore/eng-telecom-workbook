#import "@preview/klaro-ifsc-sj:0.1.0": report
#import "@preview/codelst:2.0.1": sourcecode
#show heading: set block(below: 1.5em)
#show par: set block(spacing: 1.5em)
#set text(font: "Arial", size: 12pt)
#set page(
  footer: "Engenharia de Telecomunicações - IFSC-SJ",
)
#show: doc => report(
  title: "Dispositivos Lógicos Progamáveis II",
  subtitle: "Implementação de PLL para Relógio Digital (Milisegundos)",
  authors: ("Arthur Cadore Matuella Barcella e Gabriel Luiz Espindola Pedro",),
  date: "23 de Abril de 2024",
  doc,
)

= Introdução

Neste relatório, será apresentado o desenvolvimento de um relógio digital com precisão de milisegundos, utilizando um PLL (Phase-Locked Loop) para a geração de um sinal de clock de 5 kHz. O projeto foi desenvolvido utilizando a ferramenta Quartus Prime Lite Edition 20.1.0.720 e a placa de desenvolvimento DE2-115.


= Implementação 

== Parte 1 - Adicionar Centésimo de Segundo ao Relógio

A primeira etapa da implementação foi a adição de um contador de 100 para a contagem de centésimos de segundo. Para isso, foi utilizado um contador de 7 bits, que conta de 0 a 99, e um comparador para resetar o contador quando atingir o valor de 100.

Foi instânciado um novo componente de contagem ao circuito e dois conversores BDC2SSD para a impressão dos digitos em um display de 7 segmentos. 

O seguinte RTL foi gerado após a adição do contador de centésimos de segundo ao circuito:

#figure(
  figure(
    rect(image("./pictures/rtlpll.png",  width: 80%)),
    numbering: none,
    caption: [RTL do circuito operando com PLL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Em seguida, verificamos a contagem através do modelsim e observamos que o contador de centésimos de segundo estava funcionando corretamente, contando de 0 a 99 e resetando para 0 após atingir o valor de 100, conforme a imagem abaixo: 

#figure(
  figure(
    rect(image("./pictures/simulation.png", width: 80%)),
    numbering: none,
    caption: [Contagem de centésimos de segundo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Parte 2 - Adicionar PLL

A segunda etapa da implementação é a geração de um sinal de clock de 5 kHz (ao invés do sinal de clock padrão utilizado pela FPGA. Para isso, foi utilizado um PLL com um clock de entrada de 50 MHz (valor de clock padrão para o chip implantado nesta placa). 
\

O componente de PLL foi gerado através da ferramenta `PLL Intel FPGA IP`. Após a configuração do PLL, o sinal de clock de 5 kHz foi obtido na saída deste componente, sendo na sua configuração um *divisor de frequência de 10.000.*
\

#figure(
  figure(
    rect(image("./pictures/pllconfig2.png", width: 80%)),
    numbering: none,
    caption: [Configuração do PLL através da ferramenta ALT-PLL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Na própria ferramenta, ao inserir os valores de entrada e saída desejados para o circuito de PLL, o Quartus gera o código VHDL necessário para a configuração do circuito que irá controlar a seção analógica do PLL, assim sendo possivel realizar a multiplicação ou divisão de frequência corretamente. 


Ao finailizar a configuração, foi solicitado gerar os seguintes arquivos: 

#figure(
  figure(
    rect(image("./pictures/pllconfig3.png", width: 80%)),
    numbering: none,
    caption: [Configuração do PLL através da ferramenta ALT-PLL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


Abaixo está uma sessão do código VHD gerado pelo Quartus, para a configuração VHDL do PLL, demais arquivos são necessários para realizar a instânciação do PLL como um componente do circuito principal.
\

#sourcecode[```vhd
	GENERIC MAP (
		bandwidth_type => "AUTO",
		clk0_divide_by => 10000,
		clk0_duty_cycle => 50,
		clk0_multiply_by => 1,
		clk0_phase_shift => "0",
		compensate_clock => "CLK0",
		inclk0_input_frequency => 50000,
		intended_device_family => "Cyclone IV E",
		lpm_hint => "CBX_MODULE_PREFIX=pll",
		lpm_type => "altpll",
		operation_mode => "NORMAL",
		pll_type => "AUTO",
```]

É possivel notar na descrição acima frequência de entrada, a frequência de saída, o fator de divisão e o duty-cicle do circuito de PLL. 

Esses parâmetros são necessários para determinar o formato da onda na saída do circuito, sendo que a frequência precisa ser dividida pelas 10.000 vezes para obter a frequência de 5 kHz.

O duty cicle é de 50% para que a onda seja simétrica, abaixo está uma imagem para ilustrar a diferença entre um duty-cicle de 50% entre 25% e 75%:

#figure(
  figure(
    rect(image("./pictures/dutycicle.png", width: 80%)),
    numbering: none,
    caption: [Ilustração de variação de duty-cicle]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Com a adição do PLL no circuito, temos uma topologia RTL com um intermediário entre o clock de entrada e o clock de saída, como ilustrado abaixo. 

Para ajustar a contagem do segundo, o componente de timer também teve que ser ajustado para contar 5.000 vezes mais rápido, ou seja, de 0 a 99,99 em 5.000 ms.

#figure(
  figure(
    rect(image("./pictures/rtlpll.png",  width: 80%)),
    numbering: none,
    caption: [RTL do circuito operando com PLL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Em seguida, realizamos a simulação do circuito com a adição do PLL e verificamos seu funcionamento, conforme a imagem abaixo, a simulação apresenta a mesma caracteristica de onda pois apenas o clock foi alterado, mantendo a contagem de centésimos de segundo correta: 

#figure(
  figure(
    rect(image("./pictures/simulationpll.png", width: 80%)),
    numbering: none,
    caption: [Contagem de centésimos de segundo com PLL]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


== Parte 3 - Modificar contadores para BCD

Para realizarmos a parte 3, alteramos o método de contagem do contador de centésimos de segundo para BCD (Binary-Coded Decimal), que é uma forma de representar números decimais utilizando 4 bits para cada dígito. 

Diferentemente da topologia RTL nos casos anteriores, na parte 3, toda a contagem é feita diretamente em um único componente. Para isso, diversos sinais foram criados para armazenar a contagem atual e repassar o status da contagem para o próximo ciclo de clock.

#sourcecode[```vhd
ARCHITECTURE single_clock_arch OF timer IS
   SIGNAL r_reg : unsigned(5 DOWNTO 0);
   SIGNAL r_next : unsigned(5 DOWNTO 0);

   SIGNAL s_u_reg, m_u_reg : unsigned(3 DOWNTO 0);
   SIGNAL s_d_reg, m_d_reg : unsigned(3 DOWNTO 0);

   SIGNAL s_u_next, m_u_next : unsigned(3 DOWNTO 0);
   SIGNAL s_d_next, m_d_next : unsigned(3 DOWNTO 0);

   SIGNAL s_en, m_en : STD_LOGIC;

   SIGNAL c_u_reg, c_u_next : unsigned(3 DOWNTO 0);
   SIGNAL c_en : STD_LOGIC;

   SIGNAL c_d_reg, c_d_next : unsigned(3 DOWNTO 0);

```]


Em seguida, a lógica de contagem foi implementada de maneira a contar os centesimos de segundo, segundos e minutos: 

#sourcecode[```vhd
BEGIN
   -- register
   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         r_reg <= (OTHERS => '0');
         s_u_reg <= (OTHERS => '0');
         m_u_reg <= (OTHERS => '0');

         s_d_reg <= (OTHERS => '0');
         m_d_reg <= (OTHERS => '0');

         c_u_reg <= (OTHERS => '0');
         c_d_reg <= (OTHERS => '0');
      ELSIF (rising_edge(clk)) THEN
         r_reg <= r_next;
         c_u_reg <= c_u_next;
         c_d_reg <= c_d_next;
         s_u_reg <= s_u_next;
         s_d_reg <= s_d_next;
         m_u_reg <= m_u_next;
         m_d_reg <= m_d_next;
      END IF;
   END PROCESS;

   -- next-state logic/output logic for mod-1000000 counter
   r_next <= (OTHERS => '0') WHEN r_reg = 49 ELSE
      r_reg + 1;

   c_en <= '1' WHEN r_reg = 49 ELSE
      '0';

   s_en <= '1' WHEN c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1' ELSE
      '0';

   m_en <= '1' WHEN s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1' ELSE
      '0';

   -- next-state logic/output logic for centisecond units
   c_u_next <= (OTHERS => '0') WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_u_reg + 1 WHEN c_en = '1' ELSE
      c_u_reg;

   -- next-state logic/output logic for centisecond tens
   c_d_next <= (OTHERS => '0') WHEN (c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg + 1 WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg;

   -- next-state logic/output logic for second units
   s_u_next <= (OTHERS => '0') WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_u_reg + 1 WHEN s_en = '1' ELSE
      s_u_reg;

   -- next-state logic/output logic for second tens
   s_d_next <= (OTHERS => '0') WHEN (s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg + 1 WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg;

   -- next-state logic/output logic for minute units
   m_u_next <= (OTHERS => '0') WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_u_reg + 1 WHEN m_en = '1' ELSE
      m_u_reg;

   -- next-state logic/output logic for minute tens
   m_d_next <= (OTHERS => '0') WHEN (m_d_reg = 5 AND m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg + 1 WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg;

```]

E por fim, a saída desta contagem foi repassada para os displays de 7 segmentos para exibição: 

#sourcecode[```vhd

   -- output logic
   cen_u <= STD_LOGIC_VECTOR(c_u_reg);
   cen_d <= STD_LOGIC_VECTOR(c_d_reg);

   sec_u <= STD_LOGIC_VECTOR(s_u_reg);
   sec_d <= STD_LOGIC_VECTOR(s_d_reg);

   min_u <= STD_LOGIC_VECTOR(m_u_reg);
   min_d <= STD_LOGIC_VECTOR(m_d_reg);
END single_clock_arch;
```]

Com a implementação do contador BCD, podemos ver alteração na topologia do RTL, conforme apresentado abaixo: 

#figure(
  figure(
    image("./pictures/timerBCD.png"),
    numbering: none,
    caption: [Timer com contagem em BCD]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)



== Parte 4 - Modificar o r_reg para LFSR: 

A parte 4 consiste em modificar o registrador r_reg para um registrador LFSR (Linear Feedback Shift Register), o objetivo é retirar o contador sequencial que é utilizado por padrão e substituir por um contador LFSR.

Essa modificação permite uma vantagem no circuito pois ao utilizar um contador sequencial comum, são necessários diversos registradores para armazenar o estado atual do número, nesta atividade por exemplo, utilizando contadores sequenciais, seriam necessários 13 registradores para armazenar o estado atual do contador de 13 bits, pois 13 bits geram 8.192 possibilidades o equivalente as 5000 contagens necessárias para o circuito.

Agora, ao subistituirmos o contador sequencial por um LFSR, é possível realizar a contagem até 5000 com apenas 4 Taps (onde operações XOR são realizadas para gerar o próximo estado do contador) e 13 bits, o que reduz a quantidade de registradores necessários para armazenar o estado atual do contador, e também a complexidade e o tempo de propagação do circuito.

Desta forma, seguindo a planilha repassada professor, utilizamos a seguinte configuração para o LFSR, foi utilziado os seguintes parâmetros: 

- Seed: 1111111111111
- Taps: [0, 2, 3, 12]
- bits: [12, 10, 9, 0] (Os bits são ordenados de acordo com a ordem de saída do LFSR, ou seja, inversos aos taps)

Entretanto, para utilizarmos o contador LFSR, é necessário também identificar qual a sequencia de bits que estará 5000 contagens a frente da sequência considerada inicial, ou seja, no nosso caso, a seed escolhida foi um vetor com 13x1, então, devemos identificar qual o vetor que estará 5000 casas a frente, para podermos resetar o contador e iniciar a contagem novamente. 

Para isso, executamos o código Python abaixo para gerar a sequência LFSR e imprimir o estado do LFSR após 5000 contagens:

#sourcecode[```shell
cadore: ~$ python3 find_LFSR.py 
Estado do LFSR na contagem 5000: 1011111001001
```]

O código Python utilizado possui a seguinte estrutura: 

#sourcecode[```python
# -*- coding: utf-8 -*-

def lfsr(seed, taps, count):
    # Converte o seed de string binária para uma lista de inteiros
    state = [int(bit) for bit in seed]
    
    # Função para calcular o próximo bit usando os taps
    def next_bit(state, taps):
        xor = 0
        for t in taps:
            xor ^= state[t]
        return xor
    
    for i in range(count):
        new_bit = next_bit(state, taps)  # Calcula o próximo bit
        state = [new_bit] + state[:-1]  # Desloca os bits para a direita e insere o novo bit na frente
        state_str = ''.join(map(str, state))
        print(f"{i + 1}: {state_str}")

# Parâmetros
seed = '1111111111111'
taps = [0, 2, 3, 12]
count = 5000

# Gera a sequência LFSR e imprime todos os estados
lfsr(seed, taps, count)
```]

Em seguida, alteramos a implementação do componente de contagem para utilizar o LFSR ao invés do contador sequencial, como ilustrado abaixo:

#sourcecode[```vhd
BEGIN
   -- register
   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         LFSR_reg <= SEED;
         s_u_reg <= (OTHERS => '0');
         m_u_reg <= (OTHERS => '0');

         s_d_reg <= (OTHERS => '0');
         m_d_reg <= (OTHERS => '0');

         c_u_reg <= (OTHERS => '0');
         c_d_reg <= (OTHERS => '0');
      ELSIF (rising_edge(clk)) THEN
         LFSR_reg <= LFSR_next;  
         c_u_reg <= c_u_next;
         c_d_reg <= c_d_next;
         s_u_reg <= s_u_next;
         s_d_reg <= s_d_next;
         m_u_reg <= m_u_next;
         m_d_reg <= m_d_next;
      END IF;
   END PROCESS;

   fb <= LFSR_reg(5) XOR LFSR_reg(0);

   LFSR_next <= SEED WHEN LFSR_reg = CONST_RESET
      ELSE
      fb & LFSR_reg(5 DOWNTO 1);

   c_en <= '1' WHEN LFSR_reg = CONST_RESET
      ELSE
      '0';

   s_en <= '1' WHEN c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1' ELSE
      '0';

   m_en <= '1' WHEN s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1' ELSE
      '0';

   -- next-state logic/output logic for centisecond units
   c_u_next <= (OTHERS => '0') WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_u_reg + 1 WHEN c_en = '1' ELSE
      c_u_reg;

   -- next-state logic/output logic for centisecond tens
   c_d_next <= (OTHERS => '0') WHEN (c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg + 1 WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg;
```]

Nesta modificação, apenas o componente de contagem foi alterado, desta forma, mantendo a estrutura do RTL igual: 

#figure(
  figure(
    image("./pictures/timerBCD.png"),
    numbering: none,
    caption: [Timer com contagem em LFSR]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

== Parte 5 - Implementação na placa: 

Para cada etapa, realizamos a implementação na placa de desenvolvimento DE2-115, e verificamos o funcionamento do circuito.

#figure(
  figure(
    image("./pictures/pinplanner.png",  width: 60%),
    numbering: none,
    caption: [Sinal de entrada no domínio do tempo]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)

Desta forma, obtivemos os seguintes resultados: 

#figure(
  figure(
    table(
     columns: (1fr, 1fr, 1fr),
    align: (left, center, center),
    table.header[Implementacao][Área (LE)][Registradores],
    [Parte 1], [83], [13.699],
    [Parte 2], [239], [124],
    [Parte 3], [102], [30],
    [Parte 4], [101], [24],
    ),
    numbering: none,
    caption: [Tabela de resultados da implementação]
  ),
  caption: figure.caption([Elaborada pelo Autor], position: top)
)


= Conclusão

A partir da implementação do PLL vista anteriormente, juntamente com a implementação de divisão de clock sem o uso do PLL, podemos concluir que a utilização de um PLL é muito útil para a geração de sinais de clock com frequências específicas de maneira confiável.

Isso pois o PLL é capaz de gerar sinais de clock com frequências específicas, além de possuir uma maior precisão e estabilidade em relação a outros métodos de geração de clock. Além disso, podemos concluir que a contagem de maneira não sequencial através de um LFSR é mais eficiente e consome menos recursos da FPGA, além de ser mais rápido e eficiente.

Isso pois o LFSR pois não precisar contar de maneira sequencial e necessitar apenas de operações básicas para funcionar, não é só mais eficiente em termos de consumo de resursos, mais também possui um tempo de operação menor, contribuindo para um tempo menor de propagação do circuito.

= Códigos VHDL utilizados

Abaixo estão os demais códigos VHDL utilizados para a implementação do projeto.

== bin2bcd
#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
    port (
        A      : in  std_logic_vector (7 downto 0);
        sd, su, sc : out std_logic_vector (3 downto 0)
    );
end entity;

architecture ifsc_v1 of bin2bcd is
    signal A_uns          : unsigned (7 downto 0);
    signal sd_uns, su_uns, sc_uns : unsigned (7 downto 0);

begin
    A_uns  <= unsigned(A);
	 sc_uns <= A_uns/100;
    sd_uns <= A_uns/10;
    su_uns <= A_uns rem 10;
    sc     <= std_logic_vector(resize(sc_uns, 4));
    sd     <= std_logic_vector(resize(sd_uns, 4));
    su     <= std_logic_vector(resize(su_uns, 4));
end architecture;
```]

== bcd2ssd: 

#sourcecode[```vhd
library ieee;
use ieee.std_logic_1164.all;

entity bcd2ssd is
  port (
    BCD : in std_logic_vector (3 downto 0);
    SSD : out std_logic_vector (6 downto 0)
  );

end entity;

architecture arch of bcd2ssd is
begin

  with BCD select
    SSD <= "1000000" when "0000",
    "1111001" when "0001",
    "0100100" when "0010",
    "0110000" when "0011",
    "0011001" when "0100",
    "0010010" when "0101",
    "0000011" when "0110",
    "1111000" when "0111",
    "0000000" when "1000",
    "0011000" when "1001",
    "0111111" when others;
end arch;
```]

== timer: 

#sourcecode[```vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY timer IS
   PORT (
      clk, reset : IN STD_LOGIC;
      cen_u, cen_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      sec_u, sec_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      min_u, min_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END timer;

ARCHITECTURE single_clock_arch OF timer IS
   SIGNAL r_reg : unsigned(5 DOWNTO 0);
   SIGNAL r_next : unsigned(5 DOWNTO 0);

   SIGNAL s_u_reg, m_u_reg : unsigned(3 DOWNTO 0);
   SIGNAL s_d_reg, m_d_reg : unsigned(3 DOWNTO 0);

   SIGNAL s_u_next, m_u_next : unsigned(3 DOWNTO 0);
   SIGNAL s_d_next, m_d_next : unsigned(3 DOWNTO 0);

   SIGNAL s_en, m_en : STD_LOGIC;

   SIGNAL c_u_reg, c_u_next : unsigned(3 DOWNTO 0);
   SIGNAL c_en : STD_LOGIC;

   SIGNAL c_d_reg, c_d_next : unsigned(3 DOWNTO 0);

BEGIN
   -- register
   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         r_reg <= (OTHERS => '0');
         s_u_reg <= (OTHERS => '0');
         m_u_reg <= (OTHERS => '0');

         s_d_reg <= (OTHERS => '0');
         m_d_reg <= (OTHERS => '0');

         c_u_reg <= (OTHERS => '0');
         c_d_reg <= (OTHERS => '0');
      ELSIF (rising_edge(clk)) THEN
         r_reg <= r_next;
         c_u_reg <= c_u_next;
         c_d_reg <= c_d_next;
         s_u_reg <= s_u_next;
         s_d_reg <= s_d_next;
         m_u_reg <= m_u_next;
         m_d_reg <= m_d_next;
      END IF;
   END PROCESS;

   -- next-state logic/output logic for mod-1000000 counter
   r_next <= (OTHERS => '0') WHEN r_reg = 49 ELSE
      r_reg + 1;

   c_en <= '1' WHEN r_reg = 49 ELSE
      '0';

   s_en <= '1' WHEN c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1' ELSE
      '0';

   m_en <= '1' WHEN s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1' ELSE
      '0';

   -- next-state logic/output logic for centisecond units
   c_u_next <= (OTHERS => '0') WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_u_reg + 1 WHEN c_en = '1' ELSE
      c_u_reg;

   -- next-state logic/output logic for centisecond tens
   c_d_next <= (OTHERS => '0') WHEN (c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg + 1 WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg;

   -- next-state logic/output logic for second units
   s_u_next <= (OTHERS => '0') WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_u_reg + 1 WHEN s_en = '1' ELSE
      s_u_reg;

   -- next-state logic/output logic for second tens
   s_d_next <= (OTHERS => '0') WHEN (s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg + 1 WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg;

   -- next-state logic/output logic for minute units
   m_u_next <= (OTHERS => '0') WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_u_reg + 1 WHEN m_en = '1' ELSE
      m_u_reg;

   -- next-state logic/output logic for minute tens
   m_d_next <= (OTHERS => '0') WHEN (m_d_reg = 5 AND m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg + 1 WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg;

   -- output logic
   cen_u <= STD_LOGIC_VECTOR(c_u_reg);
   cen_d <= STD_LOGIC_VECTOR(c_d_reg);

   sec_u <= STD_LOGIC_VECTOR(s_u_reg);
   sec_d <= STD_LOGIC_VECTOR(s_d_reg);

   min_u <= STD_LOGIC_VECTOR(m_u_reg);
   min_d <= STD_LOGIC_VECTOR(m_d_reg);
END single_clock_arch;
```]

== top_timer: 

#sourcecode[```vhd
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
```]

== single_clock_arch: 
#sourcecode[```vhd
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY timer IS
   PORT (
      clk, reset : IN STD_LOGIC;
      cen_u, cen_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      sec_u, sec_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
      min_u, min_d : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
   );
END timer;

ARCHITECTURE single_clock_arch OF timer IS
   SIGNAL r_next : unsigned(5 DOWNTO 0);

   SIGNAL s_u_reg, m_u_reg : unsigned(3 DOWNTO 0);
   SIGNAL s_d_reg, m_d_reg : unsigned(3 DOWNTO 0);

   SIGNAL s_u_next, m_u_next : unsigned(3 DOWNTO 0);
   SIGNAL s_d_next, m_d_next : unsigned(3 DOWNTO 0);

   SIGNAL s_en, m_en : STD_LOGIC;

   
   SIGNAL c_u_reg, c_u_next : unsigned(3 DOWNTO 0);
   SIGNAL c_en : STD_LOGIC;
   
   SIGNAL c_d_reg, c_d_next : unsigned(3 DOWNTO 0);
   
   CONSTANT CONST_RESET : unsigned(5 DOWNTO 0) := "000110";
   CONSTANT SEED : unsigned(5 DOWNTO 0) := "111111";
   SIGNAL fb : STD_LOGIC;
   SIGNAL LFSR_reg: unsigned(5 DOWNTO 0);
   SIGNAL LFSR_next: unsigned(5 DOWNTO 0);
   
BEGIN
   -- register
   PROCESS (clk, reset)
   BEGIN
      IF (reset = '1') THEN
         LFSR_reg <= SEED;
         s_u_reg <= (OTHERS => '0');
         m_u_reg <= (OTHERS => '0');

         s_d_reg <= (OTHERS => '0');
         m_d_reg <= (OTHERS => '0');

         c_u_reg <= (OTHERS => '0');
         c_d_reg <= (OTHERS => '0');
      ELSIF (rising_edge(clk)) THEN
         LFSR_reg <= LFSR_next;  
         c_u_reg <= c_u_next;
         c_d_reg <= c_d_next;
         s_u_reg <= s_u_next;
         s_d_reg <= s_d_next;
         m_u_reg <= m_u_next;
         m_d_reg <= m_d_next;
      END IF;
   END PROCESS;

   fb <= LFSR_reg(5) XOR LFSR_reg(0);

   LFSR_next <= SEED WHEN LFSR_reg = CONST_RESET
      ELSE
      fb & LFSR_reg(5 DOWNTO 1);

   c_en <= '1' WHEN LFSR_reg = CONST_RESET
      ELSE
      '0';

   s_en <= '1' WHEN c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1' ELSE
      '0';

   m_en <= '1' WHEN s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1' ELSE
      '0';

   -- next-state logic/output logic for centisecond units
   c_u_next <= (OTHERS => '0') WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_u_reg + 1 WHEN c_en = '1' ELSE
      c_u_reg;

   -- next-state logic/output logic for centisecond tens
   c_d_next <= (OTHERS => '0') WHEN (c_d_reg = 9 AND c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg + 1 WHEN (c_u_reg = 9 AND c_en = '1') ELSE
      c_d_reg;

   -- next-state logic/output logic for second units
   s_u_next <= (OTHERS => '0') WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_u_reg + 1 WHEN s_en = '1' ELSE
      s_u_reg;

   -- next-state logic/output logic for second tens
   s_d_next <= (OTHERS => '0') WHEN (s_d_reg = 5 AND s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg + 1 WHEN (s_u_reg = 9 AND s_en = '1') ELSE
      s_d_reg;

   -- next-state logic/output logic for minute units
   m_u_next <= (OTHERS => '0') WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_u_reg + 1 WHEN m_en = '1' ELSE
      m_u_reg;

   -- next-state logic/output logic for minute tens
   m_d_next <= (OTHERS => '0') WHEN (m_d_reg = 5 AND m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg + 1 WHEN (m_u_reg = 9 AND m_en = '1') ELSE
      m_d_reg;

   -- output logic
   cen_u <= STD_LOGIC_VECTOR(c_u_reg);
   cen_d <= STD_LOGIC_VECTOR(c_d_reg);

   sec_u <= STD_LOGIC_VECTOR(s_u_reg);
   sec_d <= STD_LOGIC_VECTOR(s_d_reg);

   min_u <= STD_LOGIC_VECTOR(m_u_reg);
   min_d <= STD_LOGIC_VECTOR(m_d_reg);
END single_clock_arch;
```]