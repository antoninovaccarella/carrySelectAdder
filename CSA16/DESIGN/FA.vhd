library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FA is
    Port ( A : in STD_LOGIC; --ingresso A
           B : in STD_LOGIC; --ingresso B
           Cin : in STD_LOGIC; --CARRY IN (in ingresso)
           S : out STD_LOGIC; --somma S tra A e B
           Cout : out STD_LOGIC); --CARRY OUT (in uscita)
end FA;

architecture Behavioral of FA is

begin
    S <= A XOR B XOR Cin ;
    Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);
end Behavioral;