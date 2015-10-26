----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:37:07 07/06/2015 
-- Design Name: 
-- Module Name:    waveGenerator - Behavioral 
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

entity waveGenerator is
    Port ( pitch : in  STD_LOGIC_VECTOR (15 downto 0);
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           clk : in  STD_LOGIC;
           O : out  STD_LOGIC_VECTOR (15 downto 0));
end waveGenerator;

architecture Behavioral of waveGenerator is

begin


end Behavioral;

