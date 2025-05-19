
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity jkrff is
  port (
    J,K,clk,R: in STD_LOGIC;
    Q,Qbar: out STD_LOGIC
  );
end jkrff;

architecture Behavioral of jkrff is
  signal state: STD_LOGIC;
  signal input:std_logic_vector(1 downto 0);
begin
  input <= J & K;
  p: process(R,clk)
  begin
    if (R='0') then
      state <= '0';
    elsif (clk'event and clk='1') then
      case (input) is
        when "11" =>
          state <= not state;
        when "10" =>
          state <= '1';
        when "01" =>
          state <= '0';
        when others =>
          null;
      end case;
    end if;
  end process;
  ---------
  Q <= state;
  Qbar <= not state;
end Behavioral;