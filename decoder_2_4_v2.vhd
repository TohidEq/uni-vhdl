
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder_2_4_v2 is
  port (
    I: in std_logic_vector(1 downto 0);
    O: out std_logic_vector(3 downto 0)
  );
end decoder_2_4_v2;

architecture Behavioral of decoder_2_4_v2 is
begin
  O <= "0001" when I="00" else
        "0010" when I="01" else
        "0100" when I="10" else
        "1000" when I="11" else
        "XXXX";

end Behavioral;