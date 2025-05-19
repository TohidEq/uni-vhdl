
entity mux_tb is
end mux_tb;

architecture Behavioral of mux_tb is
    -- Testbench signals
    signal A : bit_vector(3 downto 0);
    signal B : bit_vector(3 downto 0);
    signal C : bit_vector(3 downto 0);
    signal D : bit_vector(3 downto 0);
    signal S : bit_vector(1 downto 0);
    signal X : bit_vector(3 downto 0);

    -- Component declaration
    component mux
        port (
            A : in bit_vector(3 downto 0);
            B : in bit_vector(3 downto 0);
            C : in bit_vector(3 downto 0);
            D : in bit_vector(3 downto 0);
            S : in bit_vector(1 downto 0);
            X : out bit_vector(3 downto 0)
        );
    end component;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: mux port map (
        A => A,
        B => B,
        C => C,
        D => D,
        S => S,
        X => X
    );

    -- Stimulus process
    stim_proc: process
    begin
        for i in 1 to 3 loop
            A <= "0001"; B <= "0110"; C <= "0100"; D <= "0010"; S <= "00"; wait for 10 ns;
            A <= "0001"; B <= "0110"; C <= "0100"; D <= "0010"; S <= "01"; wait for 10 ns;
            A <= "0001"; B <= "0110"; C <= "0100"; D <= "0010"; S <= "10"; wait for 10 ns;
            A <= "0001"; B <= "0110"; C <= "0100"; D <= "0010"; S <= "11"; wait for 10 ns;
            A <= "0011"; B <= "0010"; C <= "0101"; D <= "0110"; S <= "00"; wait for 10 ns;
            A <= "0011"; B <= "0010"; C <= "0101"; D <= "0110"; S <= "01"; wait for 10 ns;
            A <= "0011"; B <= "0010"; C <= "0101"; D <= "0110"; S <= "10"; wait for 10 ns;
            A <= "0011"; B <= "0010"; C <= "0101"; D <= "0110"; S <= "11"; wait for 10 ns;
        end loop;
        wait;
    end process;
end Behavioral;
