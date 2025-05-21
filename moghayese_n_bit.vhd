
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity moghayese_n_bit is
  port (
    a,b: in std_logic_vector(4 downto 0);
    greater: out STD_LOGIC;
    lower: out STD_LOGIC;
    equal: out STD_LOGIC
  );
end moghayese_n_bit;

architecture Behavioral of moghayese_n_bit is
begin
  process(a,b)
  begin
    equal <= '1' when a = b else '0';
    greater <= '1' when a > b else '0';
    lower <= '1' when a < b else '0';
  end process;
end Behavioral;