----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:37:07 10/05/2026 
-- Design Name: 
-- Module Name:    RCA_8bit - Behavioral 
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

entity RCA_8bit is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end RCA_8bit;

architecture Behavioral of RCA_8bit is

    component Full_Adder is
        Port (
            a, b, cin : in STD_LOGIC;
            sum, cout : out STD_LOGIC
        );
    end component;

    signal c : STD_LOGIC_VECTOR(8 downto 0);

begin

  c(0) <= Cin;

    FA0 : Full_Adder
        port map(A(0), B(0), c(0), Sum(0), c(1));

    FA1 : Full_Adder
        port map(A(1), B(1), c(1), Sum(1), c(2));

    FA2 : Full_Adder
        port map(A(2), B(2), c(2), Sum(2), c(3));

    FA3 : Full_Adder
        port map(A(3), B(3), c(3), Sum(3), c(4));
		  
		     FA4 : Full_Adder
        port map(A(4), B(4), c(4), Sum(4), c(5));

    FA5 : Full_Adder
        port map(A(5), B(5), c(5), Sum(5), c(6));

    FA6 : Full_Adder
        port map(A(6), B(6), c(6), Sum(6), c(7));

    FA7 : Full_Adder
        port map(A(7), B(7), c(7), Sum(7), c(8));

    Cout <= c(8);
	 
	 end Behavioral;

