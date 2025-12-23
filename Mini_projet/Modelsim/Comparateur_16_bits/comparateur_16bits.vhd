library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparateur_16bits is
    Port ( 
        Buscode   : in  STD_LOGIC_VECTOR(15 downto 0); -- Le code saisi (4x4 bits)
        ouverture : out STD_LOGIC                      -- '1' si tout est bon
    );
end entity;

architecture Structural of comparateur_16bits is
    -- Signaux internes pour récupérer les sorties CompOK de chaque petit comparateur
    signal ok0, ok1, ok2, ok3 : STD_LOGIC;
begin

    -- Comparateur 0 : compare Buscode(3:0) avec le chiffre '4' (0100)
    comp0 : entity work.comparateur_4bits
        port map ( Datautil => Buscode(3 downto 0), Dataamd => "0100", CompOK => ok0 );

    -- Comparateur 1 : compare Buscode(7:4) avec le chiffre '3' (0011)
    comp1 : entity work.comparateur_4bits
        port map ( Datautil => Buscode(7 downto 4), Dataamd => "0011", CompOK => ok1 );

    -- Comparateur 2 : compare Buscode(11:8) avec le chiffre '2' (0010)
    comp2 : entity work.comparateur_4bits
        port map ( Datautil => Buscode(11 downto 8), Dataamd => "0010", CompOK => ok2 );

    -- Comparateur 3 : compare Buscode(15:12) avec le chiffre '1' (0001)
    comp3 : entity work.comparateur_4bits
        port map ( Datautil => Buscode(15 downto 12), Dataamd => "0001", CompOK => ok3 );

    -- Logique de combinaison : Porte ET
    ouverture <= ok0 and ok1 and ok2 and ok3;

end architecture;