
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity jkrff_tb is
end jkrff_tb;

architecture Behavioral of jkrff_tb is
  -- Component declaration
  component jkrff
    port (
      J,K,R,clk : in STD_LOGIC;
      Q,Qbar : out STD_LOGIC
    );
  end component;

  -- Signals
  signal R_tb : STD_LOGIC := '0';
  signal J_tb : STD_LOGIC := '0';
  signal K_tb : STD_LOGIC := '0';
  signal clk_tb : STD_LOGIC := '0';
  signal Q_tb : STD_LOGIC;
  signal Qbar_tb : STD_LOGIC;


begin
  -- Instantiate the D Flip-Flop
  uut: jkrff
    port map (
      J => J_tb,
      K => K_tb,
      R => R_tb,
      clk => clk_tb,
      Q => Q_tb,
      Qbar => Qbar_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            J_tb <= '0'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            K_tb <= '1'; wait for 10 ns;
            J_tb <= '1'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;

            R_tb <= '0'; wait for 2 ns;
            R_tb <= '1'; wait for 0 ns;

            J_tb <= '1'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            R_tb <= '0'; wait for 2 ns;
            R_tb <= '1'; wait for 0 ns;

            J_tb <= '0'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;
        end loop;
        wait;
    end process;

end Behavioral;