library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity multiplier_2x2 is
    Port (
        a : in  unsigned(1 downto 0); -- zarb shavande
        b : in  unsigned(1 downto 0); -- zarb konande
        result : out unsigned(3 downto 0)
    );
end multiplier_2x2;

architecture Behavioral of multiplier_2x2 is
begin

    process(a, b)
            -- 4 bit (baraye shift-left daadan)
        variable zarb_shavande : unsigned(3 downto 0);
            -- 4 bit (2 bit dar 2 bit maximum 4 bit 3*3=9 = (11)*(11)=(1001) )
        variable hasel_zarb    : unsigned(3 downto 0);
        variable shifted       : unsigned(3 downto 0);
    begin
        zarb_shavande := (others => '0');
        zarb_shavande(1 downto 0) := a;
        hasel_zarb := (others => '0');

        for i in 0 to 1 loop
            if b(i) = '1' then

                -- Left shift dasti
                if i = 1 then
                    --      [3, 2, 1, 0] (shift left) =>  [2, 1, 0] + '0'
                    shifted := zarb_shavande(2 downto 0) & '0';
                else
                    shifted := zarb_shavande;
                end if;

                hasel_zarb := hasel_zarb + shifted;
            end if;
        end loop;

        result <= hasel_zarb;
    end process;
end Behavioral;