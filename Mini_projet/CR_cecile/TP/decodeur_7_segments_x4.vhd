library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodeur_7_segments_x4 is
    Port (
        input0: in STD_LOGIC_VECTOR(3 downto 0);
        input1: in STD_LOGIC_VECTOR(3 downto 0);
        input2: in STD_LOGIC_VECTOR(3 downto 0);
        input3: in STD_LOGIC_VECTOR(3 downto 0);
        afficheur_7_segments_0 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_1 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_2 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_3 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000");
end entity;

architecture arch of decodeur_7_segments_x4 is
begin
    afficheur_0 : entity work.decodeur_7_segments port map
    (
        input => input0,
        afficheur_7_segments => afficheur_7_segments_0);
    
    afficheur_1: entity work.decodeur_7_segments port map
    (
        input => input1,
        afficheur_7_segments => afficheur_7_segments_1);

    afficheur_2 : entity work.decodeur_7_segments port map
    (
        input => input2,
        afficheur_7_segments => afficheur_7_segments_2);

    afficheur_3 : entity work.decodeur_7_segments port map
    (
        input => input3,
        afficheur_7_segments => afficheur_7_segments_3);
    
end architecture;

