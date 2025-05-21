library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtract_tb is
end subtract_tb;

architecture Behavioral of subtract_tb is
    component subtract is
        port (
            X, Y, Bin: in STD_LOGIC;
            Diff, Bout: out STD_LOGIC
        );
    end component;

    signal X_tb, Y_tb, Bin_tb: STD_LOGIC := '0';
    signal Diff_tb, Bout_tb: STD_LOGIC;

begin
    uut: subtract port map (
        X => X_tb,
        Y => Y_tb,
        Bin => Bin_tb,
        Diff => Diff_tb,
        Bout => Bout_tb
    );

    stimulus: process
    begin
        -- Test case 1: 0 - 0 with no borrow
        X_tb <= '0'; Y_tb <= '0'; Bin_tb <= '0';
        wait for 10 ns;

        -- Test case 2: 0 - 1 with no borrow (should borrow)
        X_tb <= '0'; Y_tb <= '1'; Bin_tb <= '0';
        wait for 10 ns;

        -- Test case 3: 1 - 0 with no borrow
        X_tb <= '1'; Y_tb <= '0'; Bin_tb <= '0';
        wait for 10 ns;

        -- Test case 4: 1 - 1 with no borrow
        X_tb <= '1'; Y_tb <= '1'; Bin_tb <= '0';
        wait for 10 ns;

        -- Test case 5: 0 - 0 with borrow in
        X_tb <= '0'; Y_tb <= '0'; Bin_tb <= '1';
        wait for 10 ns;

        -- Test case 6: 0 - 1 with borrow in
        X_tb <= '0'; Y_tb <= '1'; Bin_tb <= '1';
        wait for 10 ns;

        -- Test case 7: 1 - 0 with borrow in
        X_tb <= '1'; Y_tb <= '0'; Bin_tb <= '1';
        wait for 10 ns;

        -- Test case 8: 1 - 1 with borrow in
        X_tb <= '1'; Y_tb <= '1'; Bin_tb <= '1';
        wait for 10 ns;

        wait;
    end process;
end Behavioral;