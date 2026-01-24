library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bascule_d is
	Port ( enable : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		clock : in STD_LOGIC;
		input: in STD_LOGIC;
		output : out STD_LOGIC);
end entity;

architecture arch of bascule_d is
begin
	process(clock, reset_n)
	begin
		if reset_n = '0' then
			output <= '0';
		elsif rising_edge(clock) 
		then
			if enable = '1' then
				output <= input;
			end if;
		end if;
	end process;
end architecture;