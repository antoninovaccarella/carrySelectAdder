library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;  -- ARITH = aritmetica
library work; --directory in cui si trova il progetto attuale
use work.myfunc.all; --funzione ausiliaria

entity SimCSA16 is
--  Port ( );
end SimCSA16;

architecture Behavioral of SimCSA16 is
component CSA16 is
        Port ( A : in STD_LOGIC_VECTOR (15 downto 0);
               B : in STD_LOGIC_VECTOR (15 downto 0);
               Cin : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (16 downto 0);
               Cout : out STD_LOGIC);
end component;

--Input
signal A : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal B : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
signal Cin : std_logic := '0';

--Output
signal S : STD_LOGIC_VECTOR(16 downto 0);
signal Cout : STD_LOGIC;

begin
circuito: CSA16 
              Port map( A => A,
                        B => B,
                        Cin => Cin,
                        S => S,
                        Cout => Cout);
process

begin
--t=0
wait for 20 ns;
--t=20
    
    -- utilizzo del for loop (versione sequenziale del for), di default va è un int, quindi con l'aiuto di ARITH lo convertiamo in STD_LOGIC 
    -- da -(2^(15)) : (2^(15))-1
    -- simulazioe esaustiva (di tutti i possibili valori degli operandi)
      for va in (-pow2(15)) to (pow2(15)-1) loop  --numero di bit= 16 bit, quindi il for va da -32768 a 32767
          A<=conv_std_logic_vector(va, 16);
          for vb in (-pow2(15)) to (pow2(15)-1) loop  
              B<=conv_std_logic_vector(vb, 16);
              wait for 10 ns;
          end loop;
      end loop;
   
    end process;
        
end Behavioral;