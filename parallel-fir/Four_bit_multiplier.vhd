----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:22:35 09/28/2026 
-- Design Name: 
-- Module Name:    Four_bit_multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_bit_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end Four_bit_multiplier;

architecture Behavioral of Four_bit_multiplier is

component half_adder is
    Port ( x,y : in  STD_LOGIC;
           carry,sum : out  STD_LOGIC);
end component;

Component Full_Adder is
    Port ( a,b,cin : in  STD_LOGIC;
           sum,cout : out  STD_LOGIC);
end Component;



Signal c11, c12, c13, s11, s12, c21, c22, c23,  s21, s22, c31, c32, c33, s31, s32, c41, c42, c43  : STD_LOGIC;


begin




P(0)<= A(0) and B(0);

HA1: half_adder port map ((A(1) and B(0)), (A(0)and B(1)), c11, P(1));

FA1: Full_Adder port map ((A(1) and B(1)), (A(2) and B(0)), c11, s11, c12 );

FA2: Full_Adder port map ((A(3) and B(0)), (A(2) and B(1)), c12, s12, c13 );

HA2: half_adder port map ((A(0) and B(2)), s11, c21, P(2));

FA3: Full_Adder port map ((A(1) and B(2)), s12, c21, s21, c22 );

FA4: Full_Adder port map ((A(3) and B(1)), c13, c22, s22, c23 );

HA3: half_adder port map ((A(0) and B(3)), s21, c31, P(3));

FA5: Full_Adder port map ((A(2) and B(2)), s22, c31, s31, c32 );

FA6: Full_Adder port map ((A(3) and B(2)), c23, c32, s32, c33 );

HA4: half_adder port map ((A(1) and B(3)), s31, c41, P(4));

FA7: Full_Adder port map ((A(2) and B(3)), s32, c41, P(5), c42 );

FA8: Full_Adder port map ((A(3) and B(3)), C33, c42, P(6), P(7));


end Behavioral;

