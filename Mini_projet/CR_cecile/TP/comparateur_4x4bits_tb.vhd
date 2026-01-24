library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comparateur_4x4bits_tb is
end entity;

architecture arch of comparateur_4x4bits_tb is
    signal input_tb : std_logic_vector(15 downto 0) := "0000000000000000";
    signal code_tb : std_logic_vector(15 downto 0):= "0000000000000000";
    signal output_tb : std_logic := '0';

    signal finished : std_logic := '0';
begin
    
    -- this process define the simulation time
    sim_time_proc: process
    begin
        wait for 660 us;
        finished <= '1';
        wait;
    end process sim_time_proc;

    
    test: process
    begin
        code_tb <= x"beef"; -- le code
        wait for 10 ns;
        
        for i in 0 to 65535 loop
            input_tb <= std_logic_vector( signed(input_tb) + 1 );
            wait for 10 ns;
        end loop;
        
        report "End of test. Please verify that no error was reported.";
        
        wait;
    end process test;
    

    UUT : entity work.comparateur_4x4bits
    port map
    (
        input => input_tb,
        output => output_tb,
        code => code_tb
    );

end architecture arch;

