library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtract is
  port (
    X, Y, Bin: in STD_LOGIC;
    Diff, Bout: out STD_LOGIC
  );
end subtract;


architecture Behavioral of subtract is
begin
  Diff <= X XOR Y XOR Bin;
  Bout <= (Bin AND NOT X) OR (Bin AND Y) OR (Y AND NOT X);
end Behavioral;