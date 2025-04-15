library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    port (
        A, B : in STD_LOGIC;
        Sum, Carry : out STD_LOGIC
    );
end half_adder;

architecture Behavioral of half_adder is
begin
    Sum <= A xor B;
    Carry <= A and B;
end Behavioral;