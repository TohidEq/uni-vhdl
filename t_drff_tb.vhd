
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity t_drff_tb is
end t_drff_tb;

architecture Behavioral of t_drff_tb is
  -- Component declaration
  component t_drff
    port (
      t,s, clk : in STD_LOGIC;
      q : out STD_LOGIC
    );
  end component;

  -- Signals
  signal t_tb : STD_LOGIC := '0';
  signal s_tb : STD_LOGIC := '0';
  signal clk_tb : STD_LOGIC := '0';
  signal q_tb : STD_LOGIC;


begin
  -- Instantiate the D Flip-Flop
  uut: t_drff
    port map (
      t => t_tb,
      s => s_tb,
      clk => clk_tb,
      q => q_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            t_tb <= '0'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            t_tb <= '1'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;

            s_tb <= '0'; wait for 2 ns;
            s_tb <= '1'; wait for 0 ns;

            t_tb <= '1'; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            s_tb <= '0'; wait for 2 ns;
            s_tb <= '1'; wait for 0 ns;

            t_tb <= '0'; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;
        end loop;
        wait;
    end process;

end Behavioral;