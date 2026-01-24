library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registre_decalage_4x4bits is
	Port ( enable : in STD_LOGIC;
		reset_n : in STD_LOGIC;
		clock : in STD_LOGIC;
		input: in STD_LOGIC_VECTOR(3 downto 0);
		output_register_0 : out STD_LOGIC_VECTOR(3 downto 0);
		output_register_1 : out STD_LOGIC_VECTOR(3 downto 0);
		output_register_2 : out STD_LOGIC_VECTOR(3 downto 0);
		output_register_3 : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture arch of registre_decalage_4x4bits is
signal internal_0 : std_logic_vector(3 downto 0) := "0000";
signal internal_1 : std_logic_vector(3 downto 0) := "0000";
signal internal_2 : std_logic_vector(3 downto 0) := "0000";
begin
		registre_4bits_0 : entity work.registre_4bits port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => input,
			output => internal_0);
			
		registre_4bits_1: entity work.registre_4bits port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => internal_0,
			output => internal_1);
		
		registre_4bits_2 : entity work.registre_4bits port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => internal_1,
			output => internal_2);
			
		registre_4bits_3 : entity work.registre_4bits port map
		(
			clock => clock,
			reset_n => reset_n,
			enable => enable,
			input => internal_2,
			output => output_register_3);
			
		output_register_0 <= internal_0;
		output_register_1 <= internal_1;
		output_register_2 <= internal_2;
end architecture;