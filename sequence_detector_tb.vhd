library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity sequence_detector_tb is
end sequence_detector_tb ;

architecture Behavioral of sequence_detector_tb is
  -- Component declaration
  component sequence_detector
    port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        x   : in STD_LOGIC;
        z   : out STD_LOGIC
    );
  end component;

      signal clk_tb: std_logic :='0';
      signal rst_tb: std_logic :='0';
      signal x_tb: std_logic :='0';
      signal z_tb: std_logic;

begin
  uut: sequence_detector
    port map (
      clk => clk_tb,
      rst => rst_tb,
      x => x_tb,
      z => z_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
            wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '0'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '0'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;

            x_tb <= '1'; 
            clk_tb <= '1' ; wait for 50 ns;
            clk_tb <= '0' ;wait for 50 ns;





            -- 1011
        wait;
    end process;

end Behavioral;
