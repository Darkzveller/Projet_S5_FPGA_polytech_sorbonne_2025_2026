library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_decodeur_7_seg is
end entity;

architecture Behavioral of tb_decodeur_7_seg is

    -- Déclaration des signaux pour connecter le décodeur en entrée et en sortie
    signal tb_entree  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal tb_segments : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- Instanciation du décodeur (normalement on branche l'appareil)
    UUT : entity work.decodeur_7_seg
        port map (
            entree_4bits => tb_entree,
            segments     => tb_segments
        );

    -- Le processus de test
    process
    begin
        -- Test du chiffre 0
        tb_entree <= "0000";
        wait for 20 ps;
        
        -- Test du chiffre 1
        tb_entree <= "0001";
        wait for 20 ps;
        
        -- Test du chiffre 2
        tb_entree <= "0010";
        wait for 20 ps;
        
        -- Test du chiffre 9
        tb_entree <= "1001";
        wait for 20 ps;

        -- Test d'une lettre (A)
        tb_entree <= "1010";
        wait for 20 ps;

        -- Fin du test (on attends a l'infini)
        wait;
    end process;

end architecture;