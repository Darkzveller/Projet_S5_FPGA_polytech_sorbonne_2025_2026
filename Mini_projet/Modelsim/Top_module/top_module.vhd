library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( 
        clk      : in  STD_LOGIC;
        rst_n    : in  STD_LOGIC;
        KEY0     : in  STD_LOGIC;
        Busint   : in  STD_LOGIC_VECTOR(3 downto 0); -- Entrée 4 bits
        Buscode  : out STD_LOGIC_VECTOR(15 downto 0) -- Sortie finale 16 bits
    );
end top_module;

architecture Behavioral of top_module is

    -- Signaux internes pour relier les composants
    signal detect_front : STD_LOGIC;
    signal q1, q2, q3, q4 : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- U1 : Détecteur de front (Partie 4.1)
    detecteur_inst : entity work.detecteur_de_front
        Port map (
            clk      => clk,
            rst_n    => rst_n,
            KEY0     => KEY0,
            Detectar => detect_front
        );

    -- Ici, on utilise les REGISTRES (Partie 4.3). 
    U_reg1 : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => Busint,
            Q      => q1
        );

    U_reg2 :  entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q1,
            Q      => q2
        );

    U_reg3 : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q2,
            Q      => q3
        );

    U_reg4 :  entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q3,
            Q      => q4
        );

    -- Sortie finale concaténée (Partie 4.4)
    Buscode <= q4 & q3 & q2 & q1;

end Behavioral;