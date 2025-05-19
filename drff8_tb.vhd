entity drff8_tb is
end drff8_tb;

architecture Behavioral of drff8_tb is
  -- Component declaration
  component drff8
    port (
      d: in bit_vector(7 downto 0);
      clk: in bit;
      q : out bit_vector(7 downto 0)
    );
  end component;

  -- Signals
  signal d_tb : bit_vector(7 downto 0) := "00000000";
  signal clk_tb : bit :='0';
  signal q_tb : bit_vector(7 downto 0) := "00000000";


begin
  -- Instantiate the D Flip-Flop
  uut: drff8
    port map (
      d => d_tb,
      clk => clk_tb,
      q => q_tb
    );

  -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            d_tb <= "01100111"; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            d_tb <= "00011101"; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;

            d_tb <= "00000111"; wait for 10 ns;
            clk_tb<= '1'; wait for 3 ns;

            d_tb <= "00000011"; wait for 10 ns;
            clk_tb<= '0'; wait for 3 ns;
        end loop;
        wait;
    end process;

end Behavioral;