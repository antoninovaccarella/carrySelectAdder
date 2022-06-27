library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- un Ripple-Carry Adder è costituito da 4 Full-Adder in cascata.

entity RCA4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --ingresso A del Ripple-Carry a 4 bit
           B : in STD_LOGIC_VECTOR (3 downto 0); --ingresso B del Ripple-Carry a 4 bit
           Cin : in STD_LOGIC; --CARRY IN (in ingresso)
           S : out STD_LOGIC_VECTOR (3 downto 0); --somma S tra A e B
           Cout : out STD_LOGIC); --CARRY OUT (in uscita
end RCA4;

architecture Behavioral of RCA4 is

signal c : STD_LOGIC_VECTOR(2 downto 0); --CARRY dei Full-Adder

component FA
    Port ( A : in STD_LOGIC;    
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

begin
    FA0 : FA 
	    Port map( A(0), B(0), Cin, S(0), c(0));
    FA1 : FA 
	    Port map( A(1), B(1), c(0), S(1), c(1));
    FA2 : FA 
	    Port map( A(2), B(2), c(1), S(2), c(2));
    FA3 : FA 
	    Port map( A(3), B(3), c(2), S(3), Cout); --Cout sarebbe c(3)
 
end Behavioral;

