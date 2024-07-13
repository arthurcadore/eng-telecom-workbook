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