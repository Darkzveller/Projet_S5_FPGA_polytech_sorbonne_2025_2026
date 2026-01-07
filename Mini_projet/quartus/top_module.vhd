library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( 
        clk      : in  STD_LOGIC;
        rst_n    : in  STD_LOGIC;
        KEY0     : in  STD_LOGIC;
        Busint   : in  STD_LOGIC_VECTOR(3 downto 0);
        HEX0 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX1 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX2 : out STD_LOGIC_VECTOR(6 downto 0);
        HEX3 : out STD_LOGIC_VECTOR(6 downto 0);
        Ouverture : out STD_LOGIC);
end top_module;

architecture Structural of top_module is
    -- Signaux pour relier les boîtes entre elles
    signal detect_front : STD_LOGIC;
    signal q1, q2, q3, q4 : STD_LOGIC_VECTOR(3 downto 0);
    signal buscode_interne : STD_LOGIC_VECTOR(15 downto 0);
begin

    -- Instance du détecteur de front
    U_DET : entity work.detecteur_de_front
        port map (
            clk      => clk,
            rst_n    => rst_n,
            KEY0     => KEY0,
            Detectar => detect_front
        );

    -- Instanciation des 4 registres pour le décalage
    -- REG1 reçoit l'entrée en premier
    REG1 : entity work.registre_changement_parallele
        port map (clk => clk, rst_n => rst_n, enable => detect_front, D => Busint, Q => q1);

    -- REG2 reçoit ce qui sort de REG1
    REG2 : entity work.registre_changement_parallele
        port map (clk => clk, rst_n => rst_n, enable => detect_front, D => q1, Q => q2);

    -- REG3 reçoit ce qui sort de REG2
    REG3 : entity work.registre_changement_parallele
        port map (clk => clk, rst_n => rst_n, enable => detect_front, D => q2, Q => q3);

    -- REG4 reçoit ce qui sort de REG3
    REG4 : entity work.registre_changement_parallele
        port map (clk => clk, rst_n => rst_n, enable => detect_front, D => q3, Q => q4);

    -- On regroupe tout pour la sortie 16 bits
    buscode_interne <= q4 & q3 & q2 & q1;
    -- On appelle le comparateur 16bits

    U_COMP : entity work.comparateur_16bits
        port map (buscode_interne, ouverture);

    -- HEX0 : affiche les bits 0 à 3 (le dernier chiffre saisi)
    AFF0 : entity work.decodeur_7_seg
        port map ( entree_4bits => q1, segments => HEX0 );
    
    -- HEX1 : affiche les bits 4 à 7
    AFF1 : entity work.decodeur_7_seg
        port map ( entree_4bits => q2, segments => HEX1 );
    
    -- HEX2 : affiche les bits 8 à 11
    AFF2 : entity work.decodeur_7_seg
        port map ( entree_4bits => q3, segments => HEX2 );
    
    -- HEX3 : affiche les bits 12 à 15 (le premier chiffre saisi)
    AFF3 : entity work.decodeur_7_seg
        port map ( entree_4bits => q4, segments => HEX3 );
end architecture;