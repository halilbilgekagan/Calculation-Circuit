library IEEE;
use IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;

entity comb is
    
    port(
        A,B,C,D : in std_logic_vector(3 downto 0);
        S1, S2 : in std_logic;
        Q : out std_logic_vector(11 downto 0)
        );
end comb;

architecture comb_1 of comb is
    
    signal s1_s2 : std_logic_vector(1 downto 0) :=(others => '0');
    signal cube_mod_4 : std_logic_vector (11 downto 0) := (others => '0');
    signal sum_mod_8: std_logic_vector(4 downto 0);
    signal temp_multp3 : std_logic_vector(7 downto 0);
    signal divide_4 : std_logic_vector(8 downto 0);
    signal cube_mod_16 : std_logic_vector(11 downto 0);
    signal temp_mod_1 : std_logic_vector(2 downto 0);
    signal temp_mod_2 : std_logic_vector(1 downto 0);
    signal temp_mod_3 : std_logic_vector(3 downto 0);
    signal temp_sig :std_logic_vector(6 downto 0);
    signal temp_q1, temp_q2, temp_q3, temp_q4 : std_logic_vector(11 downto 0);
    
begin
        s1_s2 <= S1 & S2;
       
        sum_mod_8 <= ('0' & A) + ('0' & B);
        temp_mod_1 <= sum_mod_8 (2 downto 0);
        temp_q1 <= ("000000000" & temp_mod_1);
    
        cube_mod_4 <= (C*C*C);
        temp_mod_2 <= cube_mod_4(1 downto 0);
        temp_q2 <= ("0000000000" & temp_mod_2);
    
        divide_4 <= (('0' & A) + ('0' & D) *B);
        temp_sig <= divide_4(8 downto 2);
        temp_q3 <= ("00000" & temp_sig);
    
        temp_multp3 <= A*B;
        temp_mod_3 <= temp_multp3(3 downto 0);
        cube_mod_16 <= (C*C) + (D*D*D) + ("00000000" & temp_mod_3);
        temp_q4 <= cube_mod_16;
        
        with s1_s2 select
            Q <= temp_q1 when "00",              
                temp_q2 when "01",
                temp_q3 when "10",
                temp_q4 when others;  
end comb_1;
            
        