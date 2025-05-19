library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity moghayese_tb is
end moghayese_tb;

architecture Behavioral of moghayese_tb is
  -- Component declaration
  component moghayese
    port (
      a, b : in std_logic_vector(7 downto 0);
      q : out STD_LOGIC
    );
  end component;

  -- Signals
  signal a_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal b_tb : std_logic_vector(7 downto 0) := (others => '0');
  signal q_tb : STD_LOGIC;

  -- Test period
  constant TEST_PERIOD : time := 10 ns;

begin
  -- Instantiate the comparator
  uut: moghayese
    port map (
      a => a_tb,
      b => b_tb,
      q => q_tb
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Test case 1: a = b (all zeros, q should be "11111111")
    a_tb <= "00000000";
    b_tb <= "00000000";
    wait for TEST_PERIOD;

    -- Test case 2: a = b (all ones, q should be "11111111")
    a_tb <= "11111111";
    b_tb <= "11111111";
    wait for TEST_PERIOD;

    -- Test case 3: a ≠ b (small difference, q should be "00000000")
    a_tb <= "10101010";
    b_tb <= "10101011";
    wait for TEST_PERIOD;

    -- Test case 4: a ≠ b (large difference, q should be "00000000")
    a_tb <= "11110000";
    b_tb <= "00001111";
    wait for TEST_PERIOD;

    -- Test case 5: a = b (random equal values, q should be "11111111")
    a_tb <= "11001100";
    b_tb <= "11001100";
    wait for TEST_PERIOD;

    -- Test case 6: a ≠ b (single bit difference, q should be "00000000")
    a_tb <= "00000001";
    b_tb <= "00000000";
    wait for TEST_PERIOD;

    -- Test case 7: Rapid input changes (test sensitivity to a and b)
    a_tb <= "10101010";
    b_tb <= "10101010";
    wait for TEST_PERIOD/2;
    b_tb <= "10101011";
    wait for TEST_PERIOD/2;

    -- Test case 8: Edge case (a = b with alternating bits)
    a_tb <= "01010101";
    b_tb <= "01010101";
    wait for TEST_PERIOD;

    -- Test case 9: Another unequal case
    a_tb <= "11111110";
    b_tb <= "11111111";
    wait for TEST_PERIOD;

    -- End simulation
    wait;
  end process;

end Behavioral;