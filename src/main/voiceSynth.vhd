----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:34:41 10/24/2015 
-- Design Name: 
-- Module Name:    voiceSynth - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity voiceSynth is
    Port ( clk : in  STD_LOGIC;
	        enable : in  STD_LOGIC;
           period : in  unsigned (15 downto 0);
           sig    : out  STD_LOGIC_VECTOR (7 downto 0));
end voiceSynth;

architecture Behavioral of voiceSynth is
constant clkDiv: integer := 4;
-- Nexys 2 runs at 50,000,000 Mhz..
-- Sample clock at 3125000Hz.
 
signal counter: std_logic_vector(16 + clkDiv downto 0);

begin

clkCounter: process(clk, period, enable)
begin
	if rising_edge(clk) then
		if (counter(counter'left downto clkDiv) < '0'&std_logic_vector(period)) and (enable = '1') then
		  counter <= std_logic_vector(unsigned(counter) + 1);
      else
		  counter <= (others => '0');
		end if;
	end if;
end process;

synth: process(counter, period)
begin
	if counter(16 + clkDiv downto clkDiv) > ('0' & std_logic_vector(period/2)) then
		sig <= (others => '1');
	else
		sig <= (others => '0');
	end if;
end process;

end Behavioral;

