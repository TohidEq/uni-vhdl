library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rsff is
  port (
    R,S: in STD_LOGIC;
    Q: inout STD_LOGIC
  );
end rsff;

architecture Behavioral of rsff is
begin
  process(R,S,Q)
  begin
    if S='0' then
      Q<='1';
    elsif R='0' then
      Q<='0';
    else Q<=Q;
    end if;
  end process;
end Behavioral;