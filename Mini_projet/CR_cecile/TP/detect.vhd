library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detect is
	Port ( input : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		clock : in STD_LOGIC;
		detectcar : out STD_LOGIC);
end entity;

architecture arch of detect is
signal dernier_etat : std_logic := '0';
begin
	process(clock, reset_n)
	begin
		if reset_n = '0' then
			detectcar <= '0';
		elsif rising_edge(clock) 
		then
			dernier_etat <= input;
			detectcar <= input and not dernier_etat;
		end if;
	end process;
end architecture;