library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.numeric_std.ALL;

entity my_circuit is 
    port( 
        A,B,C,D : in std_logic_vector(3 downto 0);
        S1,S2,CLK : in std_logic;
        Y : out std_logic_vector(11 downto 0)
        );
end my_circuit;

architecture circuit of my_circuit is
    component input_register is
        port(
            A_in, B_in, C_in, D_in : in std_logic_vector(3 downto 0);
            S1_in, S2_in, CLK : in std_logic;
            reg_A, reg_B, reg_C, reg_D : out std_logic_vector(3 downto 0);
            reg_S1, reg_S2 : out std_logic
            );
    end component;
    
    component comb is  
        port(
            A,B,C,D : in std_logic_vector(3 downto 0);
            S1,S2 : in std_logic;
            Q : out std_logic_vector(11 downto 0)
            );
    end component;
    
    component output_register is
        port(
            CLK : in std_logic;
            Q1 : in std_logic_vector(11 downto 0);
            Y1 : out std_logic_vector(11 downto 0)
            );
    end component;
    
    signal reg_A, reg_B, reg_C, reg_D : std_logic_vector(3 downto 0);
    signal comb_Q : std_logic_vector(11 downto 0);
    signal reg_S1, reg_S2 : std_logic;
    signal Y_internal : std_logic_vector(11 downto 0);
 
begin
    x1: input_register
        port map(
            A_in => A,
            B_in => B,
            C_in => C,
            D_in => D,
            S1_in => S1,
            S2_in => S2,
            CLK => CLK,
            reg_A => reg_A,
            reg_B => reg_B,
            reg_C => reg_C,
            reg_D => reg_D,
            reg_S1 => reg_S1,
            reg_S2 => reg_S2
            );
    x2: comb
        port map (
            A => reg_A,
            B => reg_B,
            C => reg_C,
            D => reg_D,
            S1 => reg_S1,
            S2 => reg_S2,
            Q => comb_Q
            );
    x3: output_register
        port map (
            CLK => CLK,
            Q1 => comb_Q,
            Y1 => Y_internal
            );
    Y <= Y_internal;
end circuit;
             
   
    
       
            
        
