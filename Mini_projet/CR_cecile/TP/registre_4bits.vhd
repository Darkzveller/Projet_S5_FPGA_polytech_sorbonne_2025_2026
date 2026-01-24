library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registre_4bits is
	Port ( enable : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		clock : in STD_LOGIC;
		input: in STD_LOGIC_VECTOR(3 downto 0);
		output : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture arch of registre_4bits is
begin
		bascule_d0 : entity work.bascule_d port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => input(0),
			output => output(0));
		bascule_d1 : entity work.bascule_d port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => input(1),
			output => output(1)
		);
		bascule_d2 : entity work.bascule_d port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => input(2),
			output => output(2));
		bascule_d3 : entity work.bascule_d port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => input(3),
			output => output(3));
end architecture;