library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity serrure_electronique is
    Port (
        input_interrupteurs : in std_logic_vector(3 downto 0);
        input_bouton : in std_logic;
        afficheur_7_segments_0 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_1 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_2 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        afficheur_7_segments_3 : out STD_LOGIC_VECTOR(6 downto 0) := "0000000";
        reset_n : in std_logic;
        clock : in std_logic;
        ouverture : out std_logic:= '0'
    );
end entity;

architecture arch of serrure_electronique is
    signal enable_serrure : std_logic;
    signal code_complet : std_logic_vector(15 downto 0) := x"1234";
    signal input_afficheurs_7_segments_x4 : std_logic_vector(15 downto 0);
begin
    registre_decalage_4x4bits : entity work.registre_decalage_4x4bits port map
    (
        output_register_0 => input_afficheurs_7_segments_x4(3 downto 0),
        output_register_1 => input_afficheurs_7_segments_x4(7 downto 4),
        output_register_2 => input_afficheurs_7_segments_x4(11 downto 8),
        output_register_3 => input_afficheurs_7_segments_x4(15 downto 12),
        input => input_interrupteurs,
        reset_n => reset_n,
        clock => clock,
        enable => enable_serrure
        
    );
    
    decodeur_7_segments_x4: entity work.decodeur_7_segments_x4 port map
    (
        input0 => input_afficheurs_7_segments_x4(3 downto 0),
        input1 => input_afficheurs_7_segments_x4(7 downto 4),
        input2 => input_afficheurs_7_segments_x4(11 downto 8),
        input3 => input_afficheurs_7_segments_x4(15 downto 12),
        --besoin de les spécifier, ou on peux les relier directement à des broches ?
        -- la je spécifie :
        afficheur_7_segments_0 => afficheur_7_segments_0,
        afficheur_7_segments_1 => afficheur_7_segments_1,
        afficheur_7_segments_2 => afficheur_7_segments_2,
        afficheur_7_segments_3 => afficheur_7_segments_3
    );
    
    detect : entity work.detect port map
    (
        reset_n => reset_n,
        clock => clock,
        input => input_bouton,
        detectcar => enable_serrure
    );
    
    comparateur_4x4bits : entity work.comparateur_4x4bits port map
    (
        input => input_afficheurs_7_segments_x4,
        code => code_complet,
        output => ouverture
    );
    
end architecture;