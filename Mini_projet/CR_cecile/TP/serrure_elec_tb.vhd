library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity serrure_elec_tb is
end entity;

architecture arch of serrure_elec_tb is
    constant periode : time := 1 ns;
    
    signal clock_tb : std_logic := '0';
    signal reset_n_tb : std_logic := '1';
    signal ouverture_tb : std_logic;
    
    signal input_bouton_tb : std_logic := '0';
    signal input_interrupteurs_tb : std_logic_vector(3 downto 0) := x"0";
    
    signal afficheur_7_segments_0_tb : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    signal afficheur_7_segments_1_tb : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    signal afficheur_7_segments_2_tb : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    signal afficheur_7_segments_3_tb : STD_LOGIC_VECTOR(6 downto 0) := "0000000";
    
    signal finished : std_logic := '0';
begin
    
    -- ce processus limite le temps de simulation
    sim_time_proc: process
    begin
        wait for 130 ns;
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
        
        input_interrupteurs_tb <= "0001";
        
        wait for 10 ns;
        input_bouton_tb <= '1';
        wait for 10 ns;
        input_bouton_tb <= '0';
        
        input_interrupteurs_tb <= "0010";
        
        wait for 10 ns;
        input_bouton_tb <= '1';
        wait for 10 ns;
        input_bouton_tb <= '0';
        
        input_interrupteurs_tb <= "0011";
        
        wait for 10 ns;
        input_bouton_tb <= '1';
        wait for 10 ns;
        input_bouton_tb <= '0';
        
        input_interrupteurs_tb <= "0100";
        
        wait for 10 ns;
        input_bouton_tb <= '1';
        wait for 10 ns;
        input_bouton_tb <= '0';
        
        wait for 10 ns;
        reset_n_tb <= '0';
        wait for 10 ns;
        reset_n_tb <= '1';
        
        wait for 10 ns;
        report "End of test. Please verify that no error was reported.";
        wait;
    end process test;
    
    UUT : entity work.serrure_electronique
    port map
    (
        input_interrupteurs => input_interrupteurs_tb,
        input_bouton => input_bouton_tb,
        afficheur_7_segments_0 => afficheur_7_segments_0_tb,
        afficheur_7_segments_1 => afficheur_7_segments_1_tb,
        afficheur_7_segments_2 => afficheur_7_segments_2_tb,
        afficheur_7_segments_3 => afficheur_7_segments_3_tb,
        reset_n => reset_n_tb,
        clock => clock_tb,
        ouverture => ouverture_tb
    );

end architecture arch;

