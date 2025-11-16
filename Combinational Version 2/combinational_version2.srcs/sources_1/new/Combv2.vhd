library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comb is
    port(
            A, B, C, D : in unsigned(3 downto 0);
            CLK : in std_logic;
            D1, D2, D3, D4 : out unsigned(11 downto 0)
            );
end entity;

architecture comb_1 of comb is
    signal sum_mod_5, cube_mod_4, divide_4, cube_mod_6 : unsigned(11 downto 0);
    signal temp_sig : unsigned(11 downto 0) := (others => '0');
    signal reg1,reg2,reg3,reg4: unsigned(11 downto 0) := (others => '0');
    signal reg_Q1, reg_Q2, reg_Q3, reg_Q4: unsigned(11 downto 0) := (others => '0');
    signal temp_sum, temp_a, temp_b, temp_d: unsigned(4 downto 0);
    signal temp_c_cube, temp_d_time, temp_div: unsigned(11 downto 0);
    signal temp_c_time, temp_ab_time: unsigned(7 downto 0);
begin
    
        temp_b <= '0' & unsigned(B);
        temp_a <= '0' & unsigned(C);
        temp_d <= '0' & unsigned(D);
        
        sum_mod_5 <= resize(((temp_a + temp_b) mod 5),12);
        reg1 <= sum_mod_5;
        
        temp_c_cube <= unsigned(C)*unsigned(C)*unsigned(C);
        cube_mod_4 <= resize((temp_c_cube mod 4),12);
        reg2 <= cube_mod_4;
        
        temp_div <= resize((temp_a +temp_d),12);
        divide_4 <= resize((temp_div * unsigned(B)),12);
        temp_sig <= resize((divide_4(11 downto 2)),12);
        reg3 <= temp_sig;
        
        temp_c_time <= unsigned(C) * unsigned(C);
        temp_d_time <= unsigned(D)*unsigned(D)*unsigned(D);
        temp_ab_time <= unsigned(A) * unsigned(B);
        cube_mod_6 <= resize((temp_c_time + temp_d_time + (temp_ab_time mod 6)),12);
        reg4 <= cube_mod_6;
    process(CLK)
    begin
        if rising_edge(CLK) then
            reg_Q1 <= reg1;
            reg_Q2 <= reg2;
            reg_Q3 <= reg3;
            reg_Q4 <= reg4;
        end if;
    end process;
    D1 <= reg_Q1;
    D2 <= reg_Q2;
    D3 <= reg_Q3;
    D4 <= reg_Q4;
end comb_1;
    
    
    