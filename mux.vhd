
entity mux is
    port (
      A,B,C,D: in bit_vector(3 downto 0);
      S: in bit_vector(1 downto 0);
      X: out bit_vector(3 downto 0)
    );
end mux;

architecture Behavioral of mux is
begin


  WITH S SELECT
    X <=  A WHEN "00",
          B WHEN "01",
          C WHEN "10",
          D WHEN OTHERS;


end Behavioral;