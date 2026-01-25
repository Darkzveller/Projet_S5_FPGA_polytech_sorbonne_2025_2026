library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparateur_4bits is
    Port ( 
        Datautil : in  STD_LOGIC_VECTOR(3 downto 0); -- Valeur saisie
        Dataamd  : in  STD_LOGIC_VECTOR(3 downto 0); -- Valeur de référence (code secret)
        CompOK   : out STD_LOGIC                     -- '1' si égal, '0' sinon
    );
end entity;

architecture Behavioral of comparateur_4bits is
begin
    -- La sortie CompOK prend la valeur '1' suelement si les deux entrées sont égales
    CompOK <= '1' when (Datautil = Dataamd) else '0';
end architecture;