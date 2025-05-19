
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity encoder_8_3 is
  port (
    I: in std_logic_vector(7 downto 0);
    O: out std_logic_vector(2 downto 0)
  );
end encoder_8_3;

architecture Behavioral of encoder_8_3 is
begin
  O <= "000" when I="00000001" else
        "001" when I="00000010" else
        "010" when I="00000100" else
        "011" when I="00001000" else
        "100" when I="00010000" else
        "101" when I="00100000" else
        "110" when I="01000000" else
        "111" when I="10000000" else
        "ZZZ";
end Behavioral;