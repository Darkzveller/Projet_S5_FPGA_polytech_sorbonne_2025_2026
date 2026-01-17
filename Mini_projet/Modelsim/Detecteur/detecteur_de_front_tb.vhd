library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_detecteur is
end tb_detecteur;

architecture BENCH of tb_detecteur is

    signal clk, rst_n, KEY0, Detectar : std_logic := '0';

begin

    -- Instanciation du DUT
    UUT: entity work.detecteur_de_front
        port map (
            clk     => clk,
            rst_n   => rst_n,
            KEY0    => KEY0,
            Detectar=> Detectar
        );

    -- Génération de l'horloge
    clk <= not clk after 5 ps;

    -- Process principal avec tests et assertions
    process
    begin
        -- Test 1 : Reset actif
        rst_n <= '0';
        KEY0 <= '1';
        wait for 15 ps;
        rst_n <= '1';

        -- Test 2 : Front montant KEY0
        KEY0 <= '1'; wait for 20 ps;
        KEY0 <= '0'; wait for 20 ps;
        KEY0 <= '1'; wait for 20 ps;
        KEY0 <= '0'; wait for 10 ps;

        wait;
    end process;

end BENCH;
