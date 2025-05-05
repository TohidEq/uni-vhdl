
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity drff is
  port (
    d,r,clk: in STD_LOGIC;
    q: out STD_LOGIC
  );
end drff;

architecture Behavioral of drff is
begin
  process(r,clk)
  begin
    if (r='1') then q<='0';
    elsif (clk'event and clk='1') then q<=d;
    end if;
  end process;
end Behavioral;