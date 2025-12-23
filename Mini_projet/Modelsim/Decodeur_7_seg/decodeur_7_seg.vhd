library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodeur_7_seg is
    Port ( 
        entree_4bits : in  STD_LOGIC_VECTOR(3 downto 0);
        segments     : out STD_LOGIC_VECTOR(6 downto 0) -- g, f, e, d, c, b, a
    );
end entity;

architecture Behavioral of decodeur_7_seg is
begin
    -- On utilise un "with...select" pour faire la table de correspondance
    -- C'est la méthode la plus simple pour un débutant (comme un tableau)
    -- L'ordre des segments en sortie : "gfedcba"
    -- '0' = Allumé, '1' = Éteint (Logique pour carte DE10-Lite)
    
    with entree_4bits select
        segments <= "1000000" when "0000", -- 0
                    "1111001" when "0001", -- 1
                    "0100100" when "0010", -- 2
                    "0110000" when "0011", -- 3
                    "0011001" when "0100", -- 4
                    "0010010" when "0101", -- 5
                    "0000010" when "0110", -- 6
                    "1111000" when "0111", -- 7
                    "0000000" when "1000", -- 8
                    "0010000" when "1001", -- 9
                    "0001000" when "1010", -- A
                    "0000011" when "1011", -- b
                    "1000110" when "1100", -- C
                    "0100001" when "1101", -- d
                    "0000110" when "1110", -- E
                    "0001110" when "1111", -- F
                    "1111111" when others; -- Éteint par sécurité
end architecture;