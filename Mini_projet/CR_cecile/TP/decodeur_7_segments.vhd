library ieee;
use ieee.std_logic_1164.all;

entity decodeur_7_segments is
    port (
        input: in STD_LOGIC_VECTOR(3 downto 0);
        afficheur_7_segments : out STD_LOGIC_VECTOR(6 downto 0) := "0000000"
    );
end entity;

architecture arch of decodeur_7_segments is
begin
    process (input)
    begin
        case (input) is
            when x"0" => afficheur_7_segments <= "1111110";
            when x"1" => afficheur_7_segments <= "0110000";
            when x"2" => afficheur_7_segments <= "1101101";
            when x"3" => afficheur_7_segments <= "1111001";
            when x"4" => afficheur_7_segments <= "0110011";
            when x"5" => afficheur_7_segments <= "1011011";
            when x"6" => afficheur_7_segments <= "1011111";
            when x"7" => afficheur_7_segments <= "1110000";
            when x"8" => afficheur_7_segments <= "1111111";
            when x"9" => afficheur_7_segments <= "1111011";
            when others => afficheur_7_segments <= "0000000";
        end case;
    end process;
end architecture;