library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FIR_Filter_tb is
end FIR_Filter_tb;

architecture Behavioral of FIR_Filter_tb is

component FIR_Filter
    Port ( Xn,c,b,a : in  STD_LOGIC_VECTOR (3 downto 0);
           clk, cin : in  STD_LOGIC;
           cout : out STD_LOGIC_VECTOR(1 downto 0);
           Yn : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Xn : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal c  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal b  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal a  : STD_LOGIC_VECTOR(3 downto 0) := "0000";

signal clk : STD_LOGIC := '0';
signal cin : STD_LOGIC := '0';

signal cout : STD_LOGIC_VECTOR(1 downto 0);
signal Yn   : STD_LOGIC_VECTOR(7 downto 0);

begin

UUT: FIR_Filter
    port map (
        Xn   => Xn,
        c    => c,
        b    => b,
        a    => a,
        clk  => clk,
        cin  => cin,
        cout => cout,
        Yn   => Yn
    );

clk_process: process
begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
end process;

stimulus: process
begin

    Xn  <= "0010";
    c   <= "0010";
    b   <= "0011";
    a   <= "0100";
    cin <= '0';

    wait for 40 ns;

    Xn  <= "0011";
    c   <= "0010";
    b   <= "0011";
    a   <= "0100";
    cin <= '0';

    wait for 40 ns;

    Xn  <= "0100";
    c   <= "0010";
    b   <= "0011";
    a   <= "0100";
    cin <= '0';

    wait for 40 ns;

    Xn  <= "0101";
    c   <= "0010";
    b   <= "0011";
    a   <= "0100";
    cin <= '0';

    wait for 40 ns;

    wait;

end process;

end Behavioral;