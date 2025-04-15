library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder_tb is
end half_adder_tb;

architecture Behavioral of half_adder_tb is
    -- سیگنال‌های تست‌بنچ
    signal A, B, Sum, Carry : STD_LOGIC;

    -- تعریف کامپوننت نیمه‌جمع‌کننده
    component half_adder
        port (
            A, B : in STD_LOGIC;
            Sum, Carry : out STD_LOGIC
        );
    end component;

begin
    -- اتصال کامپوننت به سیگنال‌ها
    uut: half_adder port map (
        A => A,
        B => B,
        Sum => Sum,
        Carry => Carry
    );

    -- فرآیند تحریک ورودی‌ها
    stim_proc: process
    begin
        for i in 1 to 3 loop
          A <= '0'; B <= '0'; wait for 1 ns;
          A <= '0'; B <= '1'; wait for 1 ns;
          A <= '1'; B <= '0'; wait for 1 ns;
          A <= '1'; B <= '1'; wait for 1 ns;
        end loop;
        wait;
    end process;
end Behavioral;
