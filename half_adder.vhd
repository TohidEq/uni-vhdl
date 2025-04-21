

entity half_adder is
    port (
        A, B: in bit;
        Sum, Cout : out bit
    );
end half_adder;

architecture Behavioral of half_adder is
begin
    Sum <= A xor B;
    Cout <= A and B;
end Behavioral;