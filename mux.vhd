
entity mux is
    port (
      A,B,C,D: in bit_vector(3 downto 0);
      S: in bit_vector(1 downto 0);
      X: out bit_vector(3 downto 0)
    );
end mux;

architecture Behavioral of mux is
begin
  X<= A when (S="00") else
      B when (S="01") else
      C when (S="10") else
      D;


end Behavioral;