library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tamrin_4 is
    Port (
        A1, A2 : in  STD_LOGIC;
        B1, B2 : in  STD_LOGIC;
        D      : in  STD_LOGIC;
        Output : out STD_LOGIC
    );
end tamrin_4;

architecture Behavioral of tamrin_4 is
    signal input_vector : STD_LOGIC_VECTOR(3 downto 0);
begin
    process(A1, A2, B1, B2)
    begin
        input_vector <= A1 & A2 & B1 & B2;

        case input_vector is

            --    A1 A2 B1 B2
            --    0  X  0  0
            --    X  0  0  0

            when "0000" => Output <= '0';
            when "0100" => Output <= '0';
            when "1000" => Output <= '0';
            when others  => Output <= '1';  -- default
        end case;
    end process;
end Behavioral;