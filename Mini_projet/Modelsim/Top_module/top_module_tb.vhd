library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top_module is
end tb_top_module;

architecture test of tb_top_module is
    -- Signaux de test
    signal clk      : std_logic := '0';
    signal rst_n    : std_logic := '0';
    signal KEY0     : std_logic := '0';
    signal Busint   : std_logic_vector(3 downto 0)  := (others => '0');
    signal Buscode  : std_logic_vector(15 downto 0);

begin

    -- Instanciation du Top Module
    UUT: entity work.top_module
        port map (
            clk     => clk,
            rst_n   => rst_n,
            KEY0    => KEY0,
            Busint  => Busint,
            Buscode => Buscode
        );

    -- Génération de l'horloge (Période de 10 ps)
    clk <= not clk after 5 ps;

    -- Processus de test
    process
    begin
        -- 1. Reset initial
        rst_n <= '0';
        wait for 15 ps;
        rst_n <= '1';
        wait for 10 ps;

        -- 2. Premier chiffre : "0001" (1 en hexadécimal)
        Busint <= "0001";
        KEY0 <= '1'; wait for 20 ps; -- Appui (Détection front)
        KEY0 <= '0'; wait for 20 ps; -- Relâchement

        -- 3. Deuxième chiffre : "0010" (2 en hexadécimal)
        Busint <= "0010";
        KEY0 <= '1'; wait for 20 ps;
        KEY0 <= '0'; wait for 20 ps;

        -- 4. Troisième chiffre : "0100" (4 en hexadécimal)
        Busint <= "0100";
        KEY0 <= '1'; wait for 20 ps;
        KEY0 <= '0'; wait for 20 ps;

        -- 5. Quatrième chiffre : "1000" (8 en hexadécimal)
        Busint <= "1000";
        KEY0 <= '1'; wait for 20 ps;
        KEY0 <= '0'; wait for 20 ps;

        -- À ce stade, Buscode devrait valoir "1000 0100 0010 0001"
        -- soit 0x8421 en hexadécimal.

        wait;
    end process;

end test;