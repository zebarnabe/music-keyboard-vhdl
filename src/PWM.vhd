----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:57:59 10/23/2015 
-- Design Name: 
-- Module Name:    PWM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PWM is
    Port ( clk : in  STD_LOGIC;
           input : in  STD_LOGIC_VECTOR (7 downto 0);
           output : out  STD_LOGIC);
end PWM;

architecture Behavioral of PWM is
constant ckPwmRange: integer := 2;
-- Nexys 2 runs at 50Mhz, the PMOD Amp1 has a pass band...
 
signal counter: std_logic_vector(ckPwmRange + 8 downto 0);

begin

PwmCounter: process(clk)
begin
	if rising_edge(clk) then
		counter <= counter + '1';
	end if;
end process;

PWM: process(counter, input)
begin
	if counter(ckPwmRange+8 downto ckPwmRange) < input then
		output <= '1';
	else
		output <= '0';
	end if;
end process;

end Behavioral;

