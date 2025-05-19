library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity rsff_tb is
end rsff_tb;

architecture Behavioral of rsff_tb is
  -- Component declaration
  component rsff
    port (
      R, S : in STD_LOGIC;
      Q : inout STD_LOGIC
    );
  end component;

  -- Signals
  signal R_tb : STD_LOGIC := '0';
  signal S_tb : STD_LOGIC := '0';
  signal Q_tb : STD_LOGIC;

begin
  -- Instantiate the RS Flip-Flop
  uut: rsff
    port map (
      R => R_tb,
      S => S_tb,
      Q => Q_tb
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Test case 1: S=0, R=1 (Set: Q should be 1)
    S_tb <= '0';
    R_tb <= '1';
    wait for 10 ns;

    -- Test case 2: S=1, R=0 (Reset: Q should be 0)
    S_tb <= '1';
    R_tb <= '0';
    wait for 10 ns;

    -- Test case 3: S=1, R=1 (Hold: Q should retain previous value)
    S_tb <= '1';
    R_tb <= '1';
    wait for 10 ns;

    -- Test case 4: S=0, R=0 (Invalid state, but test for completeness)
    S_tb <= '0';
    R_tb <= '0';
    wait for 10 ns;

    -- Test case 5: Another sequence to verify hold
    S_tb <= '1';
    R_tb <= '1';
    wait for 10 ns;

    -- End simulation
    wait;
  end process;

end Behavioral;