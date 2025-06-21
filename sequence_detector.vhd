library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sequence_detector is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        x   : in STD_LOGIC;
        z   : out STD_LOGIC
    );
end;

architecture arch of sequence_detector is
    type state_type is (S0, S1, S10, S101, S1011);
    signal current_state, next_state : state_type;
begin

    process(clk, rst)
    begin
        if rst = '1' then
            current_state <= S0;
        elsif (clk'event and clk = '1') then
            current_state <= next_state;
        end if;
    end process;

    process(current_state, x)
    begin
        case current_state is
            when S0 =>
                if x = '0' then
                    next_state <= S0;
                else
                    next_state <= S1;
                end if;

            when S1 =>
                if x = '0' then
                    next_state <= S10;
                else
                    next_state <= S1;
                end if;

            when S10 =>
                if x = '0' then
                    next_state <= S0;
                else
                    next_state <= S101;
                end if;

            when S101 =>
                if x = '0' then
                    next_state <= S10;
                else
                    next_state <= S1011;
                end if;

            when S1011 =>
                if x = '0' then
                    next_state <= S10;
                else
                    next_state <= S1;
                end if;
        end case;
    end process;

    process(current_state)
    begin
        case current_state is
            when S1011 =>
                z <= '1';
            when others =>
                z <= '0';
        end case;
    end process;

end;


