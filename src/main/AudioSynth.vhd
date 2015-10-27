----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:56 06/30/2015 
-- Design Name: 
-- Module Name:    AudioSynth - Behavioral 
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
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity AudioSynth is
    Port ( clk : in  STD_LOGIC;
           JA : inout  STD_LOGIC_VECTOR (3 downto 0);
           KEYBO : in  STD_LOGIC_VECTOR (7 downto 0);
           KEYBI : out  STD_LOGIC_VECTOR (3 downto 0);
			  --btn : in  STD_LOGIC_VECTOR (3 downto 0);
			  led : out STD_LOGIC_VECTOR (7 downto 0);
			  cat : out STD_LOGIC_VECTOR (7 downto 0);
			  an  : out STD_LOGIC_VECTOR (3 downto 0));
end AudioSynth;

architecture Behavioral of AudioSynth is

  component keyboardDriver
  port(clk : in STD_LOGIC;
       --btn   : in STD_LOGIC_VECTOR (3 downto 0);
       KEYBO : in  STD_LOGIC_VECTOR (7 downto 0);
       KEYBI : out  STD_LOGIC_VECTOR (3 downto 0);
       keyBank1 : out  STD_LOGIC_VECTOR (7 downto 0);
       keyBank2 : out  STD_LOGIC_VECTOR (7 downto 0);
       keyBank3 : out  STD_LOGIC_VECTOR (7 downto 0);
       keyBank4 : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;

  component keyMatrixLED
  port(keyMatrix : in  STD_LOGIC_VECTOR (31 downto 0);
       led : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;

  component segDispDriver
  port(clk : in STD_LOGIC;
       dig1 : in  STD_LOGIC_VECTOR (7 downto 0);
       dig2 : in  STD_LOGIC_VECTOR (7 downto 0);
       dig3 : in  STD_LOGIC_VECTOR (7 downto 0);
       dig4 : in  STD_LOGIC_VECTOR (7 downto 0);
       cat : out  STD_LOGIC_VECTOR (7 downto 0);
		 an  : out  STD_LOGIC_VECTOR (3 downto 0));
  end component;

  component periodMap
  port ( clk : in STD_LOGIC;
         key : in  STD_LOGIC_VECTOR (31 downto 0);
         sig : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;

  component PWM
  port ( clk : in  STD_LOGIC;
         input : in  STD_LOGIC_VECTOR (7 downto 0);
         output : out  STD_LOGIC);
  end component;
  
  signal keyBank1 : STD_LOGIC_VECTOR (7 downto 0);
  signal keyBank2 : STD_LOGIC_VECTOR (7 downto 0);
  signal keyBank3 : STD_LOGIC_VECTOR (7 downto 0);
  signal keyBank4 : STD_LOGIC_VECTOR (7 downto 0);

  signal keyMatrix : STD_LOGIC_VECTOR (31 downto 0);
  
  signal sig: STD_LOGIC_VECTOR(7 downto 0);
  
begin
  keyboardDriverInstance: keyboardDriver port map (
    clk => clk,
	 --btn => btn,
	 KEYBO => KEYBO,
	 KEYBI => KEYBI,
	 keyBank1 => keyBank1,
	 keyBank2 => keyBank2,
	 keyBank3 => keyBank3,
	 keyBank4 => keyBank4
  );
  
  ledDriverInstance: keyMatrixLED port map (
    keyMatrix => keyMatrix,
	 led => led
  );

  segDispDriverInstance: segDispDriver port map (
    clk => clk,
	 dig1 => keyBank1,
    dig2 => keyBank2,
    dig3 => keyBank3,
    dig4 => keyBank4,
	 cat => cat,
	 an => an
  );

  periodMapInstance: periodMap port map (
    clk => clk,
	 key => keyMatrix,
    sig => sig
  );

  PWMInstance : PWM port map (
    clk => clk,
    input => sig,
    output => JA(0)
  );

  JA(2) <= JA(0);
  JA(1) <= '0';  
  JA(3) <= '0';  
	
  keyMatrix <= keyBank1 & keyBank2 & keyBank3 & keyBank4;

end Behavioral;

