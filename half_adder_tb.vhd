
entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    -- Testbench signals
    signal A : bit;
    signal B : bit;
    signal Sum : bit;
    signal Cout : bit;

    -- Component declaration
    component half_adder
        port (
            A : in bit;
            B : in bit;
            Sum : out bit;
            Cout : out bit
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: half_adder port map (
        A => A,
        B => B,
        Sum => Sum,
        Cout => Cout
    );

    -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            A <= '0';             B <= '0'; wait for 10 ns;
            A <= '0';             B <= '1'; wait for 10 ns;
            A <= '1';             B <= '0'; wait for 10 ns;
            A <= '1';             B <= '1'; wait for 10 ns;
        end loop;
        wait;
    end process;
end Behavioral;
