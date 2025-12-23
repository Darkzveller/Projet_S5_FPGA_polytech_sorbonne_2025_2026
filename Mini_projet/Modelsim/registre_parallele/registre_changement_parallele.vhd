library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
-- D est mon registre d'entrée sur 4bits
-- Q est mon registre de sortie sur 4bits
entity registre_changement_parallele is
    Port ( clk    : in  STD_LOGIC;
           rst_n  : in  STD_LOGIC;
           enable : in  STD_LOGIC;
           D      : in  STD_LOGIC_VECTOR(3 downto 0); 
           Q      : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture Behavioral of registre_changement_parallele is
signal q_passerelle : STD_LOGIC_VECTOR(3 downto 0);

begin

process(clk, rst_n)
begin
    if rst_n = '0' then
        q_passerelle <= "0000";   
    elsif rising_edge(clk) then
        if enable = '1' then
            q_passerelle <= D; 
            end if;
    end if;
end process;
Q <= q_passerelle;

end architecture;
