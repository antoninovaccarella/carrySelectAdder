library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- un Carry-Select Adder a 16 bit è costituito da 3 Carry-Select Adder a 4 bit e 4 Full-Adder (ovvero un Ripple-Carry Adder a 4 bit).
                                                                                 
entity CSA16 is
    Port ( A : in STD_LOGIC_VECTOR (15 downto 0); --ingresso A del Carry-Select Adder a 16 bit
           B : in STD_LOGIC_VECTOR (15 downto 0); --ingresso B del Carry-Select Adder a 16 bit
	       Cin : in STD_LOGIC; --CARRY IN (in ingresso)
           S : out STD_LOGIC_VECTOR (16 downto 0); --somma S tra A e B
           Cout : out STD_LOGIC); --CARRY OUT (in uscita)
end CSA16;

architecture Behavioral of CSA16 is

signal p : STD_LOGIC_VECTOR (3 downto 0); 
signal Sum : STD_LOGIC_VECTOR(16 downto 0); --segnale delle somme parziali

component FA
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

component RCA4
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC);   
end component;

component CSA4
    Port( A: in STD_LOGIC_VECTOR (3 downto 0);
          B: in STD_LOGIC_VECTOR (3 downto 0);
	      Cin: in STD_LOGIC;
          S: out STD_LOGIC_VECTOR (3 downto 0);
          Cout : out STD_LOGIC);
end component;


begin 
--Ripple-Carry Adder a 4 bit
    RCA4_0 : RCA4 
        Port map(A(3 downto 0), B(3 downto 0), Cin, Sum(3 downto 0), p(0));
--Carry-Select Adder a 4 bit   
    CSA4_0 : CSA4   
        Port map(A(7 downto 4), B(7 downto 4), p(0), Sum(7 downto 4), p(1));
    CSA4_1 : CSA4 
        Port map(A(11 downto 8), B(11 downto 8), p(1), Sum(11 downto 8), p(2));
    CSA4_2 : CSA4
        Port map(A(15 downto 12), B(15 downto 12), p(2), Sum(15 downto 12), p(3));

-- Full Adder per gestire il riporto    
    FA0 : FA 
        Port map(A(15), B(15), p(3), Sum(16), Cout);
    S<=Sum;
    
end Behavioral;