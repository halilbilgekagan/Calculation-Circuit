library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity my_4_mux is
    port(
        D4,D3,D2,D1 : in unsigned(11 downto 0);
        S1,S2 : in std_logic;
        MX_OUT : out unsigned(11 downto 0)
        );
end my_4_mux;

architecture mux4tl_2 of my_4_mux is
    signal s1_s2 : std_logic_vector(1 downto 0);
begin
    s1_s2 <= S1 & S2;
    process (s1_s2)
    begin 
        case (s1_s2) is 
            when "00" => MX_OUT <= D1;
            WHEN "01" => MX_OUT <= D2;
            WHEN "10" => MX_OUT <= D3;
            WHEN "11" => MX_OUT <= D4;
            WHEN OTHERS => MX_OUT <= (others => '0');
        end case;
    end process;
end mux4tl_2;