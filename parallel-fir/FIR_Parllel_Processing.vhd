----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:11:33 10/12/2026 
-- Design Name: 
-- Module Name:    FIR_Parllel_Processing - Behavioral 
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


entity FIR_Parllel_Processing is
    Port (
        x_3k2, x_3k1, x_3k : in STD_LOGIC_VECTOR(3 downto 0);
        a, b, c : in STD_LOGIC_VECTOR(3 downto 0);
        cin, clk : in STD_LOGIC;
        cout : out STD_LOGIC_VECTOR(5 downto 0);
        y_3k2, y_3k1, y_3k : out STD_LOGIC_VECTOR(7 downto 0)
    );
end FIR_Parllel_Processing;


architecture Behavioral of FIR_Parllel_Processing is

component RCA_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end component;




component Four_bit_multiplier is
    Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end component;



component DFF is
      Port ( d : in  STD_LOGIC_VECTOR(3 downto 0);
	 clk: in STD_LOGIC;
           q : out  STD_LOGIC_VECTOR(3 downto 0));
end component;


Signal s3,s2,s1,a1,s3a,s2a,s1a,a1a,s3b,s2b,s1b,a1b : STD_LOGIC_VECTOR(7 downto 0);
Signal x_3k2a,x_3k1a : STD_LOGIC_VECTOR(3 downto 0);
begin

MUL3: Four_bit_multiplier port map (x_3k,c,s3);

MUL2: Four_bit_multiplier port map (x_3k1,b,s2);

MUL1: Four_bit_multiplier port map (x_3k2,a,s1);

ADDER1: RCA_8bit port map(s1,s2,cin,a1,cout(0));

ADDER2: RCA_8bit port map(s3,a1,cin,y_3k2,cout(1));

MUL3a: Four_bit_multiplier port map (x_3k,b,s3a);

MUL2a: Four_bit_multiplier port map (x_3k1,a,s2a);

DFF1: DFF port map (x_3k2,clk,x_3k2a);

MUL1a: Four_bit_multiplier port map (x_3k2a,c,s1a);

ADDER1a: RCA_8bit port map(s1a,s2a,cin,a1a,cout(2));

ADDER2a: RCA_8bit port map(s3a,a1a,cin,y_3k1,cout(3));

MUL3b: Four_bit_multiplier port map (x_3k,a,s3b);

DFF2: DFF port map (x_3k1,clk,x_3k1a);

MUL2b: Four_bit_multiplier port map (x_3k1a,c,s2b);

MUL1b: Four_bit_multiplier port map (x_3k2a,b,s1b);

ADDER1b: RCA_8bit port map(s1b,s2b,cin,a1b,cout(4));

ADDER2b: RCA_8bit port map(s3b,a1b,cin,y_3k,cout(5));













end Behavioral;

