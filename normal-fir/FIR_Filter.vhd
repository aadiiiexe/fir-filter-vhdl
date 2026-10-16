----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:13:01 10/06/2026 
-- Design Name: 
-- Module Name:    FIR_Filter - Behavioral 
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

entity FIR_Filter is
    Port ( Xn,c,b,a : in  STD_LOGIC_VECTOR (3 downto 0);
	        clk, cin : in STD_LOGIC;
			  cout : out STD_LOGIC_VECTOR(1 downto 0);
           Yn : out  STD_LOGIC_VECTOR (7 downto 0));
end FIR_Filter;

architecture Behavioral of FIR_Filter is

component Four_bit_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end component;


component RCA_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end component;




component DFF is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           q : out  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC);
end component;




Signal p,q,r,x,y,z : STD_LOGIC_VECTOR (7 downto 0);







begin


MUL1: Four_bit_multiplier port map ( Xn, c, p);

DFF1: DFF port map (p,x,clk);


MUL2: Four_bit_multiplier port map ( Xn, b, q);


ADDER1: RCA_8bit port map ( x,q, cin, y, cout(1));


DFF2: DFF port map (y,z,clk);


MUL3: Four_bit_multiplier port map ( Xn, a, r);


ADDER2: RCA_8bit port map ( z,r, cin, Yn, cout(0));






end Behavioral;

