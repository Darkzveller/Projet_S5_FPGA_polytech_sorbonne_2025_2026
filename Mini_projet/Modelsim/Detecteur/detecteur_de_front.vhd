library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity detecteur_de_front is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           KEY0: in STD_LOGIC;
           Detectar : out STD_LOGIC);
end entity;

architecture Behavioral of detecteur_de_front is

signal KEY0_prec : STD_LOGIC;
begin

process(clk, rst_n)

begin

if rst_n = '0' then
    KEY0_prec <= '0';
    Detectar <= '0';

elsif rising_edge(clk) then

    if KEY0 = '0' and KEY0_prec = '1' then
        Detectar <= '1'; 
    else 
        Detectar <= '0';
    end if;
    KEY0_prec <= KEY0; 

end if;

end process;

end architecture;