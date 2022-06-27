library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--un Carry-Select Adder a 4 bit è costituito da 2 Ripple-Carry Adder a 4 bit e 5 Multiplexer.

entity CSA4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --ingresso A del Carry-Select Adder a 4 bit
           B : in STD_LOGIC_VECTOR (3 downto 0); --ingresso B del Carry-Select Adder a 4 bit
	       Cin : in STD_LOGIC; --CARRY IN (in ingresso)
           S : out STD_LOGIC_VECTOR (3 downto 0); --somma S tra A e B
           Cout : out STD_LOGIC); --CARRY OUT (in uscita)
end CSA4;

architecture Behavioral of CSA4 is

signal p, q : STD_LOGIC_VECTOR(3 downto 0); -- somme in uscita dei Full-Adder all'interno dei Ripple-Carry Adder
signal c0, c1 : STD_LOGIC; --CARRY OUT (in uscita) rispettivamente di RCA4_0 e RCA4_1

component MUX2_1
    Port( A : in STD_LOGIC;
  	      B : in STD_LOGIC;
          inA : in STD_LOGIC;
	      Cout: out STD_LOGIC);
end component;

component RCA4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);   
end component; 

begin 

-- Ripple-Carry Adder
    RCA4_0 : RCA4 
        Port map(A(3 downto 0), B(3 downto 0), '0', p(3 downto 0), c0);
    RCA4_1 : RCA4 
        Port map(A(3 downto 0), B(3 downto 0), '1', q(3 downto 0), c1);
        
-- Multiplexer delle somme dei Ripple-Carry Adder
    MUX0 : MUX2_1 
        Port map(p(0), q(0), Cin, S(0));
    MUX1 : MUX2_1 
        Port map(p(1), q(1), Cin, S(1));
    MUX2 : MUX2_1 
        Port map(p(2), q(2), Cin, S(2));
    MUX3 : MUX2_1 
        Port map(p(3), q(3), Cin, S(3));
        
-- Multiplexer dei CARRY dei due Ripple-Carry Adder
    MUX_OUT : MUX2_1 
        Port map(c0, c1, Cin, Cout);
 
end Behavioral;