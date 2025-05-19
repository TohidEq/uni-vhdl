
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity drff_tb is
end drff_tb;

architecture Behavioral of drff_tb is
  -- Component declaration
  component drff
    port (
      d,r, clk : in STD_LOGIC;
      q : out STD_LOGIC
    );
  end component;

  -- Signals
  signal d_tb : STD_LOGIC := '0';
  signal r_tb : STD_LOGIC := '0';
  signal clk_tb : STD_LOGIC := '0';
  signal q_tb : STD_LOGIC;


begin
  -- Instantiate the D Flip-Flop
  uut: drff
    port map (
      d => d_tb,
      r => r_tb,
      clk => clk_tb,
      q => q_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            d_tb <= '0'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            d_tb <= '1'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;

            r_tb <= '1'; wait for 2 ns;
            r_tb <= '0'; wait for 0 ns;

            d_tb <= '1'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            r_tb <= '1'; wait for 2 ns;
            r_tb <= '0'; wait for 0 ns;

            d_tb <= '0'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;
        end loop;
        wait;
    end process;

end Behavioral;