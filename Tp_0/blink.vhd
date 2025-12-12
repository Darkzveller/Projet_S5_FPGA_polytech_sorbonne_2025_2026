library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity blink is
    Port ( clk : in STD_LOGIC;
           rst_n : in STD_LOGIC;
           led : out STD_LOGIC;
			  led2 : out STD_LOGIC);
end entity;

architecture Behavioral of blink is

signal count : unsigned(24 downto 0);
signal count2 : unsigned(32 downto 0);
begin

led <= count(24);
led2 <= count2(27);

process(clk, rst_n)

begin

if rst_n = '0' then
    count <= (others => '0');
	 count2 <= (others => '0');
elsif rising_edge(clk) then
    count <= count +1;
	 count2 <= count2 +1 ;

end if;

end process;

end architecture;