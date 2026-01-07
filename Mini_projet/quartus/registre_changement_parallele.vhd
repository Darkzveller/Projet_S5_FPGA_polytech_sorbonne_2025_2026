library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registre_changement_parallele is
    Port ( 
        clk    : in  STD_LOGIC;
        rst_n  : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        D      : in  STD_LOGIC_VECTOR(3 downto 0); 
        Q      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture Structural of registre_changement_parallele is
begin

    -- On branche les 4 bascules D une par une
    -- C'est ce qu'on appelle l'instanciation manuelle
    
    bit0 : entity work.bascule_D
        port map (clk => clk, rst_n => rst_n, enable => enable, D => D(0), Q => Q(0));

    bit1 : entity work.bascule_D
        port map (clk => clk, rst_n => rst_n, enable => enable, D => D(1), Q => Q(1));

    bit2 : entity work.bascule_D
        port map (clk => clk, rst_n => rst_n, enable => enable, D => D(2), Q => Q(2));

    bit3 : entity work.bascule_D
        port map (clk => clk, rst_n => rst_n, enable => enable, D => D(3), Q => Q(3));

end architecture;