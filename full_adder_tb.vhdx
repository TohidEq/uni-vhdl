library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture Behavioral of full_adder_tb is
    -- Testbench signals
    signal A : STD_LOGIC;
    signal B : STD_LOGIC;
    signal Cin : STD_LOGIC;
    signal Sum : STD_LOGIC;
    signal Cout : STD_LOGIC;

    -- Component declaration
    component full_adder
        port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Cin : in STD_LOGIC;
            Sum : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: full_adder port map (
        A => A,
        B => B,
        Cin => Cin,
        Sum => Sum,
        Cout => Cout
    );

    -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            A <= '0';             B <= '0';             Cin <= '0'; wait for 10 ns;
            A <= '0';             B <= '0';             Cin <= '1'; wait for 10 ns;
            A <= '0';             B <= '1';             Cin <= '0'; wait for 10 ns;
            A <= '0';             B <= '1';             Cin <= '1'; wait for 10 ns;
            A <= '1';             B <= '0';             Cin <= '0'; wait for 10 ns;
            A <= '1';             B <= '0';             Cin <= '1'; wait for 10 ns;
            A <= '1';             B <= '1';             Cin <= '0'; wait for 10 ns;
            A <= '1';             B <= '1';             Cin <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;
end Behavioral;
