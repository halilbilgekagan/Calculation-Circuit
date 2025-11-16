library IEEE;
use IEEE.std_logic_1164.all;

entity input_register is

    port ( 
        A_in, B_in, C_in, D_in : in std_logic_vector(3 downto 0);
        S1_in, S2_in, CLK : in std_logic;
        reg_A, reg_B, reg_C, reg_D : out std_logic_vector(3 downto 0);
        reg_S1, reg_S2 : out std_logic
        );
end input_register;

architecture register1 of input_register is 

begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            reg_A <= A_in;
            reg_B <= B_in; 
            reg_C <= C_in;
            reg_D <= D_in; 
            reg_S1 <= S1_in; 
            reg_S2 <= S2_in;
        end if;
    end process;
end register1;              