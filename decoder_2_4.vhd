
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder_2_4 is
  port (
    I: in std_logic_vector(1 downto 0);
    O: out std_logic_vector(3 downto 0)
  );
end decoder_2_4;

architecture Behavioral of decoder_2_4 is
begin
  process(I)
    begin
      case I is
        when "00" => O <= "0001";
        when "01" => O <= "0010";
        when "10" => O <= "0100";
        when "11" => O <= "1000";
        when others => O <= "XXXX";
      end case;
    end process;
end Behavioral;