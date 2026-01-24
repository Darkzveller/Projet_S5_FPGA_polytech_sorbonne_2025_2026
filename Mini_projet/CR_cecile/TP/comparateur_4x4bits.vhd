library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparateur_4x4bits is
    Port ( input : in std_logic_vector(15 downto 0);
        code : in std_logic_vector(15 downto 0);
        output : out std_logic := '0');
end entity;

architecture arch of comparateur_4x4bits is
    signal output_x4 : std_logic_vector(3 downto 0) := "0000";
begin
    comparateur_4bits_0 : entity work.comparateur_4bits port map
    (
        input => input(3 downto 0),
        code => code(3 downto 0),
        output => output_x4(0));
    
    comparateur_4bits_1: entity work.comparateur_4bits port map
    (
        input => input(7 downto 4),
        code => code(7 downto 4),
        output => output_x4(1));
    
    comparateur_4bits_2 : entity work.comparateur_4bits port map
    (
        input => input(11 downto 8),
        code => code(11 downto 8),
        output => output_x4(2));
    
    comparateur_4bits_3 : entity work.comparateur_4bits port map
    (
        input => input(15 downto 12),
        code => code(15 downto 12),
        output => output_x4(3));
    
    output <= '1' when output_x4 = "1111" else '0';
end architecture;