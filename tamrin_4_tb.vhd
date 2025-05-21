library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tamrin_4_tb is
end tamrin_4_tb;

architecture Behavioral of tamrin_4_tb is
    -- Component declaration
    component tamrin_4
        Port (
            A1, A2 : in  STD_LOGIC;
            B1, B2 : in  STD_LOGIC;
            D      : in  STD_LOGIC;
            Output : out STD_LOGIC
        );
    end component;

    -- Signals to connect to the unit under test
    signal A1_tb, A2_tb : STD_LOGIC := '0';
    signal B1_tb, B2_tb : STD_LOGIC := '0';
    signal D_tb         : STD_LOGIC := '0';
    signal Output_tb    : STD_LOGIC;

    constant CLK_PERIOD : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: tamrin_4
        port map (
            A1 => A1_tb,
            A2 => A2_tb,
            B1 => B1_tb,
            B2 => B2_tb,
            D  => D_tb,
            Output => Output_tb
        );

    -- Stimulus process
    stim_proc: process
        variable vec : std_logic_vector(4 downto 0);
    begin
        -- Loop through all 32 combinations of 5 input bits
        for i in 0 to 31 loop
            vec := std_logic_vector(to_unsigned(i, 5));

            A1_tb <= vec(4);
            A2_tb <= vec(3);
            B1_tb <= vec(2);
            B2_tb <= vec(1);
            D_tb  <= vec(0);
            wait for CLK_PERIOD;
        end loop;

        -- End simulation
        wait;
    end process;

end Behavioral;