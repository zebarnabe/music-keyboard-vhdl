----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:36:39 06/30/2015 
-- Design Name: 
-- Module Name:    keyboardDriver - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyboardDriver is
    Port ( clk : in  STD_LOGIC;
	        --btn : in  STD_LOGIC_VECTOR (3 downto 0);
           KEYBO : in  STD_LOGIC_VECTOR (7 downto 0);
           KEYBI : out  STD_LOGIC_VECTOR (3 downto 0);
           keyBank1 : out  STD_LOGIC_VECTOR (7 downto 0);
           keyBank2 : out  STD_LOGIC_VECTOR (7 downto 0);
           keyBank3 : out  STD_LOGIC_VECTOR (7 downto 0);
           keyBank4 : out  STD_LOGIC_VECTOR (7 downto 0));
end keyboardDriver;

architecture Behavioral of keyboardDriver is
  subtype keybuffer is STD_LOGIC_VECTOR(7 downto 0);
  
  signal keybuffer1 : keybuffer := (others => '0');
  signal keybuffer2 : keybuffer := (others => '0');
  signal keybuffer3 : keybuffer := (others => '0');
  signal keybuffer4 : keybuffer := (others => '0');
  
  signal clkDiv    : STD_LOGIC_VECTOR (11 downto 0) := (others => '0');
begin
  process (clk, KEYBO)
  begin
    if (rising_edge(clk)) then 
   	clkDiv <= clkDiv+1;
	   case clkDiv(11 downto 9) is
		  when "000" => 
   		  KEYBI <= "1000";
		  when "001" => 
		     keybuffer1 <= KEYBO;
		  when "010" => 
   		  KEYBI <= "0100";
		  when "011" => 
		     keybuffer2 <= KEYBO;		  
		  when "100" => 
   		  KEYBI <= "0010";
		  when "101" => 
		     keybuffer3 <= KEYBO;		  
		  when "110" => 
   		  KEYBI <= "0001";
		  when "111" => 
		     keybuffer4 <= KEYBO;
        when others => null;			  
      end case;
	 end if;
  end process;

--  keyBus <= keybuffer1 & keybuffer2 & keybuffer3 & keybuffer4;
  keyBank1 <= keybuffer1;
  keyBank2 <= keybuffer2;
  keyBank3 <= keybuffer3;
  keyBank4 <= keybuffer4;
  
end Behavioral;

