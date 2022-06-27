library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_1 is
    Port ( A : in STD_LOGIC; --ingresso A del Multiplexer
   	       B : in STD_LOGIC; --ingresso B del Multiplexer
  	       inA : in STD_LOGIC; --ingresso di selezione
	       Cout : out STD_LOGIC); --uscita del Multiplexer
end MUX2_1;

architecture Behavioral of MUX2_1 is

begin        
    Cout <= A when (inA='0') else    
            B when (inA='1') else 'X';
end Behavioral;