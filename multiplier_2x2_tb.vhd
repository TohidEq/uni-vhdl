library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplier_2x2_tb is
end multiplier_2x2_tb;

architecture Behavioral of multiplier_2x2_tb is

    component multiplier_2x2 is
        port (
            a      : in  unsigned(1 downto 0);
            b      : in  unsigned(1 downto 0);
            result : out unsigned(3 downto 0)
        );
    end component;

    signal a_tb      : unsigned(1 downto 0) := (others => '0');
    signal b_tb      : unsigned(1 downto 0) := (others => '0');
    signal result_tb : unsigned(3 downto 0);

    constant TEST_PERIOD : time := 10 ns;

begin

    uut: multiplier_2x2
        port map (
            a      => a_tb,
            b      => b_tb,
            result => result_tb
        );

    stim_proc: process
    begin
        for i in 0 to 3 loop  -- a from 0 to 3 (2-bit)
            for j in 0 to 3 loop -- b from 0 to 3 (2-bit)
                a_tb <= conv_unsigned(i, 2);
                b_tb <= conv_unsigned(j, 2);
                wait for TEST_PERIOD;
            end loop;
        end loop;

        wait;
    end process;

end Behavioral;
