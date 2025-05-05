
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff is
  port (
    d,clk: in STD_LOGIC;
    q: out STD_LOGIC
  );
end dff;

architecture Behavioral of dff is
begin
  process(d,clk)
  begin
    if (clk'event and clk='1') then q<=d;
    end if;
  end process;
end Behavioral;