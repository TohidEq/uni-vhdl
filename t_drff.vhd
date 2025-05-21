
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity t_drff is
  port (
    t,s,clk: in STD_LOGIC;
    q: out STD_LOGIC
  );
end t_drff;

architecture Behavioral of t_drff is
signal t_tmp : STD_LOGIC;
begin
  tff :process(s,clk)
  begin
    if (s='0') then t_tmp<='0';
    elsif (clk'event and clk='1') then
      t_tmp <= t XOR t_tmp;
    end if;
  end process;
  q<=t_tmp;
end Behavioral;