library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_bascule_D is
end tb_bascule_D;

architecture test of tb_bascule_D is
    signal clk, rst_n, D, enable, Q : std_logic := '0';
begin
    UUT: entity work.bascule_D port map (clk, rst_n, D, enable, Q);

    -- Génération de l'horloge
    clk <= not clk after 5 ps;

    process
    begin
        rst_n <= '0'; wait for 15 ps;
        rst_n <= '1'; 
        D <= '1'; enable <= '0'; wait for 10 ps; -- Ne doit pas changer
        enable <= '1'; wait for 10 ps;           -- Q devient '1'
        D <= '0'; wait for 10 ps;                -- Q devient '0'
        enable <= '0'; D <= '1'; wait for 10 ps; -- Ne doit pas changer
        wait;
    end process;
end test;