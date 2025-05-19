
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
  with I select
  O <= "000" when "00000001" ,
        "001" when "00000010",
        "010" when "00000100",
        "011" when "00001000",
        "100" when "00010000",
        "101" when "00100000",
        "110" when "01000000",
        "111" when "10000000",
        "ZZZ" when others;
end Behavioral;