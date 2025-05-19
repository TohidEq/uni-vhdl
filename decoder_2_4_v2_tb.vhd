
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder_2_4_v2_tb is
end decoder_2_4_v2_tb;

architecture Behavioral of decoder_2_4_v2_tb is
  -- Component declaration
  component decoder_2_4_v2
    port (
      I: in std_logic_vector(1 downto 0);
      O: out std_logic_vector(3 downto 0)
    );
  end component;



      signal I_tb: std_logic_vector(1 downto 0) :="00";
      signal O_tb: std_logic_vector(3 downto 0) :="0000";

begin
  -- Instantiate the D Flip-Flop
  uut: decoder_2_4_v2
    port map (
      I => I_tb,
      O => O_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            I_tb <= "00"; wait for 15 ns;
            I_tb <= "01"; wait for 15 ns;
            I_tb <= "10"; wait for 15 ns;
            I_tb <= "11"; wait for 15 ns;
        end loop;
        wait;
    end process;

end Behavioral;