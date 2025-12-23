library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparateur_16bits is
end entity;

architecture Behavioral of tb_comparateur_16bits is
    signal tb_bus       : STD_LOGIC_VECTOR(15 downto 0);
    signal tb_ouverture : STD_LOGIC;
begin
    UUT : entity work.comparateur_16bits
        port map ( Buscode => tb_bus, ouverture => tb_ouverture );

    process
    begin
        -- Test 1 : Mauvais code (ex: 8421)
        tb_bus <= "1000010000100001"; 
        wait for 20 ps;

        -- Test 2 : Bon code (1234 en hexadécimal -> 0001 0010 0011 0100)
        tb_bus <= "0001001000110100"; 
        wait for 20 ps;
        
        wait;
    end process;
end architecture;