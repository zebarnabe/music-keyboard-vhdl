----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:48 07/06/2015 
-- Design Name: 
-- Module Name:    sigmaDeltaPWMEncoder - Behavioral 
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

entity sigmaDeltaPWMEncoder is
    Port ( clk : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (15 downto 0);
           O : out  STD_LOGIC);
end sigmaDeltaPWMEncoder;

architecture Behavioral of sigmaDeltaPWMEncoder is
  constant integrationSlope : integer := 15;
  constant deltaThreshold : integer := 15;
  signal sigmaDelta : std_logic_vector (15 downto 0);
begin
  -- 

end Behavioral;

