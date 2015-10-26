----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:01:12 07/01/2015 
-- Design Name: 
-- Module Name:    segDispDriver - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity segDispDriver is
    Port ( clk  : in STD_LOGIC;
	        dig1 : in  STD_LOGIC_VECTOR (7 downto 0);
           dig2 : in  STD_LOGIC_VECTOR (7 downto 0);
           dig3 : in  STD_LOGIC_VECTOR (7 downto 0);
           dig4 : in  STD_LOGIC_VECTOR (7 downto 0);
           cat : out  STD_LOGIC_VECTOR (7 downto 0);
           an : out  STD_LOGIC_VECTOR (3 downto 0));
end segDispDriver;

architecture Behavioral of segDispDriver is
  signal anodes : STD_LOGIC_VECTOR (3 downto 0) := "0111";
  signal cntDiv : std_logic_vector(15 downto 0) := (others => '0'); 
begin
   process(clk, dig1, dig2, dig3, dig4)
	begin
		if (rising_edge(clk)) then
    		cntDiv <= cntDiv + 1;
			if (cntDiv = "1111111111111111") then
            anodes <= anodes(2 downto 0) & anodes(3);
         else
			   anodes <= anodes;
			end if;
			case anodes is
			  when "0111" => cat <= not dig1;
			  when "1011" => cat <= not dig2;
			  when "1101" => cat <= not dig3;
			  when "1110" => cat <= not dig4;
			  when others => cat <= (others => '0');
			end case;
		end if;
	end process;

   an <= anodes;
   
end Behavioral;

