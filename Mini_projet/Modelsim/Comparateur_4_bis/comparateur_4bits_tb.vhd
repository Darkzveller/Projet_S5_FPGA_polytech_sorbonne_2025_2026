library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_comparateur is
end entity;

architecture Behavioral of tb_comparateur is
    signal s_data1, s_data2 : STD_LOGIC_VECTOR(3 downto 0);
    signal s_ok             : STD_LOGIC;
begin
    UUT : entity work.comparateur_4bits
        port map ( Datautil => s_data1, Dataamd => s_data2, CompOK => s_ok );

    process
    begin
        -- Test 1 : Différents
        s_data1 <= "1010"; s_data2 <= "0000"; wait for 20 ps;
        -- Test 2 : Égaux
        s_data1 <= "1100"; s_data2 <= "1100"; wait for 20 ps;
        -- Test 3 : Différents à nouveau
        s_data1 <= "1100"; s_data2 <= "1111"; wait for 20 ps;
        wait;
    end process;
end architecture;