

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity encoder_8_3_tb is
end encoder_8_3_tb;

architecture Behavioral of encoder_8_3_tb is
  -- Component declaration
  component encoder_8_3
    port (
      I: in std_logic_vector(7 downto 0);
      O: out std_logic_vector(2 downto 0)
    );
  end component;



      signal I_tb: std_logic_vector(7 downto 0) :="00000000";
      signal O_tb: std_logic_vector(2 downto 0) :="000";

begin
  -- Instantiate the D Flip-Flop
  uut: encoder_8_3
    port map (
      I => I_tb,
      O => O_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            I_tb <= "00000001"; wait for 15 ns;
            I_tb <= "00000010"; wait for 15 ns;
            I_tb <= "00000100"; wait for 15 ns;
            I_tb <= "00001000"; wait for 15 ns;
            I_tb <= "00010000"; wait for 15 ns;
            I_tb <= "00100000"; wait for 15 ns;
            I_tb <= "01000000"; wait for 15 ns;
            I_tb <= "10000000"; wait for 15 ns;
        end loop;
        wait;
    end process;

end Behavioral;