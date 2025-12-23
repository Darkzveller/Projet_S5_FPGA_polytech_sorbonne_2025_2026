library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_registre is
end tb_registre;

architecture test of tb_registre is
    signal clk, rst_n, enable : std_logic := '0';
    signal D, Q : std_logic_vector(3 downto 0) := "0000";
begin
    UUT: entity work.registre_changement_parallele port map (clk, rst_n, enable, D, Q);

    clk <= not clk after 5 ps;

    process
    begin
        rst_n <= '0'; wait for 15 ps;
        rst_n <= '1';
        D <= "1010"; enable <= '1'; wait for 10 ps; -- Q = 1010
        enable <= '0'; D <= "1111"; wait for 10 ps; -- Q reste 1010
        wait;
    end process;
end test;