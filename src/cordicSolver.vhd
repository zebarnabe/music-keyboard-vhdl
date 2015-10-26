----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:54:22 07/06/2015 
-- Design Name: 
-- Module Name:    cordicSolver - Behavioral 
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

entity cordicSolver is
    Port ( clk : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (15 downto 0);
           A : out  STD_LOGIC_VECTOR (15 downto 0);
           B : out  STD_LOGIC_VECTOR (15 downto 0);
           Ready : out  STD_LOGIC);
end cordicSolver;

architecture Behavioral of cordicSolver is
  constant precision : integer := 16; -- 16 bit precision
  constant angleATAN : integer  := round(arctan(1)*(2**16/2-1));
  signal sigma : STD_LOGIC := '1';
begin


end Behavioral;

