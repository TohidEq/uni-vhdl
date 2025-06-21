library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm2_behavioral_tb is
end entity;

architecture Behavioral of fsm2_behavioral_tb is
  -- Component
  component fsm2_behavioral
    port(
        Clock: in std_logic;
        Reset : in std_logic;
        Din   : in std_logic;
        Dout  : out std_logic
    );
  end component;

  -- Signals
signal clk_tb: STD_LOGIC := '0';
  signal rst_tb: STD_LOGIC := '0';
  signal din_tb: STD_LOGIC := '0';

  signal dout_tb: STD_LOGIC;

begin
  uut:fsm2_behavioral
    port map(
      Clock=>clk_tb ,
      Reset=>rst_tb ,
      Din=>din_tb ,
      Dout=>dout_tb
            );


  stim_clk: process
  begin
    for i in 1 to 10 loop
      clk_tb <= '0'; 
      wait for 50 ns;

    
      clk_tb <= '1'; 
      wait for 50 ns;

    end loop;
    wait;
  end process;

  stim_proc: process
  begin
    
    din_tb <= '0';
    wait for 75 ns;

    din_tb <= '1';
    wait for 25 ns;
    wait for 25 ns;
 
    din_tb <= '0';
    wait for 25 ns;   
    wait for 25 ns;   
    wait for 25 ns;   
 
    din_tb <= '1';
    wait for 25 ns;   



    wait;
  end process;
end architecture;

