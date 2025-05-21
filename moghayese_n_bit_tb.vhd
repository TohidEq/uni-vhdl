library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity moghayese_n_bit_tb is
end moghayese_n_bit_tb;

architecture test of moghayese_n_bit_tb is

  -- Component Declaration
  component moghayese_n_bit
    port (
      a,b: in std_logic_vector(4 downto 0);
      greater: out STD_LOGIC;
      lower: out STD_LOGIC;
      equal: out STD_LOGIC
    );
  end component;

  -- Signals for DUT
  signal a_tb, b_tb : std_logic_vector(4 downto 0);
  signal greater_tb, lower_tb, equal_tb : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: moghayese_n_bit
    port map (
      a => a_tb,
      b => b_tb,
      greater => greater_tb,
      lower => lower_tb,
      equal => equal_tb
    );

  -- Stimulus Process
  stim_proc: process
  begin
    for i in 0 to 31 loop
      for j in 0 to 31 loop
        a_tb <= conv_std_logic_vector(i, 5);
        b_tb <= conv_std_logic_vector(j, 5);
        wait for 10 ns;
      end loop;
    end loop;

    wait;
  end process;

end test;
