library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm2_behavioral is
    port (
        Clock : in std_logic;
        Reset : in std_logic;
        Din   : in std_logic;
        Dout  : out std_logic
    );
end entity;

architecture Behavioral of fsm2_behavioral is
    type state_type is (S0, S1, S2, S3);
    signal current_state: state_type;
    --signal current_state, next_state : state_type;
begin
    -- harekat beyne node ha
    cclock:process(Clock, Reset)
    begin
        if Reset = '1' then
            current_state <= S0;

        elsif rising_edge(Clock) then
          case (current_state)is
            when S0 =>
              if (Din='0') then current_state <= S0;
              else current_state <= S1;
              end if;
            when S1 =>
              if (Din='0') then current_state <= S2;
              else current_state <= S3;
              end if;
            when S2 =>
              if (Din='0') then current_state <= S0;
              else current_state <= S3;
              end if;
            when S3 =>
              if (Din='0') then current_state <= S3;
              else current_state <= S0;
              end if;
          end case;
        end if;
    end process;
    -- khorooji
    output:process(current_state)
    begin
      case (current_state)is
        when S0 =>
          if (Din='0') then Dout<='0';
          else Dout <='1';
          end if;
        when S1 =>
          if (Din='0') then Dout<='1';
          else Dout <='0';
          end if;
        when S2 =>
          if (Din='0') then Dout<='0';
          else Dout <='1';
          end if;
        when S3 =>
          if (Din='0') then Dout<='0';
          else Dout <='1';
          end if;
      end case;
    end process;

end architecture;

