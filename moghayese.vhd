
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity moghayese is
  port (
    a,b: in std_logic_vector(7 downto 0);
    q: out STD_LOGIC
  );
end moghayese;

architecture Behavioral of moghayese is
begin
  process(a,b)
  begin
    if (a=b) then
      q<='1';
    else
      q<='0';
    end if;
  end process;
end Behavioral;