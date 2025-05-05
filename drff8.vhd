
entity drff8 is
  port (
    d: in bit_vector(7 downto 0);
    clk: in bit;
    q: out bit_vector(7 downto 0)
  );
end drff8;

architecture Behavioral of drff8 is
begin
  process(clk)
  begin
    if (clk'event and clk='1') then
      q<=d;
    end if;
  end process;
end Behavioral;