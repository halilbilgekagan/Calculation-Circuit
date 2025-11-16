library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity output_register is

    port (
        CLK : in std_logic;
        Q1 : unsigned(11 downto 0);
        Y1 : out std_logic_vector(11 downto 0)
        );
end output_register;

architecture register2 of output_register is
    signal reg_Y : std_logic_vector(11 downto 0);
begin
    process(CLK)
    begin
        if rising_Edge(CLK) then
            reg_Y <= std_logic_vector(Q1);
        end if;
    end process;
    Y1 <= reg_Y;
end register2;
   