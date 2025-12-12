library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bascule_D is
    Port ( clk    : in  STD_LOGIC;
           rst_n  : in  STD_LOGIC;
           D      : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           Q      : out STD_LOGIC);
end entity;

architecture Behavioral of bascule_D is
begin

process(clk, rst_n)
begin
    if rst_n = '0' then
        Q <= '0';  -- remise à zéro asynchrone
    elsif rising_edge(clk) then
        if enable = '1' then
            Q <= D;  -- transfert de D vers Q si enable actif
        else
            Q <= Q;  -- conserve la valeur précédente
        end if;
    end if;
end process;

end architecture;
