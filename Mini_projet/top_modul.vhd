library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk    : in  STD_LOGIC;
           rst_n  : in  STD_LOGIC;
           KEY0   : in  STD_LOGIC;
           D      : in  STD_LOGIC;
           Q      : out STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

    signal detect_front : STD_LOGIC;

begin

 U1 : detecteur_inst : entity work.detecteur_de_front
        Port map (
            clk      => clk,
            rst_n    => rst_n,
            KEY0     => KEY0,
            Detectar => detect_front
        );

 U2 : bascule_inst : entity work.bascule_D
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            D      => D,
            enable => detect_front,  
            Q      => Q
        );

end Behavioral;
