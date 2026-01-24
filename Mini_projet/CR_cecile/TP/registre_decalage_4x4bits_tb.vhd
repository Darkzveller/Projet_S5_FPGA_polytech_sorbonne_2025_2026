library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registre_decalage_4x4bits_tb is
end entity registre_decalage_4x4bits_tb;

architecture arch of registre_decalage_4x4bits_tb is
    constant periode : time := 10 ns;
    signal enable_tb : std_logic;
    signal clock_tb : std_logic := '0';
    signal reset_n_tb : std_logic;
    signal input_tb : std_logic_vector(3 downto 0);
    signal output_0_tb : std_logic_vector(3 downto 0);
    signal output_1_tb : std_logic_vector(3 downto 0);
    signal output_2_tb : std_logic_vector(3 downto 0);
    signal output_3_tb : std_logic_vector(3 downto 0);
    
    signal finished : std_logic := '0';
    
begin
    
    -- ce processus limite le temps de simulation
    sim_time_proc: process
    begin
        wait for 1 us;
        finished <= '1';
        wait;
    end process sim_time_proc;
    
    clock : process
    begin
        while finished /= '1' loop
            clock_tb <= not clock_tb;
            wait for periode/2;
        end loop;
        wait;
    end process clock;
    
    test: process
    begin
        input_tb <= "1010"; -- a en premier
        reset_n_tb <= '1';
        enable_tb <= '0';
        
        
        for j in 0 to 5 loop
            if j = 5 then
                enable_tb <= '1';
            end if;
            wait for 11 ns;
            enable_tb <= '0';
        end loop;
        
        input_tb <= "1110";
        
        for j in 0 to 5 loop
            if j = 5 then
                enable_tb <= '1';
            end if;
            wait for 10 ns;
            enable_tb <= '0';
        end loop;
        
        input_tb <= "0001";
        
        for j in 0 to 5 loop
            if j = 5 then
                enable_tb <= '1';
            end if;
            wait for 10 ns;
            enable_tb <= '0';
        end loop;
        
        input_tb <= "1011";
        
        for j in 0 to 5 loop
            if j = 5 then
                enable_tb <= '1';
            end if;
            wait for 10 ns;
            enable_tb <= '0';
        end loop;
        
        wait for 10 ns;
        reset_n_tb <= '0';
        
        wait for 10 ns;
        reset_n_tb <= '1';
        
        for j in 0 to 5 loop
            if j = 5 then
                enable_tb <= '1';
            end if;
            wait for 10 ns;
            enable_tb <= '0';
        end loop;
        
        report "End of test. Verify that no error was reported.";
        
        wait;
    end process test;
    

    UUT : entity work.registre_decalage_4x4bits
    port map
    (
        enable => enable_tb,
        clock => clock_tb,
        reset_n => reset_n_tb,
        input => input_tb,
        output_register_0 => output_0_tb,
        output_register_1 => output_1_tb,
        output_register_2 => output_2_tb,
        output_register_3 => output_3_tb);

end architecture arch;

