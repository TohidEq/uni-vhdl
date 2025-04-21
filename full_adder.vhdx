library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    port (
        A, B, Cin : in STD_LOGIC;
        Sum, Cout : out STD_LOGIC
    );
end full_adder;

architecture Behavioral of full_adder is
begin
    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (B and Cin) or (A and Cin);
end Behavioral;