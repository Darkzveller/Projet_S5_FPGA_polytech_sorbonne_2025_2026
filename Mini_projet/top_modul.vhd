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

-- On instancie 4 bascules D en utilisant ta notation
    -- Chaque bascule s'occupe d'un bit du bus D et Q
    
    U_B0 : bit0 : entity work.bascule_D
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            D      => D(0),
            enable => enable,
            Q      => Q(0)
        );

    U_B1 : bit1 : entity work.bascule_D
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            D      => D(1),
            enable => enable,
            Q      => Q(1)
        );

    U_B2 : bit2 : entity work.bascule_D
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            D      => D(2),
            enable => enable,
            Q      => Q(2)
        );

    U_B3 : bit3 : entity work.bascule_D
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            D      => D(3),
            enable => enable,
            Q      => Q(3)
        );

    U_reg1 : reg1_inst : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => Busint,
            Q      => q1
        );

    U_reg2 : reg2_inst : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q1,
            Q      => q2
        );

    U_reg3 : reg3_inst : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q2,
            Q      => q3
        );

    U_reg4 : reg4_inst : entity work.registre_changement_parallele
        Port map (
            clk    => clk,
            rst_n  => rst_n,
            enable => detect_front,
            D      => q3,
            Q      => q4
        );

end Behavioral;
