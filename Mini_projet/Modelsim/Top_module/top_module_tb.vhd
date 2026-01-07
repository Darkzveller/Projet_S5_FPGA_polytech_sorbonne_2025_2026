library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module_tb is
end entity;

architecture Behavioral of top_module_tb is
    signal clk       : STD_LOGIC := '0';
    signal rst_n     : STD_LOGIC := '0';
    signal KEY0      : STD_LOGIC := '0';
    signal Busint    : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Buscode   : STD_LOGIC_VECTOR(15 downto 0);
    signal HEX0, HEX1, HEX2, HEX3 : STD_LOGIC_VECTOR(6 downto 0);
    signal Ouverture : STD_LOGIC;

    -- Période de 2000 ps (équivalent à 500 MHz, très rapide mais stable)
    constant clk_period : time := 2000 ps;

begin
    uut: entity work.top_module
        port map (
            clk => clk, rst_n => rst_n, KEY0 => KEY0, Busint => Busint,
            Buscode => Buscode, HEX0 => HEX0, HEX1 => HEX1, HEX2 => HEX2,
            HEX3 => HEX3, Ouverture => Ouverture
        );

    clk_process : process
    begin
        clk <= '0'; wait for clk_period/2;
        clk <= '1'; wait for clk_period/2;
    end process;

    stim_proc: process
    begin		
        rst_n <= '0'; wait for 5000 ps;
        rst_n <= '1'; wait for 5000 ps;

        -- Saisie '1'
        Busint <= "0001"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '2'
        Busint <= "0010"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '3'
        Busint <= "0011"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '4'
        Busint <= "0100"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; 
        
        wait for 20000 ps; -- Attente pour voir l'ouverture

        rst_n <= '0'; wait for 5000 ps;
        rst_n <= '1'; wait for 5000 ps;

        -- Saisie '1'
        Busint <= "1111"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '2'
        Busint <= "0010"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '3'
        Busint <= "0011"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; wait for 4000 ps;

        -- Saisie '4'
        Busint <= "0100"; wait for 2000 ps;
        KEY0 <= '1'; wait for 6000 ps; KEY0 <= '0'; 
        
        wait for 20000 ps; -- Attente pour voir l'ouverture
        wait;
    end process;
    
end architecture;       