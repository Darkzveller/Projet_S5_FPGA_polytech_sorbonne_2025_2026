library ieee;
use ieee.std_logic_1164.all;

entity comparateur_4bits is
    port (
        input : in std_logic_vector(3 downto 0);
        code : in std_logic_vector(3 downto 0);
        output : out std_logic := '0'
    );
end entity;

architecture arch of comparateur_4bits is

begin
    output <= '1' when input = code else '0';
end architecture;